__NOTOC__
== Micro-Manager 1.4.21 (April 30, 2015) ==

[https://valelab4.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.21.exe Windows 32-bit], 61 MB<br />
[https://valelab4.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.21.exe Windows 64-bit], 62 MB<br />

[https://valelab4.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.21.dmg Mac OS X (Universal Binary)], 48 MB<br />
(OS X 10.8 and later: if the application does not open when double-clicked for the first time, try ctrl-click or right click, then select "Open".)

=== Changes in 1.4.21 (since 1.4.20) ===

* Improvements in the main application:
** New features
*** Add a "Recently Opened Files" option in the File menu (Nico Stuurman)
** Bugfixes
*** Fix a rare error in the metadata panel (Nico Stuurman)
*** Prevent image display windows from "showing" on computer monitors that are no longer attached to the computer (Nico Stuurman)
*** Fix excessive restarts of Live mode when changing device properties (Chris Weisiger)
*** Fix remembering channel colors when using multiple cameras (Chris Weisiger)
*** Fix an error causing the image display to "break" when drawing (Chris Weisiger, Nico Stuurman)
*** Fix issues with the size of the acquisition dialog (Nico Stuurman)
*** Fix an issue causing erroneous timeouts in Live mode (Chris Weisiger)
*** Remember the position of the Data Processing Pipeline dialog across sessions (Nico Stuurman)
*** Fix an issue where MDA would not use sequence acquisition when a single channel is selected (Mark Tsuchida)
*** Prevent MDA from failing when the computer hostname is not available (Chris Weisiger)
*** Prevent text from being rendered at low resolution on OS X with Retina displays (Chris Weisiger, Mark Tsuchida)
*** Prevent error when setting the current shutter to nothing (Mark Tsuchida)
*** Fix a crash at the end of sequence acquisition when the shutter belongs to the same device adapter as other devices that are actively used (Mark Tsuchida)
* New plugins
** '''PM/QI Auto White Balance''': Automatic white balance for Photometrics/QImaging color cameras (Andrej Bencur)
** '''HardwareFocusExtender''': An autofocus plugin to extend the range of hardware autofocus (experimental; Nico Stuurman)
* Updated plugins
** '''ASIdiSPIM''': Add multi-position support and multi-channel support, allow stage scanning for imaging large samples, and integrate software autofocus to find correct slice position (Jon Daniels (ASI), Nico Stuurman, et al.)
** '''HCS Site Generator''': Remember well selections when changing site layout (Nico Stuurman)
** '''Image Flipper''': Now remembers window positions across sessions (Nico Stuurman)
** '''IntelligentAcquisition''': Multiple bugfixes and improvements (Nico Stuurman)
** '''Localization Microscopy''': Multiple bugfixes and improvements (Nico Stuurman)
** '''Multi-Andor Control''': Update the UI whenever the camera changes (Nico Stuurman)
** '''Projector''': Multiple bugfixes and improvements (Nico Stuurman)
* New device adapters
** '''StandaStage''': An alternative adapter for Standa Microsctep Driver; allows use as an XY stage (Ed Simmons)
* Updated device adapters
** [[AndorSDK3]]: Add ExternalTriggerDelay feature for LightScanPlus cameras (Matthew Milford, Andor)
** [[ASIStage]]: Improve behavior when moving parallel to X or Y axis; fix issue with old firmware versions (Jon Daniels, ASI)
** [[ASITiger]]: Numerous improvements and fixes; add several features to PLogic support (Jon Daniels, ASI)
** [[CSUW1]]: Fix issue with Disk switching; add Label property to Disk (Nico Stuurman)
** [[DemoCamera]]: Handle ROI correctly when binning is enabled; add demo galvo device; add Gaussian-distributed noise mode for demo camera (Nico Stuurman)
** [[IIDC]]: Correctly handle autoshutter in sequence acquisition (Mark Tsuchida)
** [[Mightex_C_Cam]]: Add "Snap" support (Mightex Systems)
** [[NI100X]]: Prevent State property from getting stuck when using state device shutter with NI digital output (Mark Tsuchida)
** [[PicardStage]]: Update Picard SDK
** [[PVCAM]]: Prevent timeouts with very slow readout speeds; improve color camera support (add debeyering, white balancing); minimize lost frames under high CPU load (Andrej Bencur and Lubomir Walder, Photometrics); prevent an occasional crash when configuring the camera (Mark Tsuchida)
** [[QCam]]: Fix issue when configuring a Rolera Bolt; fix trigger output in snap mode (Andrej Bencur, QImaging); ''Windows users should update their QCam SDK installation''
** [[ScopeLED]]: Add shutter channel properties (ScopeLED)
** [[Thorlabs]]: Fix issues with motor stage movement and XY stage initialization (Stephen Getliffe, Thorlabs)
** [[XCite120PC_Exacte]]: Power-Factor property is now read-only and Output-Power limits are set correctly (Mark Tsuchida)
** [[XIMEACamera]]: Fix timestamp generation for acquired images, reset timestamp at start of sequence acquisition (Marian Zajko, XIMEA); ''Users should update to XIMEA API 4.04.00''
** [[Zaber]]: Fix handling of communication errors (Athabasca Witschi, Zaber Technologies)
** [[ZeissCAN]]: Allow selection of upper prism position for PhotoModule (Nico Stuurman)
** [[ZeissCAN29]]: Correct options for XY stage Velocity-Acceleration; add trajectory velocity/acceleration settings (Nico Stuurman)
* New closed-source device adapters
** '''Usb3CamHS''': World Precision Instruments USB3-CAM-HS (Ed Simmons)
* Updated closed-source device adapters
** [[HamamatsuHam]]: Allow setting exposure time in different units, add fix to support some older cameras (Patrick Gregorio); Fix ROI handling when binning is enabled (Nico Stuurman); ''Users should update their DCAM-API installation''
* Changes of interest to developers
** Micro-Manager 1.4.21 is SVN trunk r15381, 3rdpartypublic r176.
** Add an example "Hello World" plugin for developers to use as a starting point (Chris Weisiger)
** Changes in the API:
*** Fix a bug in <code>MMWindow.getImagePlus()</code> (Nico Stuurman)
*** Add <code>computeScore()</code> method to AutofocusPlugin API (Nico Stuurman)
*** Calling <code>openAcquisition()</code> with zero channels, frames, or slices now assumes the user meant 1 instead, to prevent acquisitions that cannot hold any images.
*** Fix a bug in auto-generated acquisition names (Jon Daniels)
*** MMCore API now has stage control methods that implicitly use the current stage (Jon Daniels)
*** No changes to the device programming interface

== Micro-Manager 1.4.20 (January 30, 2015) ==

[https://valelab4.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.20.exe Windows 32-bit], 60 MB<br />
[https://valelab4.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.20.exe Windows 64-bit], 62 MB<br />

[https://valelab4.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.20.dmg Mac OS X (Universal Binary)], 48 MB<br />
(OS X 10.8 and later: if the application does not open when double-clicked for the first time, try ctrl-click or right click, then select "Open".)

=== Changes in 1.4.20 (since 1.4.19) ===

* Improvements in the main application
** Include file information in the ImageJ properties for Micro-Manager datasets (Chris Weisiger)
** Improve saving/remembering window and dialog positions (Nico Stuurman, Jon Daniels)
** Improve resizing of image display windows (Chris Weisiger)
** Remove artificial limits on RAM usage on OSX (Mark Tsuchida)
** Improve the layout of the data processing pipeline dialog (Mark Tsuchida)
* Bugfixes
** Snap/live mode
*** Fix a bug causing a time scrollbar to appear in the Snap/Live display (Chris Weisiger)
*** Fix a bug causing Snap/Live display to sometimes hang (Nico Stuurman)
*** Fix a bug causing the first image received in Live mode to be discarded (Mark Tsuchida)
*** Fix poor responsiveness of the UI during Live mode with large images (Mark Tsuchida)
*** Changes to the on-the-fly processors immediately take effect on Live mode (Mark Tsuchida)
*** Ensure that the start/stop Live mode buttons don't get out of sync (Chris Weisiger)
*** Fix memory issues on 32-bit systems (Chris Weisiger)
** Album
*** Fix a bug causing the Album display to be one image behind (Chris Weisiger)
*** Fix a bug causing snap-to-album with RGB or multichannel images to fail (Chris Weisiger)
** File data
*** Fix a bug causing files with incomplete display settings to be unloadable (Chris Weisiger)
*** Fix a bug causing multipage TIFF files to be closed prior to all data having finished writing (Henry Pinkard)
*** Fix a race condition causing recently-written images to not be available when using multipage TIFF storage (Mark Tsuchida)
*** Fix an issue that could cause file loads to generate images with null metadata (Chris Weisiger)
** Miscellaneous
*** Prevent windows from appearing offscreen (Jon Daniels, Chris Weisiger)
*** Prevent a potential hang caused by acquisitions with no defined bit depth (Chris Weisiger)
*** Fix a bug causing histogram scaling to be improperly remembered (Chris Weisiger)
*** Fix a bug causing getPropertyNames() to fail (Karsten Siller, Chris Weisiger)
*** Fix Z-step size information in ImageJ (Jon Daniels, Chris Weisiger)
*** Fix a rare NullPointerException in acquisitions (Nico Stuurman)
*** Fix a rare exception when closing image windows (Mark Tsuchida)
*** Improve responsiveness when changing config presets (Mark Tsuchida)
*** Prevent the program from generating bizarrely wide dialog boxes (Mark Tsuchida)
*** Fix a NullPointerException in DataProcessors when they are added to or removed from the processing queue (Chris Weisiger)
*** Fix rounding of values (e.g. in Device Property Browser) (Mark Tsuchida)
*** Fix a hang when closing dialogs (Nico Stuurman)
*** Fix a crash that could occur when controlling certain Magnifier devices during acquisition (Mark Tsuchida)
*** Better handle failure to load a hardware configuration: prevent spurious errors by giving up after the first error, and unload the partially loaded devices (Mark Tsuchida)
*** Fix crash that could occur when the loading of hub and peripheral devices fails (Mark Tsuchida)
*** Fix a bug that caused a long delay when starting an MDA time series that is performed by streaming from the camera (Mark Tsuchida)
* Changes in plugins
** ASIdiSPIM: extensive improvements and bug fixes (Jon Daniels, Nico Stuurman)
** AcquireMultipleRegions: fix acquisition of non-flat sections (Kurt Thorn)
** CRISPv2: add LogAmpAGC display (Vik, ASI)
** Localization Microscopy: various improvements and bug fixes (Nico Stuurman)
** MultiChannelShading: extensive improvements and bug fixes (Nico Stuurman)
** PatternOverlay: bug fixes and UI tweaks (Nico Stuurman)
* New device adapters
** [[AndorShamrock]] Andor Shamrock Spectrograph Series (Andor)
** [[Mightex_C_Cam]] Mightex C-series USB cameras (Mightex)
** [[OVP_ECS2]] Optic Valley Photonics ECS-2 environmental controller (Jon Daniels, ASI)
** [[TriggerScope]] TriggerScope digital and analog controller (Austin Blanco)
* Changes in device adapters
** [[ASIStage]]: Add motor control properties for the Z axis; add LogAmpACG property for CRISP (Jon Daniels, ASI)
** [[ASITiger]]: Add support for PLogic card; many other enhancements and fixes (Jon Daniels, ASI)
** [[Andor]]: Add FVB mode; fix ActualInterval when ROI is set; add hardware timestamps when available (Matthew Milford, Andor)
** [[Corvus]]: Add joystick toggle property (Doug Kelly)
** [[Ludl]]: Add preliminary support for multiple controllers (Russell Taylor, Mark Tsuchida)
** [[MCCDAQ]]: Make analog voltage range configurable (Chris Weisiger)
** [[MCL_MicroDrive]]: Fix an issue where velocity was incorrect for multi-axis movement (Greg Sawyer, MCL)
** [[Nikon]]: Add support for TiTIRF shutter (Nico Stuurman)
** [[PCO_Camera]]: Fix issues with ROI setting on startup (Franz Reitner, PCO)
** [[PICAM]]: Fix crash when setting Port property (Mark Tsuchida); Fix EM gain property (Toshio Suzuki)
** [[PVCAM]]: Fix ColorMode property; improve error handling (Lubomir Walder, Photometrics/QImaging)
** [[PrecisExcite]]: Fix issue where invalid configuration file could be generated (Mark Tsuchida)
** [[SerialManager]]: Remove "GetAnswer retry #" logging (Mark Tsuchida)
** [[TISCam]]: Fix a crash (Johannes Schindelin)
** [[Tofra]]: Add a device to control RGB LED as a shutter (Mark Tsuchida)
** [[UserDefinedSerial]]: Fix issue causing errors when more than 10 positions are used with the state device (Mark Tsuchida)
** [[VariLC]]: Fix handling of error responses (Amitabh Verma)
** [[Versalase]]: Add properties to select lasers to shutter individually (David Sweeney, Vortran)
** Yokogawa [[CSUX]]: Add retry logic for setting dichroic (Doug Kelly, Chris Weisiger)
** [[Zaber]]: Improve XY stage support and add uniaxial stage support; improve error handling (Athabasca Witschi, Zaber)
** [[ZeissCAN]]: Add support for AxioPhot PhotoModule (Nico Stuurman)
* Changes in closed-source device adapters
** [[HamamatsuHam]]: Fix an issue that could result in dropped frames when using external triggering on certain systems. Also fix a crash and a hang that could occur under certain circumstances. (Patrick Gregorio, Hamamatsu)
* Changes of interest to developers
** Micro-Manager 1.4.20 is SVN trunk r14990, 3rdpartypublic r173.
** There is no change in the device programming interface (MMDevice) since 1.4.19.
** API changes:
*** Add <code>logDebugMessage()</code> method (Mark Tsuchida, Jon Daniels)
*** Add <code>showMessage()</code> method (Nico Stuurman)
*** Add <code>MMWindow.getTaggedImage()</code> method (Nico Stuurman)
*** <code>MMWindow.getNumberOfPositions()</code> no longer always returns 1 (Nico Stuurman)
*** Fix erroneously-defined tags for channel contrast mins/maxes (Chris Weisiger)
*** <code>CMMCore</code> (<code>mmc</code>) methods for hub-peripheral devices now throw exceptions (<code>getInstalledDevices(), getLoadedPeripheralDevices(), getInstalledDeviceDescription()</code>) (Mark Tsuchida)

== Micro-Manager 1.4.19 (November 7, 2014) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.19.exe Windows 32-bit], 60 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.19.exe Windows 64-bit], 61 MB<br />

[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.19.dmg Mac OS X (Universal Binary)], 47 MB<br />
(OS X 10.8 or later: if the application does not open when double-clicked for the first time, try ctrl-click or right click, then select "Open".)

=== Changes in 1.4.19 (since 1.4.18) ===

* New in the MMStudio application
** Stage Position List dialog tweaks (Nico Stuurman)
** Image processing pipeline dialog changes (Mark Tsuchida):
*** Renamed to "On-The-Fly Processing"
*** Dialog layout improved
*** Dialog is automatically shown when opening a processor plugin
*** Menu option is moved into the Plugins -> Processors menu
** Default sequence buffer size on 64-bit systems raised from 25MB to 250MB (Mark Tsuchida)
** ScriptPanel "Stop" button changed to "Interrupt" button, which interrupts the script instead of killing it (Chris Weisiger)
** Add a keyboard shortcut option to autostretch the current image window (Chris Weisiger)
** Add support for reporting crashes via Problem Report (Mark Tsuchida)
** Add a "please wait" dialog during plugin loading (Nico Stuurman)
** Remember image window positions across sessions (Nico Stuurman)

* New in plugins
** Plugins menu has been slightly rearranged (Mark Tsuchida)
** New plugin: PatternOverlay, which draws patterns on the image display window (Jon Daniels, Matthijs Dorst)
** MultiChannelShading: remembers user settings better (Nico Stuurman)
** MultiChannelShading: doesn't create an open-file dialog when activated (Mark Tsuchida)
** PixelCalibrator: handles RGB cameras more gracefully (Chris Weisiger)
** PixelCalibrator: handles being cancelled more gracefully (Mark Tsuchida)
** ASI diSPIM: numerous enhancements and fixes (Jon Daniels, Nico Stuurman)
** HCS: Add support for 48-well plates (Nico Stuurman)
** Localization Microscopy changes (Nico Stuurman):
*** Clean up bad data from the reference image
*** Add "Combine" button to combine datasets
*** Some fixes to the plot display

* Bug fixes:
** Fix extensive layout bugs when resizing or zooming the image window (Chris Weisiger, Mark Tsuchida)
** Script panel no longer lets the text input cursor go off the end of the script (Chris Weisiger)
** Writing to a write-only filesystem or to a permissions-restricted part of the disk now produces an error message (Chris Weisiger)
** Fix a bug causing the display to stop updating at the ends of acquisitions (Mark Tsuchida + Chris Weisiger)
** Update the burst acquisition Beanshell script to work with current versions of Micro-Manager (Mark Tsuchida)
** The MDA dialog and main frame now properly sync exposure time when the relevant checkbox is set (Chris Weisiger)
** Clearing preferences now clears more settings (Mark Tsuchida)
** The list of binning options in the main window is sorted numerically (Mark Tsuchida)
** Don't error out when Click-To-Move is on and there's no XY stage (Chris Weisiger) or Z stage (Nico Stuurman)
** Fix a bug in "Snap to Album" with multiple cameras causing duplicate images (Chris Weisiger)
** Fix a race condition when updating metadata display (Chris Weisiger)
** Fix GUI issues relating to autoshutter controls (Nico Stuurman)
** Improve placement of error message dialogs (Nico Stuurman)
** Fix issues caused by zero pixel sizes in Create Grid dialog (Nico Stuurman)
** Automatically restart Live Mode when pixel size changes (Nico Stuurman)
** Make plugin loading more resilient to partial failures (Chris Weisiger)
** Fix zooming to 33%, 16%, and 8% (Chris Weisiger)
** Fix off-by-one error when setting image dimensions (Henry Pickard)
** Fix a crash that could occur after changing the ROI (Mark Tsuchida)
** Fix "Keep shutter open" for channels (Mark Tsuchida)
** Fix a hang that could occur when MDA fails during a sequence acquisition (Mark Tsuchida)
** Fix a bug that could cause spurious Z position setting when running certain hardware-triggered MDAs (Mark Tsuchida)

* New Device Adapters
** [[UserDefinedSerial]]: Control arbitrary serial-based shutters and state devices (Mark Tsuchida)

* Updated Device Adapters
** [[ABSCamera]]: Minor bugfix and internal cleanup (ABS GmbH Jena)
** [[AndorSDK3]]: Fix metadata for USB3 Zyla (Matthew Milford, Andor)
** [[Arduino]]: Bugfix for switch state handling (Nico Stuurman)
** [[ASIStage]]: Add "T" axis support, properties for sending serial commands, and "Fast Sequence" mode (Jon Daniels, ASI)
** [[ASITiger]]: CRISP property names now match ASIStage; support ring buffer and scanner in firmware v2.89+ (Jon Daniels, ASI)
** [[BaumerOptronic]]: Prevent timeout errors during acquisition (Mark Tsuchida)
** [[DemoCamera]]: Additional test image parameters including sequential number display (Chris Weisiger)
** [[GigECamera]]: RGB image and raw Bayer image support (Peter Innerhofer)
** [[MCL_MicroDrive]]: Fix a crash during shutdown (Greg Sawyer, MCL)
** [[NewportCONEX]]: Fix serial communication bugs, add homing support (Marco Furchi, Mark Tsuchida)
** [[PCO_Camera]]: Fix ROI handling for cameras without ROI support; add support for acquire mode; other bugfixes (Franz Reitner, PCO)
** [[pgFocus]]: Fix a potential crash (Mark Tsuchida)
** [[PI_GCS_2]]: Allow inversion of Z direction (Steffen Rau, PI)
** [[PVCAM]]: Initial support for SMART Streaming (Andrej Bencur, Photometrics/QImaging)
** [[SerialManager]]: Allow nonstandard baudrates on OS X (Marco Furchi, Mark Tsuchida)
** [[Thorlabs]]: Bugfixes; add support for MLS203 stage, TDC001 and all multichannel BBD controllers (Thorlabs)
** [[Utilities]]: Allow setting position range for DAXYStage (Ed Simmons)
** [[XIMEA]]: Add support for padded data transfer from MD USB3 cameras, image formats for new camera models, FPGA and MCU version description, sensor tap control parameter, new GPO modes; other updates and fixes (Marian Zajko, XIMEA)
** [[ZeissCAN29]]: Fix issue that could occasionally cause xy stage to remain busy (Mark Tsuchida)

* New Closed-Source Device Adapters
** '''HoribaEPIX''': HORIBA-branded EMCCD and sCMOS cameras (David Biggs, Raptor Photonics)

* Updated Closed-Source Device Adapters
** [[HamamatsuHam]]: Prevent silent dropped frames (Mark Tsuchida); Correct exposure time limits for ROI; add support for setting OUTPUT TRIGGER SOURCE, INTERNAL LINE SPEED UNITS, OUTPUT TRIGGER PERIOD UNITS, and OUTPUT TRIGGER DELAY UNITS; other bugfixes (Patrick Gregorio, Hamamatsu)
** [[NikonEclipse90i]]: Fix OpticalPath positions for Front and Rear ports (Egor Zindy)
** [[Olympus]]: Fix issue that could cause devices to remain busy (Mark Tsuchida)
** '''RaptorEPIX''': Various updates and bugfixes (David Biggs, Raptor Photonics)

* Changes to the MMStudio API
** <code>TaggedImageStorage.putImage()</code> can now throw <code>IOException</code> if there is an issue writing the file (Chris Weisiger)
** <code>ImageCache</code> now exposes a <code>getImage()</code> method, to make accessing image data easier (Chris Weisiger)
** Multiple new <code>showError()</code> variants added to API (Jon Daniels)
** <code>autostretchCurrentWindow()</code> function added to API (Chris Weisiger)

* Changes to the MMCore API
** CMMCore's sequence buffer size now defaults to 25 MB (32-bit) or 250 MB (64-bit) instead of 10 MB (when not set by MMStudio preferences)
** Added a variant of the <code>getROI()</code> method that allows getting camera ROI by camera label without having to change current camera (Jon Daniels, ASI)
** Removed previously deprecated methods from CMMCore: <code>clearLog(), getBufferIntervalMs(), saveLogArchive(), saveLogArchiveWithPreamble(), acqBeforeFrame(), acqAfterFrame()</code> (Mark Tsuchida)

* Changes to the MMDevice API
** Added <code>ImgBuffer::SetPixelsPadded()</code> (Marian Zajko, XIMEA)
** Removed previously deprecated member functions from the device interface: <code>MM::Core::OnStatusChanged(), MM::Core::OnFinished(), MM::Core::OpenFrame(), MM::Core::CloseFrame(), MM::Core::SetAcqStatus(), MM::Core::getImageBufferTotalFrames(), MM::Core::getImageBufferFreeFrames(), MM::Core::GetPeripheral(), MM::Core::GetNumberOfPeripherals, MM::Core::getModuleLock(), MM::Core::removeModuleLock(), CDeviceBase<T, U>::OnStatusChanged(), CDeviceBase<T, U>::OnFinished()</code> (Mark Tsuchida)
** Removed the obsolete <code>MM_THREAD_*</code> macros from the device interface (Mark Tsuchida)

* Other changes of interest to developers
** Micro-Manager 1.4.19 is SVN trunk r14582, 3rdpartypublic r171
** <code>MMStudioMainFrame</code> has been split into <code>MMStudio</code> and <code>MainFrame</code> (Chris Weisiger)
** Building Micro-Manager no longer requires zlib (Mark Tsuchida)
** On Unix (GNU build system), Apache Ant is now used to build Java and Clojure components, as is already done on Windows. This requires Ant to be installed, and you need to run <code>make fetchdeps</code> after <code>./configure</code> but before running <code>make</code> the first time (Mark Tsuchida)


== Micro-Manager 1.4.18 (July 31, 2014) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.18.exe Windows 32-bit], 57 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.18.exe Windows 64-bit], 59 MB<br />

[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.18.dmg Mac OS X (Universal Binary)], 44 MB<br />
(OS X 10.8 or later: if the application does not open when double-clicked for the first time, try ctrl-click or right click, then select "Open".)

=== Known issues in 1.4.18 ===

* PCO_Camera: There is an issue with setting the ROI with some cameras (pixelfly QE, pixelfly vga, pco.pixelfly_USB, pco.1300, pco.1300 solar, pco.1400, pco.ultraviolet). If you are affected, replace the mmgr_dal_PCO_Camera.dll file in the Micro-Manager folder with the version available [https://valelab.ucsf.edu/~MM/builds/hotfix/1.4.18/20140806/Windows/32bit/mmgr_dal_PCO_Camera.dll here (for 32-bit MM)] or [https://valelab.ucsf.edu/~MM/builds/hotfix/1.4.18/20140806/Windows/64bit/mmgr_dal_PCO_Camera.dll here (for 64-bit MM)]. The issue is also fixed in nightly builds since 20140801.

* Hang when Position List window is open: This can happen (usually during an MDA) with certain devices (e.g. NikonTI). Closing the Position List before starting an acquisition should prevent the hang. Fixed in nightly build of 20140818.

=== Changes in 1.4.18 (since 1.4.17) ===

* New in the main application
** Improvements to the image display window:
*** Added ability to animate any dataset axis, not just time/Z (Chris Weisiger)
*** Added "superlock" mode to image display windows (click on the lock icon twice) to prevent new images from changing the display at all (Chris Weisiger)
*** Added display of intensity of pixel under the mouse (Chris Weisiger, Jon Daniels)
*** Various layout tweaks
** Improvements to the Stage Position List dialog (Chris Weisiger):
*** Automatically update the stage position when it moves.
*** Improved behavior of "Merge" button
*** Added "Add Offset" button to add a fixed offset to selected positions.
** Improvements to the Options dialog (Mark Tsuchida):
*** Improved layout
*** Removed nonfunctional "autoreload devices" checkbox from Options dialog
*** Save options when dialog is closed via close box
*** Add confirmation before resetting preferences
*** Add ability to automatically delete old log files
** Added "Image Pipeline" dialog (via the Tools menu) for configuring the image data processing pipeline (Chris Weisiger)
** Correctly show "Galvo" devices in Device Wizard (Jon Daniels)
** Improved the Problem Report to provide more information (Mark Tsuchida)
** Added a warning, prior to running pixel calibration, that the stage will move (Mark Tsuchida)
** Ensure windows and dialogs don't load off-screen (Jon Daniels, Chris Weisiger)
** Multipage TIFF files don't write multiple copies of the OME metadata, improving performance/filesizes (Henry Pinkard)
** Multipage TIFF files include an index map at the beginning of the file (Henry Pinkard)
** Include pixel type in acquisition metadata (Mark Tsuchida)
** CoreLog files are now saved in a CoreLogs folder, and a new file is created each time Micro-Manager is started (Mark Tsuchida)
** Generating a Problem Report no longer has the side effect of clearing the usual CoreLog file (Mark Tsuchida)
** In hardware-triggered MDA, avoid reloading sequences to devices when not necessary (Arthur Edelstein)
** Bug fixes:
*** Fixed bug in data saving that caused metadata.txt to be incomplete (Mark Tsuchida)
*** Fixed memory leak when running acquisitions or opening/closing files (Chris Weisiger)
*** Fixed a bug that could cause the display to freeze (Chris Weisiger, Mark Tsuchida)
*** Fixed bug causing spurious error messages when closing the display (Chris Weisiger, Nico Stuurman)
*** Fixed a null pointer exception when drawing multi-camera images (Nico Stuurman)
*** Fixed various bugs when closing acquisitions (Henry Pinkard, Mark Tsuchida)
*** Fixed bug #686 (Autoscale settings are applied inconsistently) (Chris Weisiger)
*** Fixed a bug causing the "Hide MDA Display" option to not be remembered across sessions (Chris Weisiger)
*** Fixed a bug when setting camera ROIs (Mark Tsuchida)
*** Fixed an occasional bug during startup when initializing Beanshell (Mark Tsuchida)
*** Opening ImageJ64.app on OS X 10.8 or later no longer results in an "application damaged" error (Mark Tsuchida)

* New plugins
** Sequence Buffer Monitor: displays memory utilization in the sequence buffer, which can help in optimizing the buffer size (Mark Tsuchida)

* Updated plugins
** [[AcquireMultipleRegions|Acquire Multiple Regions]]: Allow radially weighted interpolation between different Z coordinates in a region (Kurt Thorn)
** [[ASIdiSPIM_Plugin|ASI diSPIM]]: Numerous engancements and fixes (Jon Daniels, ASI; Nico Stuurman)
** '''ASI CRISP''': Support TG-1000 "Tiger" CRISP (Jon Daniels, ASI)
** [[Pixel_Calibrator_Plugin|Pixel Calibrator]]: Return to original position and re-acquire image after calibration (Falk Dettmar)
** [[Projector]]: Enhancements and fixes for SLM ROI support (Arthur Edelstein for Andor)

* New device adapters
** [[CoherentOBIS]]: Coherent OBIS laser controllers (Forrest Collman)
** [[NewportSMC]]: Newport SMC100 motor controller (Liisa Hirvonen, submitted by Newport)
** [[PicardStage]]: Picard Industries USB 4D stage (Johannes Schindelin and Luke Stuyvenberg)

* Updated device adapters
** [[Andor]]: Update to use latest Andor driver, add iXon 888 isolated crop ROIs (Matthew Milford, Andor)
** [[AndorSDK3]]: Fix a crash or hang that could occur when rapidly stopping and restarting a sequence acquisition (Norman Glasgow, Andor)
** [[Arduino]]: Fix an issue when using multiple Arduinos (Nico Stuurman)
** [[ASIStage]]: Add acceleration and firmware version properties, add support for turrets and sliders, correctly detect stage when using 115200 baud, improve wait cycles handling (Jon Daniels, ASI); fix CRISP gain setting (Nico Stuurman)
** [[ASITiger]]: Add support for LED illuminators, add stage wheel speed (firmware 2.87+) property, allow XY stage to be split across two cards, support for firmware 2.88 features, various fixes (Jon Daniels, ASI)
** [[BaumerOptronic]]: Prevent high CPU usage, fix issue with sequence acquisition following ROI change (Eugene Dvoretsky); prevent stale images from being returned and avoid constantly running camera (Mark Tsuchida)
** [[dc1394]]: On windows, update to libdc1394 2.2.1 and support 64-bit (Mark Tsuchida)
** [[DemoCamera]]: Add "rotate image" mode (Chris Weisiger); remove some hard-to-correctly-use testing-related features (Mark Tsuchida)
** [[IIDC]]: Do not reject 1394A cameras, do not skip by default in Linux build (Mark Tsuchida)
** [[Ludl]]: Allow setting of XY step sizes independently (Nico Stuurman)
** [[MCL_MicroDrive]]: Add support for MicroDrive3 and MicroDrive1 (Greg Sawyer, MCL)
** [[NewportCONEX]]: Renamed from CONEX.
** [[Okolab]]: Fix issue with port selection, add active humidifier device support (Marco Di Pasqua, Okolab)
** [[PCO_Camera]]: Fix ROI ROI handling issues, add support for external triggering, various fixes (Franz Reitner, PCO)
** [[pgFocus]]: Add Windows support, bugfixes (Karl Bellvé)
** [[Piezosystem_NV40_1]], [[Piezosystem_NV40_3]], [[Piezosystem_NV120_1]]: Prevent error during MDA (Mark Tsuchida)
** [[PVCAM]]: Limit range of ClearCycles property, fix handling of property settings, bugfixes (Lubomir Walder, Photometrics)
** [[SerialManager]]: Prevent a crash or error when connecting to certain USB-serial interfaces that use Silicon Labs chips (e.g. ASI controllers) on certain Windows systems (Mark Tsuchida)
** [[Tofra]]: Fix state device State and Label properties and channel intensity properties (Mark Tsuchida); fix issue with filter wheel positioning (Ilya Ravkin, Tofra)
** '''VariLC''': Fix a "property name contains reserved chars" error, add properties for absolute retardance and variable time delay (Amitabh Verma)
** [[Versalase|VersaLase]]: Add support for VersaLase devices with up to 4 lasers (David Sweeney, Vortran)

* New closed-source device adapters
** [[NikonEclipse90i]]: Nikon Eclipse 90i motorized microscope (Egor Zindy)

* Updated closed-source device adapters
** [[AxioCam]]: Prevent spurious ROI change after changing binning (Mark Tsuchida)
** [[HamamatsuHam]]: Added new properties for trigger and line speed control (Patrick Gregorio, Hamamatsu); fixed an issue that caused hardware-triggered MDA to fail (Nico Stuurman)
** [[Hamamatsu]] (OS X): Removed 64-bit version, which was not functional (Mark Tsuchida)
** [[Mosaic3]]: Bugfixes (Arthur Edelstein for Andor)

* Changes to the scripting/Java API
** Added new Plugin type, <code>MMProcessorPlugin</code>, for plugins whose purpose is to examine/modify image data in the Image Processor pipeline. See https://micro-manager.org/wiki/Writing_image_processors_for_Micro-Manager for more details. (Chris Weisiger)
** Added the Guava library's Event Bus. Objects can be registered for callbacks using <code>gui.registerForEvents()</code>; see the <code>org.micromanager.api.events</code> package for the list of events that are available. Remember to annotate your functions with <code>@Subscribe</code>.
** Added API functions <code>getImageProcessorPipeline()</code> and <code>setImageProcessorPipeline()</code> (Chris Weisiger)
** Added API function <code>setAcquisitionAddImageAsynchronous(acquisitionName)</code>. This will speed up future calls to <code>gui.addImageToAcquisition()</code>. (Chris Weisiger)
** Added API function <code>getCacheForWindow(ImageWindow)</code> which will return the associated <code>ImageCache</code>. (Chris Weisiger)
** Added new core callback function <code>OnSLMExposure()</code> for when an SLM's exposure time changes (Arthur Edelstein)
** When opening a file from the GUI, the "acquisition" used to load the file data is left resident in memory, allowing its data to be accessed e.g. via <code>gui.getAcquisitionImageCache()</code> (Nico Stuurman)

* Changes to the MMCore API
** MMCore version number is once again maintained (Micro-Manager 1.4.18 ships with MMCore 5.0.3)
** <code>MMEventCallback</code> now has an <code>onSLMExposureChanged()</code> member function (Arthur Edelstein)
** New logging management API (<code>setPrimaryLogFile()</code>, <code>getPrimaryLogFile()</code>, <code>startSecondaryLogFile()</code>, <code>stopSecondaryLogFile()</code>, <code>stderrLogEnabled()</code>) (Mark Tsuchida)
** New <code>getCircularBufferMemoryFootprint()</code> function (Mark Tsuchida)
** The following functions are deprecated and will be removed in the next release: <code>clearLog()</code>, <code>saveLogArchive()</code>, <code>saveLogArchiveWithPreamble()</code>, <code>getBufferIntervalMs()</code>

* Changes to the MMDevice API
** Micro-Manager 1.4.18 requires module interface version 10, device interface version 60.
** The previously deprecated <code>AddavailableDeviceName()</code> function has been removed (use <code>RegisterDevice()</code>)
** Class hierarchy changed for "generic" devices (should not affect device adapter code unless <code>CDeviceBase</code> internals are accessed)
** <code>CDeviceBase::GetPortType()</code> was renamed to <code>GetSerialPortType()</code> to avoid name clash
** <code>g_Keyword_Metadata_Z</code> has been removed (probably never used)
** SLM devices now can issue a notification when the exposure changes
** MMDevice no longer depends on Boost headers
** Device types that were never supported have been removed (CommandDispatch, ProgrammableIO, ImageStreamer)

* Changes of interest to developers
** Micro-Manager 1.4.18 is SVN trunk r13943, 3rdpartypublic r169.
** Removed default access to private members in Beanshell scripts. Call <code>setAccessibility(true)</code> if you need to restore access. (Mark Tsuchida)
** Allow plugins in .class files to be loaded, as long as they are not in packages. (Mark Tsuchida)
** Removed many functions from <code>MMStudioMainFrame</code> that were never used nor exposed in the API. If you have code that relied on one of these methods, let us know. (Chris Weisiger)
** <code>VirtualAcquisitionDisplay</code> has been extensively refactored and moved to the <code>org.micromanager.imagedisplay</code> package. However, if you rely on this module, please let us know, because ideally you shouldn't need to. (Chris Weisiger)
** As part of a project to make the Core object-oriented, MMCore has been refactored to use <code>DeviceInstance</code> objects to manage access to devices (Mark Tsuchida)
** The Core logger (which produces CoreLog) has been completely rewritten, and should longer drop entries during shutdown (Mark Tsuchida)
** Core logging to stderr and the primary log file is not enabled upon CMMCore instantiation; it is explicitly enabled by the application (Mark Tsuchida)
** Building using Ant on Windows now requires running <code>ant -f buildscripts/fetchdeps.xml</code> beforehand to download Ant extensions

== Micro-Manager 1.4.17 (April 30, 2014) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.17.exe Windows 32-bit], 55 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.17.exe Windows 64-bit], 57 MB<br />

[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.17.dmg Mac OS X (Universal Binary)], 43 MB<br />
(Note for OS X 10.8 or later: if the application does not open when double-clicked for the first time, try ctrl-click or right click, then select "Open".)

=== Known issues in 1.4.17 ===

* On Windows, connecting to devices that use a Silicon Labs USB-serial chip may result in a crash or error message. Affected devices include ASI stage controllers (when connected via USB) and certain USB-serial adapters. If you experience this, replace the mmgr_dal_SerialManager.dll file in the Micro-Manager folder with the version available [https://valelab.ucsf.edu/~MM/builds/hotfix/1.4.17/20140715/Windows/32bit/mmgr_dal_SerialManager.dll here (for 32-bit MM)] or [https://valelab.ucsf.edu/~MM/builds/hotfix/1.4.17/20140715/Windows/64bit/mmgr_dal_SerialManager.dll here (for 64-bit MM)].

* On OS X 10.8 or later, when opening ImageJ64.app, you may get an error message saying that the application is "damaged". If so, you need to temporarily enable the following setting while opening the application for the first time: System Preferences > Security & Privacy > General > Allow applications downloaded from > Anywhere. Once opened successfully, the error should go away even if you switch back the security setting.

=== Changes in 1.4.17 (since 1.4.16) ===

* New in the main application
** Make Tile Creator ("Create Grid") use the correct stages (Nico Stuurman)
** Tile Creator "Center Here" button no longer immediately closes the dialog (Chris Weisiger)
** Fix bug in position list where removing multiple positions could cause the wrong positions to be removed (Chris Weisiger)
** Plugins menu is now organized into categories, sorted alphabetically, and has improved tooltips (Nico Stuurman, Mark Tsuchida)
** New "Report Problem" interface (Mark Tsuchida)
** Script Panel has improved syntax highlighting, line numbers, and code folding (Nico Stuurman)
** Make "display fps" reflect reality (Nico Stuurman)
** Fix bug that caused some debug logging entries to be logged even when debug logging is off (Mark Tsuchida)
** Fix a memory leak that could occur during long sequence acquisitions (Mark Tsuchida)
** MAC address enumeration issue on Linux is fixed (Erik Hvatum)
** Add cancel button to splash screen (Nico Stuurman)
** Various bigfixes and minor enhancements (Nico Stuurman, Henry Pinkard, Arthur Edelstein, Chris Weisiger, Mark Tsuchida)

* New plugins
** [[AcquireMultipleRegions|Acquire Multiple Regions]] Automatically acquire multiple regions of a sample (Kurt Thorn)
** [[AutoLase]]: Real-time closed-loop control of density of photoactivated molecules during PALM measurement (Thomas Pengo, Seamus Holden)
** [[Tracker Plugin|Live Tracking]] (revived): Use image correlation to countersteer the XY stage (Nico Stuurman, Mark Tsuchida)
** [[pgFocus]]: Control the pgFocus open-source software/hardware focus stabilization device (Karl Bellve)

* Updated plugins
** [[ASIdiSPIM Plugin|ASIdiSPIM]]: Numerous enhancements (Jon Daniels, ASI; Nico Stuurman)
** BFCorrector: Fix handling of 16-bit pixels; marked BFCorrector as obsolete as it is superseded by MultiChannelShading
** [[MultiChannelShading|Multi-Channel Shading]]: Fix crash when defining new groups (Kurt Thorn)
** [[Projector]]: Enhancements to ROI support (Arthur Edelstein)
** [[Stage Control]]: Wait for device to finish movement before updating displayed position (Nico Stuurman)

* New device adapters
** [[CONEX]]: Newport CONEX-CC DC-Servo Controller (Newport)
** [[IIDC]]: IIDC 1394 cameras (future replacement for [[dc1394]], currently monochrome only) (Mark Tsuchida)
** [[MoticCamera]] (new on OS X): Motic cameras (Motic)
** [[ObjectiveImaging]]: Objective Imaging OASIS controller (Egor Zindy)
** [[pgFocus]]: pgFocus (open-source software/hardware focus stabilization device) (Karl Bellve)
** [[PICAM]]: Princeton Instruments cameras, using the PICAM SDK (Toshio Suzuki)
** [[ThorlabsAPTStage]]: Thorlabs APT family linear stages (a newly extended version of ThorlabsDCStage) (Egor Zindy)
** [[ThorlabsMFC1]]: Thorlabs MFC1 Motorized Microscope Focus Controller (Thomas Zangle)

* New closed-source device adapters
** [[Mosaic3]]: Andor Mosaic 3 Digital Mirror Device (Arthur Edelstein for Andor)

* Updated device adapters
** [[Andor]]: Fix actual interval property and error during external trigger; Fix spurious noise filter control (Matthew Milford, Andor)
** [[AndorLaserCombiner]]: Add SaveLifetime and IsLinear properties; allow TTL option in Enable property (Pariksheet Nanda)
** [[AndorSDK3]]: Add support for Auxiliary Out TTL I/O pin; Linux support; various bugfixes (Norman Glasgow, Andor; Erik Hvatum)
** [[ASITiger]]: Add property to reverse axis directions and interchange X and Y; various fixes and minor enhancements (Jon Daniels, ASI)
** [[IDS_uEye]]: Add color support, bit depth selection, and external trigger; improve binning support (Wenjamin Rosenfeld)
** [[NikonTE2000]]: Fix Uniblitz shutter support (Mark Tsuchida)
** [[PCO_Camera]]: Fixed time setting, ROI, and binning issues; tested simultaneous full-fps acquisition with two pco.edge_4.2 using Multi Camera; various bugfixes (Franz Reitner, PCO)
** [[PI_GCS_2]]: Add support for C-865 and E-816 (E-665, E-625, E-621) with firmware < 2.11; added E-709 and C-884 as preconfigured controller; default axis names are now "1" and "2"; fixed hang with C-867.262; other fixes and enhancements (Steffen Rau, Physik Instrumente)
** [[Piper]]: Reinstated (was missing from 1.4.16 due to build compatibility issues); improved handling of property updates (Terry Sprout for Stanford Photonics)
** [[PVCAM]]: Add ExposeOutMode property; support new trigger modes for OptiMos; various fixes; OptiMos users should update to PVCAM 3.0.1.2 (Lubomir Walder, Photometrics)
** [[ThorlabsDCStage]]: See new [[ThorlabsAPTStage]]
** [[TISCam]]: Support Y16 mode; add white balance red/blue properties (Falk Dettmer)
** [[XCiteLed]]: Fix issue caused by comma in property name (Mark Tsuchida)
** [[XIMEA]]: Fix bit depth reported by camera (Egor Zindy)
** [[XLight]]: Fixes and enhancements (Enzo Chiarappa, Crestoptics)
** [[ZeissCAN]]: Add StepSize property to XYStage (Nico Stuurman)
** [[ZeissCAN29]]: Add ND filter wheel support; change condenser position limit from 7 to 8 (Nico Stuurman)

* Updated closed-source device adapters
** [[HamamatsuHam]]: Added support for Defect Correct Mode (Patrick Gregorio, Hamamatsu)
** [[NikonTI]]: No longer crash when loading DiaLamp (remaining bug: config may need to be loaded twice) (Mark Tsuchida)

* Retired device adapters
** [[Hamamatsu]] on Windows: Please use HamamatsuHam instead

* Changes to the scripting API
** <code>createAcquisition()</code> is deprecated (use <code>openAcquisition()</code>)
** <code>getAcquisition()</code>, <code>getAcqDlg()</code>, and <code>getXYPosListDlg()</code> are deprecated
** <code>getAcqusitionSettings()</code> (sic.) is now <code>getAcquisitionSettings()</code>
** <code>propmtToSaveAcqusition()</code> (sic.) is now <code>promptToSaveAcquisition()</code>
** Deleted previously deprecated methods.

* Changes to the MMCore API
** Added overloads of <code>getShutterOpen()</code> and <code>setShutterOpen()</code> that take the shutter device label as an argument
** Three methods now throw <code>CMMError</code>: <code>definePixelSizeConfig()</code> (two overloaded methods), <code>isPixelSizeConfigDefined()</code>

* Changes to the MMDevice API
** None

* Changes of interest to developers
** Micro-Manager 1.4.17 is SVN r13272, 3rdpartypublic r163
** The paths from which to load the MMCoreJ_wrap native library and device adapters are now configurable; the default for device adapters is the directory containing the MMCoreJ_wrap or MMCorePy_wrap library (Mark Tsuchida)
** Fixed loading of MMCoreJ_wrap native library when running on Java 7 on OS X (Mark Tsuchida)
** Unix build scripts (using GNU build system) have been substantially updated (Mark Tsuchida)
** Unix 'make install' can create launch script (Mark Tsuchida)
** MMCorePy built on OS X or Linux is no longer broken (Mark Tsuchida)
** Mac OS X binaries are now built with Xcode 5.x (previously 3.2) (Mark Tsuchida)
** Mac OS X binaries no longer contain PowerPC support (Mark Tsuchida)
** Visual studio 2010 Debug builds of MMCoreJ_wrap.dll should now work on computers that do not have Visual Studio 2008 installed (Mark Tsuchida)
** Communication over FTDI USB-serial interface now sends 1 USB packet per message, rather than breaking up messages into bytes (Mark Tsuchida)

== Micro-Manager 1.4.16 (January 31, 2014) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.16.exe Windows 32-bit], 50 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.16.exe Windows 64-bit], 50 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.16.dmg Mac OS X (Universal Binary)], 46 MB<br />

=== Changes in 1.4.16 (since 1.4.15) ===

* New in the main application
** Optimize handling and display of images at high framerate and of large RGB images (Nico Stuurman, Henry Pinkard, Arthur Edelstein)
** High-throughput acquisition pipeline (former "Fast Storage" in Tools > Options) is now always enabled
** Display images using LUTs via popup menu in Contrast panel (Nico Stuurman)
** Display time in hours and minutes for long acquisitions (Hadrien Mary, Mark Tsuchida)
** Bugfixes for hardware-triggered sequence acquisition (Arthur Edelstein)
** Improvements and bugfixes to OME metadata (Henry Pinkard)
** Stage position list is now included in the summary metadata (InitialPositionList property) (Mark Tsuchida, Henry Pinkard)
** Do not save corrupted image files on certain non-English version of Windows (e.g. Chinese) (Mark Tsuchida)
** Lots of additional bugfixes (Nico Stuurman, Nenad Amodaj, Henry Pinkard, Mark Tsuchida)

* New plugins
** [[ASIdiSPIM_Plugin|ASI diSPIM]] - Control the ASI iSPIM and diSPIM (Jon Daniels, ASI, and Nico Stuurman)
** [[MultiChannelShading]] - Independent shading correction (flat-fielding) of multiple channels (Kurt Thorn)

* Updated plugins
** Data Browser: No longer missing on Windows
** Localization Microscopy: Add support for MLE for fitting (Nico Stuurman, Arthur Edelstein)
** Projector: Improve SLM support and calibration (Arthur Edelstein)
** Live Replay: Bugfixes (Nico Stuurman)
** Stage Control: Select Z axis, adapt to stage availability, display Z position (Nico Stuurman)

* New device adapters
** BiostepEagleIce - biostep EagleIce camera (Jens Gl√§ser, biostep GmbH)
** Piezosystem_NV40_1, Piezosystem_NV40_3, and Piezosystem_NV120_1 (Chris Belter, piezosystem jena)
** XLight - CrestOptics X-Light spinning disc confocal unit (Enzo Chiarappa, CrestOptics)
** Zaber - Zaber ASR microscope stage (Nathan Dyer, Zaber Technologies)

* New closed-source device adapters
** OlympusIX83 (Arthur Edelstein; thanks to those who helped with testing)

* Updated device adapters
** ABS: Fix issue with USB 3.0 cameras (ABS GmbH Jena)
** AndorSDK3: Support for AOIs larger than sensor size; Add timeout property for external trigger (Norman Glasgow, Andor Technology)
** Arduino: Bigfix for Blanking setting (Nico Stuurman, Mark Tsuchida)
** ASITiger: Lots of bugfixes and new functionality (Jon Daniels, ASI)
** GigECamera: Use JAI SDK 1.4.1; some bugfixes (Mark Tsuchida)
** IDS_uEye: Fix pixel clock, framerate, and exposure settings (Wenjamin Rosenfeld)
** Ludl: Support 10-position filter wheels (Nico Stuurman)
** LumencorSpectra: Bugfixes (Mark Tsuchida)
** MCCDAQ: Fix DAC channels 5-7, allow to use with DAShutter (Mark Tsuchida)
** MoticCamera: Support 16-bit and 48-bit images (Jin Chen, Motic)
** PCO_Generic: Improve support for pco.edge, color image transfer; add support for white balancing, double shutter, IR mode, and Sensicam gain setting (Franz Reitner, PCO AG) 
** PI_GCS_2: Improve communication latency; fix issue with C-867.262 (Richard Montbrun and Steffen Rau, Physik Instrumente)
** Prior: Add speed and acceleration control for Z (Korbinian Kapsner)
** PVCAM: Fix bug that prevented shutter from closing after acquisition; Bugfixes for ROI of binned images and other issues (Lubomir Walder, Photometrics)
** Rapp: User no longer needs to install DLLs
** ScopeLED: Lots of improvements; simplify properties (Ryan Clark, DiCon/ScopeLED)
** SpectralLMM5: Support USB (HID) on Windows (Mark Tsuchida)
** ThorlabsUSBCamera: Improve exposure setting handling (Nenad Amodaj)
** TISCam: Add support for Y16 and RGB24 mode (Falk Dettmar)
** XCite120PC_Exacte: Fix communication issues (Lon Chu, Mission Bay Imaging for Lumen Dynamics)
** ZeissCAN: Enable control of XY stage via MCU 28 directly connected to computer (Mark Tsuchida)
** ZeissCAN29: Add support for reflected light switcher and external lamp mirror (Nico Stuurman)

* Updated closed-source device adapters
** ESImagingIOController: Fix sporadic errors in shutter (Ed Simmons)
** HamamatsuHam: Bugfixes and enhancements (Patrick Gregorio, Hamamatsu Photonics)
** NikonTI: Robustify PFS single-focus cycle (Mark Tsuchida)
** RaptorEPIX: Support for Kingfisher cameras (David Biggs, Raptor Photonics)

* Changes of interest to developers
** Uncaught Java exceptions in threads and event handlers are now logged (Mark Tsuchida)
** Better support for SLM devices, including triggering (Arthur Edelstein)
** AddAvailableDeviceName() is deprecated; use RegisterDevice() instead (Mark Tsuchida)
** On Windows, C++ components are now built with Visual Studio 2010 SP 1 (Mark Tsuchida)
** Visual Studio projects now use common property sheet files (Mark Tsuchida)
** On Windows, device adapters link to MMDevice static library rather than including source (Mark Tsuchida)
** On Windows, Structured Exception Handling is disabled in all C++ components (Mark Tsuchida)
** Acquisition scripting API refactoring (Nenad Amodaj)

== Micro-Manager 1.4.15 (September 23, 2013) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup_32bit_1.4.15.exe Windows 32-bit], 50 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup_64bit_1.4.15.exe Windows 64-bit], 50 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.15.dmg Mac OS X (Universal Binary)], 46 MB<br />

=== New in 1.4.15 ===

* New in the Main Application
** [[High Speed Acquisition in Micro-Manager|High speed acquisition]] implemented, to allow up to 1.1 GB/s acquisition, with storage to RAM or to (high-speed) disk (Arthur Edelstein)
** New High Content Screen plugin added (Nenad Amodaj)
** MLE fitting and subranging features added to Localization Microscopy plugin (Nico Stuurman, Arthur Edelstein)
** Tile Creator improved to allow centering of a grid at the current location (Brian Teague)
** Histogram improved to include display of current display min and max (Henry Pinkard)
** Bugs fixed in main application, acquisition engine, Slide Explorer (1), Image Flipper, Live Replay, Multi Camera, and Stage Control plugins

* New Device Adapters
** ASITiger - ASI TG-1000 "Tiger" Controller (Jon Daniels, ASI)
** FLICamera - Finger Lakes Instrumentation cameras (Jim Moronski, FLI)
** IDS_uEye - IDS uEye USB cameras (also Thorlabs DCUxxxx, Edmund EO-xxxxM) (Wenjamin Rosenfeld)
** MCCDAQ - Measurement Computing PCI-DDA08/16 (Matthew Bakalar)
** Okolab - Okolab Microscope Incubators (Marco Di Pasqua, Okolab)
** Oxxius - Oxxius Laser Controller (Julien Beaurepaire, Oxxius)
** Piezosystem_30DV50 - piezosystem jena 30DV50 digital controller (Chris Belter, piezosystem jena)
** Piezosystem_dDrive - piezosystem jena d-Drive digital controller (Chris Belter, piezosystem jena)
** Standa - Standa Microstep stepper motor driver (Clarence Leung)
** HIDManager - serial interface to USB Human Interface Devices (Nico Stuurman)

* New Closed-Source Device Adapters
** SigmaKoki - Sigma Koki stages and shutters (Hiroki Kibata, Sigma Koki)

* Updated Device Adapters
** ABS: Update to new API with improved 64-bit support (ABS Jena)
** Andor: Fix pre-amp gain display; support centralized crop mode on iXon Ultra; add Region of Interest property; fix Output Amplifier setting behavior when Frame Transfer is enabled (Matthew Milford, Andor)
** AndorLaserCombiner: Add Enable property to allow independent control of power and on/off (Pariksheet Nanda)
** AndorSDK3: Add Frame Rate Control property; Optimize for speed; Add read-only informational properties; Support hardware timestamp from camera; Support multiple cameras; Fix binning-related bug; Improve ROI support (Norman Glasgow, Andor)
** ASIStage: Allow triggered Z stage to ignore initial pulses (Arthur Edelstein); Fix axis identity and CRISP axis setting; Improve support for Z stage ring buffer (Nico Stuurman)
** BaumerOptronic: Fixed bug causing acquisition to start before shutter opens (Mark Tsuchida)
** Cobolt: Add shutter and power control (Alexis Maizel)
** DemoCamera: UseSequences property for CDemoStage
** GigECamera: Fix bug in binning setting; Add acquisition mode property (Heng Xu); Fix issue with short exposure snaps (Mark Tsuchida)
** GPhoto: Minor updates (Koen De Vleeschauwer); Add to OS X build (Nico Stuurman)
** LeicaDMI: Fix issues related to 0-step movement of stage and TL polarizer; Add delay setting for halogen lamp (Brian Teague); Support for FastFilterWheel (Arthur Edelstein)
** LumencorSpectra: Fix State property (Louis Ashford, Lumencor); Make LightEngine selection a pre-init property; Allow switching individual colors independently of shutter state; Improve default settings (Nico Stuurman)
** MCL_MicroDrive: Support stages without encoders (Arthur Edelstein)
** OpenCVgrabber: Add OS X version; Add camera selection (Nico Stuurman)
** PCO_Generic: Support for 64-bit; Noise filter mode for pco.edge; Support multiple cameras; Bug fixes (Franz Reitner, PCO AG)
** PVCAM: Support microsecond exposure resolution for Photometrics cameras; Fixed an issue with some properties; Add support for additional metadata from the camera (Windows); Add support for callback acquisition (optimized for high-speed acquisition) (Windows); PVCAM 2.9.5 is now required on Windows (Lubomir Walder and Andrej Bencur, Photometrics)
** QCam: Support multiple cameras (Mark Tsuchida)
** ScopeLED: Add ActivePresetMode property (Ryan Clark, DiCon Lighting)
** SerialManager: Fix binary message logging in CoreLog (Mark Tsuchida)
** SpectralLMM5: Add support for USB HID ports; Add per-line switching (Nico Stuurman)
** ThorlabsDCxxxx: Add DC4104 device (Korbinian Kapsner)
** ThorlabsUSBCamera: Remove duplicate exposure property (Mark Tsuchida); Support for 8 and 16 bit mode, high frame rates with USB3, FPS property, color mode, binning, metadata (Nenad Amodaj)
** TISCam: No longer need to manually install DLLs from vendor
** TSI (Thorlabs Scientific Imaging): Add Gain property (Nenad Amodaj)
** TwainCamera: Handle legacy devices better (Erich Hoover)
** Utilities: New DAMonochromator device (Ed Simmons); Bugfixes for MultiCamera (Nico Stuurman, Arthur Edelstein)
** VariLC: Add device detection support; Add Palette support; Add properties for active and total LCs; Display device version number (Amitabh Verma and Grant Harris)
** Vortran: New device: VersaLase (David Sweeney, Vortran Laser Technology)
** ZeissCAN29: Fix a crash related to condenser contrast setting (Nico Stuurman)

* Updated Closed-Source Device Adapters
** AxioCam: Add support for AxioCam MRc5 (Henry Pinkard); Fix bugs causing crashes (Mark Tsuchida)
** ESImagingIOControllers: New sequence storage method, stimulus mode (requires new controller firmware) (Ed Simmons)
** HamamatsuHam: Updates, enhancements, and bugfixes (Patrick Gregorio, Hamamatsu)
** Micropix: Support multiple instances of the device (Ed Simmons)
** NikonTI: A near-complete rewrite to improve stability and provide better diagnostics and logging for errors; Installers for up-to-date Nikon driver software (not in the Micro-Manager installer; please see the MM wiki page for NikonTI) (Mark Tsuchida)
** Olympus: Bugfixes (Arthur Edelstein)

* Changes Relevant to Developers Only
** Logging of user interface activity added (Arthur Edelstein)
** Dependencies in acquisition engine on Micro-Manager gui instance removed (Arthur Edelstein)
** New build scripts for Windows (Mark Tsuchida)
** Clean up usage of default sequence acquisition implementation in CCameraBase (Nenad Amodaj)
** Slightly improve CoreLog format (Mark Tsuchida)
** Prevent some spurious errors in CoreLog (Nico Stuurman)
** Prevent mmgr_dal_X.Y from being recognized as a device adapter on Windows, where Y is not "dll"

== Micro-Manager 1.4.14 (March 20, 2013) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.14.exe Windows 32-bit], 46 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.14.exe Windows 64-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.14.dmg Mac OS X (Universal Binary)], 49 MB<br />

== Micro-Manager 1.4.13 (November 30, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.13.exe Windows 32-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.13.exe Windows 64-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.13.dmg Mac OS X (Universal Binary)], 48 MB<br />

== Micro-Manager 1.4.12 (November 17, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.12.exe Windows 32-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.12.exe Windows 64-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.12.dmg Mac OS X (Universal Binary)], 48 MB<br />

==== New in 1.4.12 ====

* Bug fix:
** Micro-Manager exits properly now
* New device adapter:
** SutterMPC Multi-Manipulator controller (David Biggs)

== Micro-Manager 1.4.11 (November 8, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.11.exe Windows 32-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.11.exe Windows 64-bit], 45 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.11.dmg Mac OS X (Universal Binary)], 48 MB<br />

==== New in 1.4.11 ====

* New Features:
** Improved multicamera support
** Single-file, multi-image OME TIFF output format (Henry Pinkard)
** On-the-fly image processing plugin framework (TaggedImagePipeline)
** Major improvements to Hardware Configuration Wizard (Nenad Amodaj)
* Plugins:
** DLLAutoReloader plugin (automatically reloads device adapters)
** Projector plugin enhancement: support for Rapp UGA40 galvo device
* New device support:
** Andor Neo and Zyla cameras (AndorSDK3), David Gault, Norman Glasgow)
** LeicaDMSTC XY Stage (G. Esteban Fernandez)
** LumencorCIA (Louis Ashford)
** MoticMicroscope
** Rapp UGA40 Galvo frap device
** RaptorEPIX camera (David Biggs)
** TOFRA components (Ilya Ravkin)
** Zeiss AxioCam (Henry Pinkard)

== Micro-Manager 1.4.10 (April 19, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.10.exe Windows 32-bit], 40 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.10.exe Windows 64-bit], 39 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.10.dmg Mac OS X (Universal Binary)], 47 MB<br />

==== New in 1.4.10 ====

* Numerous bug fixes in image display and contrast panels
* Open Micro-Manager data sets either into memory (RAM) or as virtual stacks.
* New Device Adapters:
** Mightex_BLS
** Till iMic
** Till Polychrome V
* Improved HamamatsuHam adapter, supports the Flash4.0

== Micro-Manager 1.4.9 (March 22, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.9.exe Windows 32-bit], 40 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.9.exe Windows 64-bit], 39 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.8.dmg Mac OS X (Universal Binary)], 47 MB<br />

==== New in 1.4.9 ====

* Brought back missing Andor DLLs
* Fixed problem of starting MDA during live mode
* Upgraded java to latest version -- 1.6.0_31

== Micro-Manager 1.4.8 (March 21, 2012) ==

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.8.exe Windows 32-bit], 40 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.8.exe Windows 64-bit], 39 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.8.dmg Mac OS X (Universal Binary)], 47 MB<br />

==== New in 1.4.8 ====

* Substantially improved display performance
* Improved support for color cameras and multiple cameras
* Improved contrast panels
* A large number of bug fixes
* A new Gaussian fitter plugin that lets you fit and track diffraction limited spots
* Support for a new (beta) device type: Galvos (for phototargeting; currently the Rapp UGA40).
* New devices, including:
** Aladdin pump (Kurt Thorn)
** Lumencor Spectra (Louis Ashford)
** Micropix Cameras (Ed Simmons)
** Mightex (Yihui Wu)
** Motic Cameras
** MP285 (Sutter Instruments, Mission Bay Imaging)
** NPointC400 (Mission Bay Imaging)
** Omicron (Jan-Erik Herche, Ralf Schlotter)
** VariLC (Rudolf Oldenbourg, MBL)
** Ximea Cameras (Marian Zajko)

=== Micro-Manager 1.4.7 (November 17, 2011) ===

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.7.exe Windows 32-bit], 39 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.7.exe Windows 64-bit], 37 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.7.dmg Mac OS X (Universal Binary)], 39 MB<br />

==== New in 1.4.7 ====

* Support for multiple cameras (see Utilities->Multi-camera adapter)
* Improved color camera live and snap
* Many bug fixes to multi-dimensional acquisition
* Added option to provide custom time intervals in MDA
* New/Improved device support:
**OpenCVGrabber (Ed Simmons)
** New PI GCS adapter (Stephen Rau)
** Improved Thorlabs DCxxxx (Olf Wohlmann)
** PCO adapter now supports new CMOS cameras (Franz Reitner)
** Support for nPoint stages (Mission Bay Imaging)
** XCite LED (Mission Bay Imaging)
** Thorlabs piezo stage (Nenad Amodaj)
** Updated ABS Camera (now also 64-bit, Heiko Baumann)
** ASI CRISP support, including plugin (Nico Stuurman)

=== Micro-Manager 1.4.6 (September 2, 2011) ===

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.6.exe Windows 32-bit], 17 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.6.exe Windows 64-bit], 35 MB<br />
[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.6.dmg Mac OS X (Universal Binary)], 39 MB<br />

==== New in 1.4.6 ====

* Hardware triggering integrated with Multi-Dimensional Acquisition
* New device support:
** Scientifica stages (Mathew Player)
** Andor3 (supports new Neos camera)
** CARV II spinning disk confocal
** MCU28 (Zeiss CAN XY stage - Nenad Amodaj)
* Pluggable display API (ImageCacheListener)
* Split View Plugin restored to 1.4
* Clojure Editor Plugin
* Fixes to ZeissCAN29
* Changes in Hardware Configuration Wizard

=== Micro-Manager 1.4.5 (June 13, 2011) ===

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.5.exe Windows 32-bit], 17 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.5.exe Windows 64-bit], 35 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.5.dmg Mac OS X (Universal Binary)], 31 MB<br />

=== Micro-Manager 1.4.4 BETA (April 7, 2011) ===

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.4.exe Windows 32-bit], 17 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.4.exe Windows 64-bit], 34 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.4.dmg Mac OS X (Universal Binary)], 31 MB<br />

==== New in 1.4.4 ====

* Thorlabs BD102 stage (Nenad Amodaj)
* Well plate plugin (Big.jar, Karl Bellve)
* New libusb drivers for K8055
* Script interface to add runnables in acquisition engine
* SimpleCam module with GPhoto support
* Enhanced Contrast Panels (ignore outliers)
* Saving and display on separate threads
* Leica AFC (Hardware Autofocus) (mostly working)
* Numerous bug fixes

=== Micro-Manager 1.4.2 BETA (March 2, 2011) ===

[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/32bit/MMSetup32BIT_1.4.2.exe Windows 32-bit], 17 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Windows/64bit/MMSetup64BIT_1.4.2.exe Windows 64-bit], 34 MB<br />[http://valelab.ucsf.edu/~MM/builds/1.4/Mac/Micro-Manager1.4.2.dmg Mac OS X (Universal Binary)], 31 MB<br /><br />

=== Micro-Manager 1.4.0 BETA (February 28, 2011) ===

- [http://valelab.ucsf.edu/~MM/nightlyBuilds/1.4/Windows/MMSetup32BIT_1.4.0_20110227.exe Windows 32-bit], 17 MB<br /> - [http://valelab.ucsf.edu/~MM/nightlyBuilds/1.4/Windows/MMSetup64BIT_1.4.0_20110227.exe Windows 64-bit], 34 MB<br /> - [http://valelab.ucsf.edu/~arthur/Micro-Manager1.4.0.dmg Mac OS X (Universal Binary)], 31 MB<br />

==== New in 1.4 ====

* Windows native 64-bit support (most devices are supported)
* Support for multiple cameras (see Utilities->Multi-camera adapter)
* Improved color camera live and snap
* Hardware triggering integrated with Multi-Dimensional Acquisition
* Enhanced Contrast Panels (ignore outliers)
* Saving and display on separate threads
* A new multi-dimensional acquisition engine (under the hood), including
** a smart sequencer that uses burst acquisition whenever possible
** an image pipeline allowing plugins to process images on the fly
** a flexible metadata system for programmers
** option to provide custom time intervals in MDA
* Close integration with ImageJ hyperstacks
** four "dimension sliders": channels, slices, frames, positions
** display of RAM- or disk-based image sets during or after acquisition, including disk-based image sets larger than available RAM
* An image display control panel (in the main window) that lets you
** easily adjust contrast for each channel
** add a scale bar
** view metadata and add comments for image sets and individual image planes
* Simplified hardware configuration, including auto-detection and auto-setup of a number of serial devices.
* Data Browser plugin for quickly browsing through Micro-Manager data sets
* Well plate plugin (Big.jar, Karl Bellve)
* Clojure Editor Plugin
* Script interface to add runnables in acquisition engine
* Pluggable display API (ImageCacheListener)
* Automated bug reports, available in Help > Report Problem
* New/Improved device support:
** New PI GCS adapter (Stephen Rau)
** Improved Thorlabs DCxxxx (Olf Wohlmann)
** PCO adapter now supports new CMOS cameras (Franz Reitner)
** Support for nPoint stages (Mission Bay Imaging)
** XCite LED (Mission Bay Imaging)
** Thorlabs piezo stage (Nenad Amodaj)
** Updated ABS Camera (now also 64-bit, Heiko Baumann)
** ASI CRISP support, including plugin (Nico Stuurman)
** Scientifica stages (Mathew Player)
** Hamamatsu support by Hamamatsu (Patrick Gregorio), works with Flash 4.0
** Fixes to ZeissCAN29
** Thorlabs BD102 stage (Nenad Amodaj)
** Thorlabs Scientific Imaging (TSI) Camera
** AndorSDK3 (supports new Neo camera)
** CARV II spinning disk confocal
** MCU28 (Zeiss CAN XY stage - Nenad Amodaj)
** Coherent Sapphire Laser (Karl Hoover and Paul Wiggins)
** GigECamera (David Marshburn, UNC-CH)
** Mac support for SPOT (Erwin Frise)
** SimpleCam module with GPhoto support
** Leica AFC (Hardware Autofocus) 
** New libusb drivers for K8055
** Meiji Techno EMZ focus stage (Koen De Vleeschauwer)
** Tethered Cameras (Canon and Nikon) (Koen De Vleeschauwer)
** X-Cite 120PC Exacte (Mission Bay Imaging)
** Image Processor Chain - provides sequencing of C++-based image processors in the Micro-Manager core

{{Note|Burst acquisition (formerly a separate utility in 1.3) has been merged with multi-dimensional acquisition -- if you want to do a burst, simply select "Time Points" only and set the time interval to 0.}}


== Micro-Manager 1.3 ==

=== Micro-Manager 1.3.49 (June 13, 2011) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1.3.49.exe 32 bit Windows XP, Windows 7], 14 MB<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager1.3.49.dmg Mac OS X (Universal Binary)], 34 MB<br /> - [http://www.endrov.net/index.php?title=Installing_Micromanager_on_Linux Debian/Ubuntu Linux]

'''New in 1.3.49 (a minor update):'''
* Bug fixes in:
** The Imaging Source Camera
** Sutter DG4 filter wheel
** PCO Camera
** ABS Camera
* Thorlabs BBD102 xy stage

- [[Micro-Manager Version Archive|Previous releases]]

=== Micro-Manager 1.3.48 (March 2, 2011) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1.3.48.exe 32 bit Windows XP, Windows 7], 13 MB<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager1.3.48.dmg Mac OS X (Universal Binary)], 34 MB<br /> - [http://www.endrov.net/index.php?title=Installing_Micromanager_on_Linux Debian/Ubuntu Linux]

* New devices:
** No Name Laser Combiner
** XCiteExacte Fluorescence Microscopy Illumination system - thanks to Mission Bay Imaging
** Meiji Techno EMZ focus stage - thanks to Koen De Vleeschauwer
** Tethered Camera adapter for Canon and Nikon cameras - thanks to Koen De Vleeschauwer<br>(uses DSLRRemote, NKRemote, or PSRemote libraries)
** GigECamera - thanks to David Marshburn
** Coherent Sapphire Laser
* Device Adapter bug fixes and improvements
** Princeton Instruments camera
*** correct handling of output ports
** Spot Camera
*** unified code should be running on Windows and OS X
** Sutter Lambda
*** some patches for various communication glitches on Lambda 10-2 and Lamdba SC
** DemoCamera and others
*** cleanup of superfluous references to boost libraries.
** Andor Camera
*** support for iXon features such as: count convert, optacquire, various filters
*** support for isolated crop mode
*** fix bug in binning
** SimpleAutofocus
*** fix a problem where the adapter would crash if selected as a 'synchronized' device.
*** performance improvement in median filter algorithm
*** fix a compile problem only appearing on Linux g++
** NikonTI
*** more patches
** DTOpenLayer
*** improve handling of voltage ranges
** Yokogawa CSUX
*** ensure CSUX hub supports the brightfield port before creating bright field property
** Scion
*** revert to adapter from about February 2010
** PCO Camera
*** add OnEMLeftROI property
*** add skip frame support
* Bug fixes in core & acquisition:
** TileCreatorDlg.java
*** correct numbering of columns
*** only add Z to meta data if it's in use,
*** write column and row into metadata.
** MMAcquisitionEngineMT.java - fix a problem where Autofocus was not restored after the acquisition
** MMCore.cpp - fix a problem where one mis-communicating device prevents user from correcting the hardware configuration.

=== Micro-Manager 1.3.47 (November 1, 2010) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1.3.47.exe Windows XP], 13 MB<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager1.3.47.dmg Mac OS X (Universal Binary)], 34 MB<br /> - [http://www.endrov.net/index.php?title=Installing_Micromanager_on_Linux Debian/Ubuntu Linux]

* New devices:
** Agilent Laser Combiner
** Lumen Dynamics (Exfo) X-Cite 120PC
** Olympus MT20 (Michael Mitchell, EMBL)
** Pololu Maestro Servo Controller
* Several bug fixes and improvements in device code:
** Andor camera
** Leica camera
** Mad City Labs motion controller
** NikonTI microscope
** Olympus microscope
** PCO camera
** Photometrics camera
** QImaging camera
** Scion camera
** Serial adapter
** Spot camera
** SutterLambda controller
** TheImagingSource camera
* Bug fixes in the user interface:
** Contrast Panel
** Multi-dimensional acquision
** Slide Explorer Plugin

Version 1.3 of Micro-Manager has stabilized: further changes to 1.3 will be limited to bug fixes.<br />New features in Micro-Manager will be introduced in version 1.4.

=== Micro-Manager 1.3.43 (December 23, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_43.exe Windows XP, 9 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager1.3.43.dmg Mac OS X(Universal Binary), 34 MB]<br />

* Newly supported devices
** SLM/Projector support
** Andor Laser Combiner (not yet tested!)
** Prior NanoScanZ
* Improved Device Support
** Nikon Eclipse Ti microscope now works with latest driver 2.0.2 from Nikon
** Nikon Eclipse Ti microscope: user can now select Speed and Tolerance of stage axes
** Nikon IntensiLight Neutral Density filters
** DemoCam now supports color image generation
** Update to Photometrics / Roper Scientific libraries (thanks to Photometrics)
** Fix image freezing problem seen with Hamamatsu cameras
** Improved Support for QImaging QCam (thanks to Jeff Kuhn)
** Improved Support for Apogee Cameras (thanks to Bob Dougherty)
** Zeiss Definite Focus improvements
* Configuration & GUI & Log Level
** Improved Plugin Mechanism
** More informative error messages, better exception handling
** Device Properties will now be nicely sorted in drop downs
** Fixed a problem with saving current configuration when specifying a file name
** Image Gamma slider control
** Improved stability of Live Mode
** Multi-D acquisition: Added per-channel skip Z-stack option
* Build Projects & Procedures
** OS X packages are now Universal (PPC, x86, x64) and can be run as 64-bit applications
** The Windows Project files now use relative paths
** Software is built daily for both Windows and OS X
** Boost libraries are now used for logging, Posix time, and Thread ID functions

== Previous releases ==

=== Micro-Manager 1.3.41 beta, (October 12, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_41c.exe Windows XP, 9 MB]<br /> - [http://valelab.ucsf.edu/~arthur/builds/Micro-Manager_Mac(Intel)_1.3.41a.dmg Mac OS X(Intel), 18 MB]<br />

* New supported devices
** Scion cameras (Douglas Remsberg, Scion)
** Diagnostic SPOT cameras (Windows, Mac)
** TWAIN cameras (operational on Leica cameras)
** Leica DM6000 microscope
** Thorlabs DCxxxx LED controllers
** Thorlabs Filterwheel
** Coherent Cube
** Neos AOTF
* A new python wrapper for the Micro-Manager core
* Fixes to keyboard shortcuts
* Live display of average and standard deviation of images
* Re-orderable positions lists
* Many fixed bugs

=== Micro-Manager 1.3.40 beta, (July 21, 2009) ===

- [http://valelab.ucsf.edu/~arthur/builds/MMSetup_1_3_40.exe Windows XP, 8 MB]<br /> - [http://valelab.ucsf.edu/~arthur/builds/Micro-Manager_Mac(Intel)_1.3.40.dmg Mac OS X(Intel), 17 MB]<br /> - [http://valelab.ucsf.edu/~MM/Micro-Manager_Mac(PPC)_1_3_40.dmg Mac OS X(PPC), 16MB)]

* Major upgrade to autofocus system
** New integrated user interface for hardware and image-based autofocus
** Support for Nikon Perfect Focus, Zeiss Definite Focus, Olympus ZDC, ASI CRIFF
** Image-based autofocus plugins
** New API to write your own autofocusing algorithm in Java or C++
* Zeiss Colibri illuminator
* Olympus BX61 support (by Shalin Mehta, National University of Singapore)
* Andor linux patches (by Karl Bellve, UMass)
* Thorlabs SC10
* Improvements to configuration editing
* Re-vamped gui for Multi-Dimensional Acquisition
* Mouse-scroll-wheel works in scripting panel
* NikonTI TIRF attachment support
* Leica DMR microscope support

=== Micro-Manager 1.3.39 beta, (May 15, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_39.exe Windows XP, 8 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.39.dmg Mac OS X(Intel), 16 MB]<br />

* Fixed build bugs
* Drag stage with hand tool
* New Mad City Stage versions
* Improved registration dialog
* Float property value bug fixed
* Position list made editable
* Andor camera freezing snap bug fixed
* MF Shutter issues fixed

=== Micro-Manager 1.3.38 beta, (April 29, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_38.exe Windows XP, 8 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.38.dmg Mac OS X(Intel), 16 MB]<br /> - [http://endrov.net/downloadPublic/debs/micromanager/ Debian package] (maintained by Johan Henriksson)

* New image-based autofocus (Contribued by 100x Imaging)
* Extensive fixes to various PVCAM adapter bugs
* Linux patches by Johan Henriksson and Karl Bellve
* Improved code logging
* Andor properties problem fixed
* Image5D to hyperstack conversion improved
* Adapters for NI, PI, and Thorlabs by Brian Ashcroft
* Core API changes for multiple cameras

=== Micro-Manager 1.3.37 beta, (April 9, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_37.exe Windows XP, 8 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.37.dmg Mac OS X(Intel), 16 MB]<br />

* Fixed mouse moving the stage in live mode
* Physical ROI now visible in Image5D Snap
* Multi-D Acquisition settings a restored after a Multi-D run
* Fixed z-offset problem with Multi-D Acq
* Beanshell scripts for unit testing of device adapters
* Fixed sensicam binning problem (Franz)
* Metadata viewer now saves contrast and colors
* Image5D window now acquires a name when saved
* Improved Multi-D Acquisition gui logic

=== Micro-Manager 1.3.36 beta, (April 3, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_36.exe Windows XP, 8 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.36.dmg Mac OS X(Intel), 16 MB]<br />

* Olympus focusing (z stage) bug fixed
* QCam Mac live mode hanging bug fixed
* Fixed memory leaks in Multi-D Acquisition
* Pixel size calibration fixed to propagate from Multi-D Acquisition
* Quantix Photometrics Error 22 bug corrected
* Introduced new global script methods: doc(), inspect(), update()
* ASI Well Plate Transfer Robot adapter added
* Internationalization bug fix
* Histogram scaling restored

=== Micro-Manager 1.3.34 beta, (March 18, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_34.exe Windows XP, 5.4 MB]<br />

* PrecisExcite bug fix

=== Micro-Manager 1.3.33 beta, (March 16, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/MMSetup_1_3_33.exe Windows XP, 5.4 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.33.dmg Mac OS X(Intel), 14.9 MB]<br />

* PrecisExcite adapter
* Made OS X 10.4 compatible again

=== Micro-Manager 1.3.32 beta, (March 13, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.32.dmg Mac OS X(Intel), 14.9 MB]<br /><br />

=== Micro-Manager 1.3.31 beta, (March 11, 2009) ===

- [http://valelab.ucsf.edu/%7EMM/builds/1.3/MMSetup_1_3_31.exe Windows XP, 5.4 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(PPC)_1_3_31.dmg Mac OS X(PPC), 26 MB]<br /><br />

=== Micro-Manager 1.3.30 beta, (March 4, 2009) ===

- [http://valelab.ucsf.edu/%7EMM/builds/1.3/MMSetup_1_3_30.exe Windows XP, 5.4 MB]<br /> - [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.30.dmg Mac OS X(Intel), 14.9 MB]<br /><br />'''Bugs are seen in some PVCAM cameras in this release:'''<br />

* Auto shutter fails to stay open during exposure
* Burst mode sometimes stops unexpectedly

'''Bug fixes in this release:'''

* Andor adapter: fixes to make Luca R work
* PCO adapter: fixed bug in binning (Franz)
* Olympus adapter: various bug fixes
* Leica: added control for Halogen Lamp (Prashanth, 100xImaging)
* PVCAM: various bug fixes (various authors)

=== Micro-Manager 1.3.24 beta, (February 24, 2009) ===

- [http://valelab.ucsf.edu/~MM/builds/1.3/Micro-Manager_Mac(Intel)_1.3.24.dmg Mac OS X(Intel), 14.9 MB]<br />

* Corrected driver complement

=== Micro-Manager 1.3.23 beta, (February 17, 2009) ===

- [http://valelab.ucsf.edu/%7EMM/builds/1.3/MMSetup_1_3_23.exe Windows XP, 5.4 MB]

=== Micro-Manager 1.3.22 beta, (February 13, 2009) ===

- Mac OS X(Intel), 14.1 MB (Missing drivers; do not use!)<br /> - [http://valelab.ucsf.edu/~MM/micro-manager/distribution/Mac/Micro-Manager_Mac(PPC)_1.3.22.dmg Mac OS X(PPC), 26 MB]<br /><br /><br /> This new release includes:

* Faster live mode (using camera sequence mode, in collaboration with [http://www.100ximaging.com/ 100XImaging])
* New Micro-Manager plugin mechanism (provided by 100XImaging)
* Keratocyte Tracker plugin (provided by 100XImaging)
* New "Acquire" button collects series of still images with metadata
* Keyboard commands to move stages
* New autofocussing mechanism (provided by 100XImaging)
* Improved Script Panel (new interactive Beanshell interpreter)
* Extensions to the scripting interface
* Many minor bugfixes in all parts of the application
* New Devices:
** [http://www.kameras.abs-jena.de/produkte_de.html ABSCameras] (provided by Michael HimmelReich)
** [http://www.arduino.cc/ Arduino] digital IO board
** Piper (Stanford Photonics cameras, provided by [http://www.stanfordphotonics.com/ Stanford Photonics])
** Leica DMI microcopes (provided by [http://www.100ximaging.com 100XImaging])
* Device updates:
** Andor added external triggers and updated support for new cameras
** Nikon TE2000 added filter wheel (100X Imaging)
** Moved DAZStage, DAShutter and MultiShutter into adapter Utilities
** Added StateDeviceShutter (in Utilities) that enables using a filter wheel as a shutter

== Even earlier releases ==

[[Micro-Manager 1.2 Windows (Very Old!)]] | [[Micro-Manager 1.2 Mac (Very Old!)]]

{{Downloads_Sidebar}}
