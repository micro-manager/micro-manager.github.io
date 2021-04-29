These beanshell scripts can be run from the '[[Script_Panel_GUI|Script Panel]]' (in the 'Tools' menu).  Either load the script in the Script Button Panel (using the 'add' button), or open the script in the editor (using the 'open' button. 

Most of these scripts can be translated with minimal modification to the Python programming language (see [https://github.com/micro-manager/pycro-manager Pycro-manager]) 

[[Media:sdemo1.bsh]] - Hello World

[[Media:sdemo2.bsh]] - Shows how to use ImageJ functionality within the Beanshell environment

[[Media:setZoom.bsh]] - Utility that sets the zoom level of the current ImageJ image window

[[Media:camera_test.bsh]] - Example camera test.

[[Media:image_snap_example.bsh]] - Shows how to snap (but not display) an image

[[Media:image_snap_example_2.bsh]] - Shows how to snap and display an image.   The image window must already be open (Snap an image once manually before running the plugin).

[[Media:snapAndMeasure.bsh]] - Shows how to use the ImageJ 'Measure' command that updates with every new image snapped.

[[Media:live_demo.bsh]] - Shows how to process an image during acquisition.  Needs the DemoStreamingCamera to work.

[[Media:burst.bsh]] - Shows how to start burst mode from a script.  Also shows how to save to file during acquisition.  Needs burst mode capable camera.  May not work.

[[Media:burstExample.bsh]] - Shows how to run a sequence acquisition (used to be "burst mode") from a script including setting up and starting the acquisition, grabbing the images from the circular buffer, and filing them into the acquisition object.

[[Media:testAcq.bsh]] - Demonstrates how to perform 5D image acquisition using the gui object. 

[[Media:manualAcq.bsh]] - Executes 5D acquisition, prompting the user to change the filters/dichroics between channel changes

[[Media:acqLC.bsh]] - Example of a complicated MD acquisition including visiting multiple positions as defined in the position list, acquiring time-lapse data in individual channels.

[[Media:multiFastZStackASI.bsh]] - Script used at the ASCB meeting 2008 to synchronize Arduino, camera, AOTF and piezo stage to do fast multi-channel Z-stack acquistion

[[Media:PositionList.bsh]] - Shows how to build a positionList programmatically

[[Media:Init.bsh]] - Shows how to configure the sytem programmatically, i.e. without using configuration files. The GUI changes will not be visible until you manually run the command 'Rebuild GUI' or 'Refresh GUI' (Tools menu).

[[Media:config_test.bsh]] - Shows how to define config groups programmatically.  Will work with the demo-configuration.

[[Media:Roi_copy.bsh]] - Demonstrates copying of ROI from one camera to another.

[[Media:RatiometricImaging_main.bsh]] - Beanshell for ratiometric Imaging (J. Husson).

[[Media:RatiometricImaging_singleImage.bsh]] - Beanshell for ratiometric Imaging. Takes only one image, can be useful as a control before starting a whole acquisition with main beanshell above (J. Husson).

[[Media:simplest_mosaic_experiment.bsh]] - Control Andor Mosaic via iQ 2.7

The source code repository contains many more [https://valelab.ucsf.edu/trac/micromanager/browser/scripts example scripts]

--[[User:Nico|Nico]] 21:04, 15 December 2007 (PST)

{{Programming_Sidebar}}
