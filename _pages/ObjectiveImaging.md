== Objective Imaging OASIS adapter ==

<table cellspacing=3><tr><td>
'''Summary:'''</td><td valign="top">Interface to Objective Imaging OASIS controller</td></tr>
<tr><td>'''Author:'''</td><td>Don Laferty, 4/9/12</td></tr>
<tr><td>'''Maintenainer:'''</td><td>Egor Zindy</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.17 (New hub based adapter from 1.4.23)</td></tr>
</table>

Requires the [http://www.objectiveimaging.com/download/software.php OASIS Software] package from Objective Imaging.

{{Devices_Sidebar}}

== Objective Imaging OASIS-4i / OASIS-Blue controller board ==

Both the OASIS-4i and the OASIS-blue are four-axis controllers intended to address a wide range of automated applications in microscopy. The four-axis design of the controller makes it ideally suited for use with automated
microscopes with a combination of the following components:
* Motorized XY stage, for fast and precise translation of the specimen
* Motorized Z focus drive, for autofocus and Z-stack acquisition
* Motorized filter changer(s), for wavelength selection, e.g., fluorescence
* Shutter control and other isolated TTL GPIO lines.

The OASIS-blue can be configured to support automated components from a variety of 3rd party vendors, and Objective Imaging supplies a range of cabling options that ensure simple connection of the OASIS-blue to a particular configuration. For any additional information, [http://www.objectiveimaging.com/contact.php please contact Objective Imaging].

Note that your OASIS-blue controller may have been provided as part of an integrated automation system. There may be aspects of your system configuration that are specialized for your application. In these situations, please contact your system vendor for details regarding your
configuration before proceeding.

Additionally, both the OASIS-4i / OASIS-Blue can be fitted with optional daughter modules to provide enhanced capabilities such as encoder support and digital trigger I/O.

== Installation ==

The Controller User Guide can be downloaded [http://www.objectiveimaging.com/download/software.php from this link] and is bundled together with the OASIS-Blue and OASIS-4i System Software ZIP file.

== Hardware Configuration Wizard ==

Add the Objective Imaging Oasis Controller Hub. This change was introduced in v1.4.23. In versions prior, only XY control was provided, so a hub was not necessary.
[[File:oasis1.png]]

Then select whichever hardware the OASIS board controls. E.g., OasisXYStage, OasisZStage, OasisShutter_1...
[[File:oasis2.png]]
