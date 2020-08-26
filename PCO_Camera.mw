== PCO generic camera interface ==

<table><tr><td>
'''Summary:'''</td><td>Controls [http://www.pco.de/ PCO Cameras]</td></tr>
<tr><td>'''Author:'''</td><td>Franz Reitner PCO AG (adapter), Thomas Bauersachs PCO AG (comments)</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Devices:'''</td><td>
           pco.panda, pco.edge, pco.dimax S/HD/HS, pco.dimax cs, pco.ultraviolet, pco.pixelfly usb, pco.flim, pco.1200/1300/1400/1600/2000/4000</td></tr>
<tr><td>'''New:'''</td><td>Camera Link HS interface, Lightsheet mode</td></tr>

<tr><td>'''Available since version:'''</td><td>1.3.24</td></table>


This adapter has been developed for all pco.sdk based camera systems (B/W and color versions).

Installation:<BR>
a) download and install latest Micro-Manager Nightly build version<BR>
b) add PCO camera specific dll files to your Micro-Manager directory<BR> 
_______________________________________________________________

Files needed for all pco.sdk based cameras:
  pco_conv.dll
  pco_cdlg.dll
  sc2_cam.dll

In case of Camera Link HS (CLHS) interface you also need:
  sc2_clhs.dll

In case of Camera Link (CL) interface you also need:
  Silicon Software ME3: sc2_cl_me3.dll
  Silicon Software ME4: sc2_cl_me4.dll
  Matrox: sc2_cl_mtx.dll, clsermtx.dll, mtxclsermil.dll
  National Instruments: sc2_cl_nat.dll

The files are part of the pco.camware, pco.sdk or pco.runtime installation.
Please install at least one of these software packages.

After installation please copy the corresponding dll files into your Micro-Manager directory. Depending on your Mirco-Manager installation 32/64bit you need to look for different dlls. Installing the 64bit version on a 64bit system is recommended.

Looking for 64bit dlls:
  C:\Program files\PCO Digital Camera Toolbox\pco.camware
  C:\Program files(x86)\PCO Digital Camera Toolbox\pco.sdk\bin64.
  C:\Program files(x86)\PCO Digital Camera Toolbox\pco.runtime\bin64.

Looking for 32bit dlls:
  C:\Program files(x86)\PCO Digital Camera Toolbox\pco.sdk\bin.
  C:\Program files(x86)\PCO Digital Camera Toolbox\pco.runtime\bin.

If you are not administrator when installing the PCO camera software, it may install to C:\Users\(Your username)\AppData\Roaming, so you may need to look there as well.
_______________________________________________________________

Please refer to the following Installation Guide for further help:
[File:[https://www.pco.de/fileadmin/user_upload/pco-manuals/MA_MICROMANAGER_200.pdf Installation Guide]]

Please be informed that starting with nightly build of 23rd of August 2020 pco stopped software support for SensiCam (also DiCam) and PixelFly. Nightly builds up to this date will still work with these camera types.

--FRE / pco ag 26th of August 2020

{{Listserv_Search|PCO}}

{{Devices_Sidebar}}


{{Devices_Sidebar}}
