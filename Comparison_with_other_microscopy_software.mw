Note: The information below was written a number of years ago, and may no longer be accurate, especially in the details.

== Summary ==
This article provides a light comparison of available microscopy software with a 3 line summary and up to 5 specific unique Pro and Con bullet points.  Adding more software to this list is encouraged (especially FLOSS software).  Contributions are best made by you, the scientist, experienced with multiple products.

This comparison is not a substitute for application specific abilities of software, which requires comparing commercial quotations of a custom set of features.  Effort has been made to keep the information accurate and opinions balanced.

<!-- Table by Austin and Pariksheet -->
{| class="wikitable"
! style="width: 10%;"|
! style="width: 20%;"| Micro-Manager
! style="width: 20%;"| MetaMorph 7
! style="width: 20%;"| Elements
! style="width: 20%;"| iQ
|-
! Initial cost
| Free
| $6,000-$22,000
| $6,000-$12,000
| $3,500-$6,000
|-
! Year upgrades
| Free
| $750-1,200
| $400-$1,200
| $860
|-
! Offline Analysis License Cost
| Free
| $1,200-6,000
| $1,200-6,000
| $1,500
|-
! Support
| Forums, Wiki, Local Users, Video screencasts
| Provided by Manufacturer and Reseller
| Provided by Manufacturer and Reseller
| Provided by Manufacturer, Video webinars
|-
! Data format
| OME TIFF, Extendable using bioformats plugin
| STK, TIFF, Most Scope-Brand formats, RAW
| ND2, MOV, AVI, ICS, TIFF
| ABD TIFF, OME TIFF, AVI
|-
! Hardware specialty
| Neutral
| Neutral
| Nikon microscopes, Nikon cameras
| Andor cameras
|-
! DIY software development
| Beanshell, C++ DeviceAdapter, Java GUI, Matlab, Python NumPy, JavaScript ImageJ macros
| Journals, VisualBasic
| C++ macro language (can call your own libraries), RS232 message sending
| Python hooks to acquisition state, NumPy access to data cache
|}


== Micro-Manager 1.4 (UCSF + many contributors) ==
<!-- Written mostly by Pariksheet ... Nico and Arthur, please fix as needed! and add your name to Authors -->
Micro-manager was founded to serve 2 needs: provide community driven experiment functionality, and an equal platform for hardware manufacturers to write drivers (hardware manufacturers supply proprietary software, and no manufacturer can support everyone elses hardware).  Custom work is made easy by direct access to hardware and GUI internals from scripts, and extension is possible by multiple programming languages.

{| class="wikitable"
! style="width: 50%;"| Pros
! style="width: 50%;"| Cons
|-
|valign="top"|
* Core developers interact with users, and many issues are fixed quickly in nightly builds
* Self-help is easy: transparent support mailing-list, archive and wiki.  The best help is that which you don’t need to ask for
* Adding functionality is possible with several programming interfaces, friendly community and open-source code
|valign="top"|
* Few dealers sell support contracts for Micro-Manager, thus there is limited on-site support for troubleshooting, new equipment evaluation or training from manufacturers
* Device features and integration in some places are unoptimized compared to vendor softwares
* Requires pre-setup work of computer configuration and which vendors normally provide
|}

== Metamorph 7.7 (Molecular Devices) ==
<!-- Written mostly by Austin -->
Started in the DOS era as "Image1", Metamorph has been a longtime go-to application for research microscopy. It’s known for reliability, and a flexible interface which allows users to quickly develop scripts for custom work. The interface will remind you of Windows 95, as it doesn’t make use of new interface design paradigms. The next generation of Meta, "NX", hasn’t been well tested by our group, but shows promise as a new interface to bring the core system into the next decade with a modern interface design.. 

{| class="wikitable"
! style="width: 50%;"| Pros
! style="width: 50%;"| Cons
|-
|valign="top"|
* One of the oldest packages on the market
* Well known in the industry for good support
* Reliable (low frequency of “crashes”)
* Extremely fast, patented “hardware streaming” capability, which uses camera event timers to trigger devices without requiring TTL lines. 
* Would be interesting in the future to compare against their new NX application which will eventually replace this. 
|valign="top"|
* Antiquated user interface
* High cost/functionality ratio. 
* Numerous modules and add-ons required for advanced applications (FRET, Deconvolution, etc)
* Requires training for practical use
* Dealership-distribution model means that support can range in quality and cost. 
|}

== Elements 4 (Nikon) ==
<!-- Written mostly by Austin -->
Built on top of the [http://www.lucia.cz/ LIM "LUCIA" Software], Elements has grown from a basic package into a formidable software application, with one caveat - it only runs Nikon Microscope stands. Elements has a higher price point, with offline packages running as high or higher than MetaMorph. User workflow, organization of image data, and range of applications make Elements a very powerful imaging application. With this power and complexity comes a lower stability, with more crashes and bugs to be found.   

{| class="wikitable"
! style="width: 50%;"| Pros
! style="width: 50%;"| Cons
|-
|valign="top"|
* Clean and modern user interface
* Data handling of Multi Dimensional Images is simple and effective
* Wide range of application capability (FRET, FRAP, CA2, Stitching, Multiwell scanning etc)
* Supports a wide range of non-stand motorized hardware (Sutter, ASI, Lumencor, Prior Etc)
* Includes optional Triggered Acquisition module for TTL high speed capture
|valign="top"|
* Lack of Non-Nikon stand control limits range of site applications
* Wide range of capabilities translates into a major support load for new versions - resulting in more bugs than comparable packages.
* High cost of maintaining software in “AR” package
* ND2 File format is difficult to use in other imaging applications, and with offline Elements copies costing 30-40% of the acquisition license, staying with the ND2 format can get quite expensive.
* Support limited to Nikon Direct sales employees and dealerships. 
|}

== iQ 2.6 (Andor) ==
<!-- Written mostly by Pariksheet -->
Andor brought their EMCCD cameras to the life sciences by acquiring Kinetic Imaging and built iQ on Kinetic's "AQM" software.  It provides accessibility, being at a low price point, and freely including many experimental modules. In version 2, the experiment interface uses an unusual, but powerful drag-and-drop design as standard, removing the transition between ordinary and custom work.

{| class="wikitable"
! style="width: 50%;"| Pros
! style="width: 50%;"| Cons
|-
|valign="top"|
* Image manager allows you to review all data in a single list
* Flexible experiment design without scripting
* Little or no need to buy additional modules since many applications of more expensive software are included for free (FRAP, image split, ratio, etc)
* Movie editor can combine multiple datasets into an AVI
|valign="top"|
* Casual users prefer a simple interface
* Longer learning curve of Flexible experiment design
* Non-Andor cameras not supported
* Antiquated appearance
* Analysis capabilities are basic, but is useful for holistically viewing complex Flexible experiment data
|}


{|
|valign="top"|'''Authors:'''
| Austin Blanco (formerly with Technical Instruments)
|-
|
| Pariksheet Nanda (Andor)
|}


[[User:P.nanda|P.nanda]] 18:33, 18 September 2012 (PDT)


{{Documentation_Sidebar}}
