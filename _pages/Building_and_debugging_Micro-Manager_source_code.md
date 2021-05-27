=== General ===

* [[Micro-Manager Coding Style and Conventions]]

* [[Micro-Manager Source Code]]

* [[Using Netbeans]] - to compile and debug the Micro-Manager Java layer.
* [[Using Eclipse]] - to compile and debug the Micro-Manager Java layer.
* [[Using IntelliJ]] - to compile and debug the Micro-Manager Java layer

=== Windows ===

* [[Building MM on Windows]]
* [[Visual Studio project settings for device adapters]]
* [[Viewing crash dumps on Windows]] - For C++ programmers, when all else fails

=== Mac OS X and Linux ===

* [[Configuration options]] - Build options on Mac OS X and Linux
* [[Debugging MM on MacOSX and Unix]] - Using gdb or Netbeans to debug the Micro-Manager C++ core

=== Mac OS X ===

* [[Build on MacOS X]]
* [[Building Boost on MacOS X]] (obsolete)
* [[Full Build on MacOS X Leopard]] - How to install and build Micromanager 1.2 and dependencies (tested on MacOS X 10.5.2) (obsolete)
* [[Building Universal Binaries on Mac OS X]] (obsolete)

=== Linux ===

* [https://aur.archlinux.org/packages/micromanager-git/ ArchLinux AUR package] and [https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=micromanager-git&id=4b0150680d48734a8b5d7fc4cacb361caf51c64c build script].
* [[How To Build Micro Manager From Source On Ubuntu 13.10]]
* [[Linux installation from source (Ubuntu)]]
* [[Linux installation from source (Gentoo)]]
* [[Building Firewire camera support on Linux]] (obsolete)
* [[Compiling MM and creating deb files on 64-bit Ubuntu]] (obsolete) 


The following DeviceAdapters require dependencies to run on GNU/Linux, some of which are packaged:

{| class="wikitable"
! DeviceAdapter
! Dependency
! License
! Community Package?
! Downloadable?
|-
| [[Andor]]
| Andor SDK 2
| ? (binary library),<br/> GPL-3 (PCI driver)
| Shell script
| Registration required
|-
| [[AndorSDK3]]
| Andor SDK 3
| ? (binary library),<br/> ? (modified BitFlow library)
| Shell script
| Registration required
|-
| [[dc1394]]
| libdc1394
| LGPL-2.1
| Yes
| Yes
|- 
| [[GPhoto]]
| gphoto2
| GPL-2
| Yes
| Yes
|-
| [[IDS_uEye]]
| [http://en.ids-imaging.com/download-ueye.html IDS 4.30]
| ?
| .run installer
| Registration required
|-
| [[OpenCVgrabber]]
| opencv
| BSD
| Yes
| Yes
|-
| [[PrincetonInstruments]]
| libvpcam-2.7.4.2
| ? (binary library)
| Shell script
| [ftp://ftp.princetoninstruments.com/public/Software/Official/Linux/ Yes]
|-
| [[PVCAM]]
| libpvcam-2.7.0.0
| ? (binary library),<br/> GPL-2 (USB-2 driver),<br/> GPL-2 (PCI driver)
| Yes (USB),<br/> Shell script (PCI)
| [ftp://ftp.princetoninstruments.com/public/Software/Official/Drivers/Linux/ Yes]
|-
| [[RaptorEPIX]]
| ? (XCLIB or XCAP)
| ? ([http://www.epixinc.com/support/files.php XCLIB "requires ID code"])
| .bin installer
| Yes
|-
| [[SpotCamera]]
| SPOT SDK
| ?
| ?
| [http://www.spotimaging.com/downloads.php By request]
|-
| [[TISCam]]
| uvc Kernel driver (USB)<br/>[https://github.com/GNOME/aravis aravis] (Gig-E)
| GPL-2<br/>LGPL-2.1
| N/A<br/>Yes
| N/A<br/>Yes
|-
| [[Video4Linux]]
| v4l2 Kernel driver
| GPL-2
| N/A
| N/A
|-
| [[ITC18]]
| ITC Driver
| ?
| ?
| By request
|-
| [[K8055]]
| [http://libk8055.sourceforge.net/ libk8055]
| GPL-2
| Source tarball only
| Not officially supported?
|-
| [[MCCDAQ]]
| Unofficial [ftp://lx10.tx.ncsu.edu/pub/Linux/drivers/PCI/ PCI] and [ftp://lx10.tx.ncsu.edu/pub/Linux/drivers/USB/ USB HID],<br/> Official [ftp://ftp.mccdaq.com/downloads/DAQFlex/Linux/ DAQFlex USB driver]
| GPL-2 (Unofficial),<br/> DAQFlex EULA (Official)
| Source tarball (Unofficial),<br/> Source tarball (Official)
| Yes (Unofficial),<br/> Yes (Official)
|-
| [[MaestroServo]]
| [http://www.pololu.com/catalog/product/1356/resources UscCmd]
| ?
| Commandline utility
| [http://www.pololu.com/file/0J315/maestro-linux-100507.tar.gz Yes]
|}

=== Miscellaneous ===

* [[Free third-party tools for testing communications with hardware]]













{{Programming_Sidebar}}
