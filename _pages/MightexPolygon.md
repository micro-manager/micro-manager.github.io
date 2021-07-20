{| style="text-align:left"
!valign="top"|Summary:
|Interfaces with [http://www.mightexsystems.com/family_info.php?cPath=245_243&categories_id=243 Mightex Polygon400] multiwavelength patterned illuminators.
|- valign="top"
!Author:
| 
|- valign="top"
!Documentation:
| 
|- valign="top"
!License:
| Proprietary/closed source, Copyright Mightex Systems, 2015
|-
!Platforms:
| Windows
|- valign="top"
! Devices:
| Polygon400
|}
----

(See also: the [[Mightex Polygon Plugin]].)

(Documentation to be written.)

You will need to copy MT_POLYGON400_IMGC.DLL and MT_Polygon400_SDK.DLL from your MightEx folder into µManager's folder in order for the device adapter to load. In the Mightex folder there is also a folder MT_Polygon400_SDK/, and in there one (or more) subfolders with names similar to DSIGeeeeeeeeeeeeLAP1014103100/. You will need to copy the entire MT_Polygon400_SDK/ folder to the root of the micromanager folder as well.

Note: For some weird reason, on Windows the device will show up in the Device Manager as some sort of network controller.

See [http://micro-manager.3463995.n2.nabble.com/MightEx-Polygon-device-can-t-install-td7585963.html#a7585978 this thread].

Notes for Polygon1000:
* After installation, the device could not be found by PolyScan2 (application provided by Mightex).  The device showed up as  "libus-win32 device"  - "Unprogrammed Cypress FX3".  It showed up as something Andor related (I have the feeling that Mightex and Andor used the same USB VID/PID, causing these issues). Clicking on "Update driver", and locating the driver (Tools > Drivers > Polygon1000 > Win10_x64) resulted in a workable driver (shows up as "Universal Serial Bus Controllers > Cypress FX3 StreamerExample Device).  THis device is recognized by PolyScan2.
* Copied MT_Polygon400_SDK from the provided USB drive into the Micro-Manager application directory.
* Copied mt_polygon1000_sdd.dll, MT_Polygon1000_SDK.dll, Mightex_BLSDriver_SDK.dll, and the Polygon did not appear in the HCW.  After copying MT_Polygon400_IMGC.dll and MT_Polgon400_SDK.dll into the Micro-Manager directory, it did appear.  However, after selecting it the application reports: "Error in device "MightexPolygon": Unable to communicate with the device. (35).
Stuck for now...

{{Listserv_Search|Polygon}}

{{Devices_Sidebar}}
