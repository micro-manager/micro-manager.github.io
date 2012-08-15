== Ludl adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Ludl MAC controllers and associated hardware</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman (based on a version by Nenad Amodaj)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, Shutter, Filter Wheel, XY Stage</td></tr>

<tr><td><b>Automated Serial Port Setup:</b></td><td>Yes</td></tr>

<tr><td><b>Peripheral device discovery:</b></td><td>Supported</td></tr>
</table>


This adapter controls equipment through the [http://www.ludl.com/ Ludl] MAC family of controllers.  It has been developed for the [http://www.ludl.com/pageDisplay.aspx?menumode=BIO&PageReq=MAC5000 MAC5000] controller but also works with MAC2000 controllers (for the newer MAC6000 controller see below). 

All communications to devices take place through the Controller device (i.e., the MAC5000). Set the Serial port to use 9600 baud and 2 stopbits.  For the MAC5000 you can set the serial port property 'DelayBetweenCharsMs' to 0 to increase speed, however, for the MAC2000 controllers you will need to set this property to 10 or higher.  You might also want to increase the AnswerTimeout of the serial port to 2 sec.  If you make movements with your stage that take a long time, increase the AnswerTimeout of the serial port even more (so that the port will not time out before the movement finishes).

The adapter uses the 'high level' command interface (is there anyone who feels like implementing the low level interface?) Currently, you can only use one controller.  You need to set the serial port for communication with the controller, and you can define the 'transmissiondelay' (0.5 msec between chars send by the controller to the computer).  It is probably safe to set this value to 1 (the lowest) with modern computers.  

There can be up to 5 'devices' (i.e., controller cards) per controller, and each controller card can have 3 shutters and 2 filter wheels.  You will therefore need to specify for each Wheel and Shutter a device number (1-5 and WheelNumber (1-2) or ShutterNumber (1-3).

The XYStage will let you set some parameters concerning the speed of the stage (Speed, StartSpeed, Acceleration).  See the [http://www.ludl.com/DocLib.aspx manual] for definitions of these terms.

To use a Z-drive (focus drive), you will need to specify the letter under which it is known by the Ludl controller as a pre-initialization property.  Confusingly, this is often not "Z", but "B".  If you can not figure it out, open the file "Corelog.txt" in your Micro-Manager directory.  It contains some output from the Ludl controller that you can use to deduce the drive letter.

--[[User:Nico|Nico]] 13:43, 25 August 2007 (PDT)

If using an actual serial cable, ensure that the cable is of the [http://en.wikipedia.org/wiki/Null_modem "null modem"] type.

--[[User:oreopoj|oreopoj]] 14:19, 8 September 2010 (EST)


The Ludl MAC6000's USB port can be configured to act as a virtual COM port.  If you have the original CD that came with your Ludl equipment, you can useit; otherwise, download the content of the Contents of MAC6000 CD Rev.E  [http://www.ludl.com/Downloads.aspx here]. Expand the  zip file and look for a folder called 'VCP_setup' located here: CD - MAC6000 SDK - REVE/Drivers/Virtual Com driver/VCP_Setup. There is a pdf file in the folder that clearly indicates all the steps but be careful to NOT have your MAC6000 connected until the very end of the procedure as indicated.

Check that your device is present under COM and LPT ports in Windows' device manager and fully recognised (plug and unplug your USB to check the connectivity). Then go to MicroManager Hardware wizard, install the LUDL controller and its peripherals (depends on your configuration, for me it's a XY stage). Indicate the COM port (although it should be automatically detected) and enjoy!

If you are running Windows 7, you MUST turn off the MAC6000 before turning off the computer otherwise, you'll get a BSOD (related to a bug in the VCP driver). 

-- Alex Carisey (copied from mailling list) 08:22, 16 February 2012 (PST)

{{Devices_Sidebar}}
