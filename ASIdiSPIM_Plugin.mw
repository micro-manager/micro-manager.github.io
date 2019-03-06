= ASIdiSPIM Plugin =

<table><tr><td>
'''Summary:'''</td><td>GUI to drive [http://asiimaging.com/products/light-sheet-microscopy/selective-plane-illumination-microscopy-ispimdispim/ iSPIM/diSPIM] (single/dual light sheet microscope) on ASI Tiger controller</td></tr>
<tr><td>'''Authors:'''</td><td>Nico Stuurman, Jon Daniels (jon at asiimaging.com)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Requires:'''</td><td>ASI "Tiger" TG-1000 controller with appropriate cards installed<td></tr>
</table>


== Overview ==

This plugin exists to facilitate alignment and use of [http://dispim.org the diSPIM system].  It also works with many light sheet configurations including iSPIM, oSPIM, ct-dSPIM, OpenSPIM-like systems, etc.  However it is specific to ASI-made hardware/controller.

A much broader overview of light sheet microscopy and further information about the diSPIM is available on [http://dispim.org dispim.org]

== Plugin Documentation ==

The plugin documentation is now is on the diSPIM wiki at [http://dispim.org dispim.org], specifically in the manual under [http://dispim.org/docs/mm_dispim_plugin_user_guide "Micro-manager diSPIM Plugin"].

== Change Log ==
List of significant changes since 1.4.19 release, omitting bug fixes.  The feature was fully implemented as of the nightly build listed.

* 20190306: added overview acquisition feature to show 2D slice of large sample
* 20180928: added path-specific presets
* 20180222: added XYZ grid creator, useful for large tiled datasets
* 20171031: added reflective imaging option
* 20170217: can use light sheet mode on supported cameras
* 20170208: new camera tab, allows setting ROI numerically or with buttons
* 20170112: allow remote access via Java RMI for automated microscopy
* 20161222: plugin can deskew stage scan data
* 20160701: oSPIM support (need to build JAR with flag set)
* 20151218: added API calls to control acquisition programmatically
* 20151125: added ImageJ toolset for common image manipulation tasks
* 20151124: ability to run test acquisition with optionally exported raw file
* 20151013: added API calls to change acquisition settings programmatically
* 20150925: significantly expanded autofocus options
* 20150819: buttons to raise/lower SPIM head and sync upper and lower Z axes
* (1.4.22 release)
* 20150811: autofocus during timelapse
* 20150807: rapid-fire (hardware-timed) acquisition
* (1.4.21 release)
* 20150428: autofocus to define calibration (not yet during timelapse)
* 20150415: added basic stage scanning (contact ASI for firmware if needed)
* 20150225: added hardware switching for multi-channel using Tiger's PLC
* 20150113: added multi-position support and software-based multi-channel support
* (1.4.20 release)
* 20141219: added ability to easily do offset-only calibration adjustment
* 20141215: improved slice timing calculations including speeding up optimized easy timing slice period by 0.25 ms
* 20141209: added colored status indicators for "quick glance" position information (helpful esp. to avoid manual alignment when not centered)
* 20141207: added ability to export data for Fiji Multiview plugin (as of April 2015 the Fiji plugin can directly import data without requiring this step)
* (1.4.19 release)
* first included with 1.4.16 release Jan 2014


You can view all changes to the diSPIM plugin code by [https://valelab.ucsf.edu/trac/micromanager/search?q=asidispim searching the Micro-Manager timeline for "ASIdiSPIM"].  You can also [https://valelab4.ucsf.edu/trac/micromanager/browser/plugins/ASIdiSPIM/src/org/micromanager/asidispim browse the plugin source code].

== Known Issues ==

* Camera timing calculations assume CameraLink interface speeds.  If you are using a USB3 interface the timing may be different, so if you are missing frames uncheck "minimize slice period" and increase the slice period manually.

== Please contact us! ==

The plugin is quite usable in its current state but we welcome ideas for future improvements as well as bug reports.  Contact information is above.

For instructions on submitting bug reports see http://dispim.org/software/micro-manager#bug_reports.

For instructions on updating the controller firmware see http://dispim.org/hardware/controller.

{{Listserv_Search|ASIdiSPIM}}

{{Documentation Sidebar}}
