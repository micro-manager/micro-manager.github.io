The Projector plugin provides a single graphical user interface for controlling SLMs (spatial light modulators), such as DMDs (digital mirror devices), LCOS (liquid crystal on silicon) modulators or even digital computer projectors, and also for controlling steerable-mirror (e.g. galvo-based) phototargeting devices, including the [[Rapp|Rapp UGA-40]], the [[MicroPoint|Andor MicroPoint]], and the [[ASITiger|ASI scanner]].

<!--
[[File:Plugin-projector-header.png|frame|Figure: Screenshots of Projector plugin's 3 tabs showing default startup values ([[:File:Plugin-projector-header.tar.gz|source]])]]
-->
The Projector plugin's interface shows three tabs: Point and Shoot, ROIs, and Setup. How to operate each tab is described in detail below.

== Setup tab ==

[[File:Plugin_projector-setup.png]]

The Setup tab allows you to test the phototargeting device and perform initial calibration. Press On and Off buttons to turn the light on and off (in the case of a pulsed laser such as the MicroPoint, the On button will only turn the light on briefly). Press the "Show center spot" button to illuminate the center of the phototargeting device's range. This Center Spot should be visible in the camera's field of view -- if it isn't, the physical alignment of the camera and/or phototargeter will need to be adjusted.

The Calibrate button starts an automated calibration procedure, where the phototargeter's internal coordinates are mapped to the pixel coordinates to the camera's pixel coordinates. This calibration allows the Projector plugin to convert mouse clicks or ROIs drawn on the live camera image into precisely directed phototargeting events.

The calibration procedure starts by illuminating a few spots near the center of the phototargeter range. This gives the Projector plugin an estimate of the orientation and location of the camera field of view relative to the phototargeter range. Then, points in a square lattice are illuminated one by one, and imaged on the camera. The Projector plugin then uses the lattice measurements to compute a mapping of each pixel to phototargeter coordinates for future phototargeting. Mappings for each camera and phototargeting deviced are stored and will be remembered even after Micro-Manager is restarted. The relative orientation of the camera and phototargeting device does not matter; however they should be turned roughly square with each other (0, 90, 180, or 270 degrees) so that the square lattice isn't cut off.

Obviously the calibration should be performed with the same objective and camera that will be used for actual phototargeting.  Currently there is no way to store different calibration mappings, e.g. for two different objectives.


{| class="wikitable"
!style="width: 20%;"| Setting
! Description
|- valign="top"
| On / Off
| Toggles calibration mode.
|- valign="top"
| Calibrate
| Creates calibration map of phototargeting device range to the camera pixel position. 
|- valign="top"
| Show center spot
| Illuminate center of SLM or galvo device.
|- valign="top"
| Phototargeting channel
| Toggles to specified channel during phototargeting.  You don't need to set this unless some hardware needs to be moved during imaging, like a dichroic and/or a shutter.  If you don't see your channel listed, you must set the <code>Core-ChannelGroup</code> in the <code>Property Browser</code> to the Group containing this channel.
|}

== Point and Shoot tab ==

[[File:Plugin_projector-point_and_shoot.png]]

Point and Shoot lets you phototarget a small region instantaneously, by clicking on a live image of the specimen. Galvo-based devices fire a single shot, while SLM devices will turn on in a small region around the clicked pixel. The procedure is very simple:

# Under the Point and Shoot tab, set "Point and shoot mode" to "On." 
# Turn on live mode.
# Hold down the Control key (on the keyboard) and click anywhere in the live image window. You should immediately see a laser spot appear for a time at the clicked location.

== ROIs tab ==

[[File:Plugin_projector-rois.png]]


The Regions of Interest (ROIs) tab lets you specify regions on the image to be phototargeted. Phototargeting of an ROI can be carried out instantly, or programmed into a Multi-Dimensional Acquisition.

# Before running an ROI experiment, the calibration (described above under "Setup Tab") must already have been carried out. Over time, the calibration may drift, so repeat calibration as needed. It's also useful to try "Point and Shoot" first, to make sure the phototargeting hardware is working and the calibration is correct.

The procedure for illuminating a single ROI is as follows:

# Select one of the ROI tools on the ImageJ toolbar. Possible ROIs tools can include Rectangular, Oval, Polygon, Freehand, or Point. (Note that some devices, such as the MicroPoint and ASI scanner, currently only support Point targeting.)
# Press "Set ROI(s)". The ROI will be uploaded to the phototargeting device.
# Choose a value of 1 or more for "Loop". If Loop is greater than 1, then for every phototargeting event, the phototargeter will loop through the set of ROIs multiple times.
# Turn on Live mode (on the main Micro-Manager window).
# Press "Run Rois now!" The ROI should be illuminated (rastered in the case of a galvo-based device).

It's also possible to run multiple ROIs:
# Click the ROI Manager button to display ImageJ's ROI Manager.
# Draw an ROI, and press "Add." The ROI will be included in the list.  This is further detailed in [[#Drawing Multiple ImageJ ROIs]].
# Press "Set ROI(s)", turn on Live mode, and then "Run Rois now!"

Pressing "Run ROIs now!" is a good way to phototarget the specimen during a Multi-Dimensional Acquisition. Just start the MDA, wait for the right moment, and then hit "Run Rois now!" to cause phototargeting to start, while acquisition continues simultaneously.

Alternatively, you can run ROIs at pre-determined time points in an acquisition sequence:

# Check Run ROIs in Multi-Dimensional Acquisition
# Enter a "Start Frame" index -- that is, the first frame at which phototargeting should commence.
# If further phototargeting events are desired, check "Repeat every" and specify how many frames should elapse before the next phototargeting event should occur (after the first).

{| class="wikitable"
!style="width: 20%;"| Setting
! Description
|- valign="top"
| Set ROI(s)
| Upload ROI(s) drawn on the selected image to the device.
|- valign="top"
| ROI Manager
| Add multiple ROIs to the image.
|- valign="top"
| Loop
| Number of times to target a group of ROIs.
|- valign="top"
| Spot dwell time
| Stops photo illumination after a certain interval. (Does not affect pulsed lasers or the Rapp Optoelectronic UGA-40.) 
|- valign="top"
| Run ROIs now!
| Fires ROIs drawn on current image.
|- valign="top"
| Run ROIs in Multi-Dimensional Acquisition
| Fires phototargeting device at a pre-determined time during MDA.
|- valign="top"
| Start Frame
| Timepoint in MDA to fire sequence.
|- valign="top"
| Repeat every __ frames
| Number of frames between successive phototargeting events in an MDA.
<code>Setup</code> tab.
|}

== Drawing Multiple ImageJ ROIs ==

If you are not as familiar with ImageJ ROIs and have been using ROIs in other software packages, some differences are:
# Only a single ROI can be drawn at a time.  Drawing another ROI erases the current drawing, and so one must click the {{Key|Add [t]}} button in the ROI Manager before drawing another ROI.
# To change a ROI that has already been added to the ROI Manager list:
#* Select the ROI.  The easiest way to select a ROI is clicking on the label as explained in the [[#tips]]; alternatively, select the entry in the ROI Manager list.
#* Reshape the ROI with the square white handles, or to change the type of ROI, draw the new ROI.
#* Click {{Key|Update}}.

=== Tips ===
# Delete all ROIs by double-clicking the {{Key|Delete}} button.
# Visually select a ROI by clicking the ROI's center label number in the image.  You will need to enable both the "Show All" and "Labels" checkboxs in the ROI Manager to do this.
# Move a ROI by dragging the ROI's center label number in the image.

Also see the [http://imagej.nih.gov/ij/docs/guide/146-30.html#sub:ROI-Manager... ROI Manager] section on the ImageJ User Guide.

== FAQ ==

; Can one stop the device firing at any time?
: Unfortunately there is no emergency "off" button at the moment.

; What happens when I target something outside the device range?
: It ignores those clicks.


{{Documentation Sidebar}}
