== Sutter Stage adapter ==

<table><tr><td>
'''Summary:'''</td><td>Interfaces with Sutter Stage controllers and associated hardware</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman (based on a version by Nenad Amodaj)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (uses serial interface)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, XY Stage</td></tr>

<tr><td><b>Automated Serial Port Setup:</b></td><td>Yes</td></tr>

<tr><td><b>Peripheral device discovery:</b></td><td>Supported</td></tr>
</table>


The Sutter XY stage emulated the Ludl communication protocol.  This adapter uses the Ludl protocol to operate the Sutter stage. 

All communications to devices take place through the Controller device ). Set the Serial port to use 9600 baud and 2 stopbits.  You can set the serial port property 'DelayBetweenCharsMs' to 0 to increase speed.  You might also want to increase the AnswerTimeout of the serial port to 2 sec.  If you make movements with your stage that take a long time, increase the AnswerTimeout of the serial port even more (so that the port will not time out before the movement finishes).

The adapter uses the 'high level' command interface.  Currently, you can only use one controller.  You need to set the serial port for communication with the controller, and you can define the 'transmissiondelay' (0.5 msec between chars send by the controller to the computer).  It is probably safe to set this value to 1 (the lowest) with modern computers.  

The XYStage will let you set some parameters concerning the speed of the stage (Speed, StartSpeed, Acceleration).  See the [http://www.ludl.com/DocLib.aspx manual] for definitions of these terms.

To use a Z-drive (focus drive), you will need to specify the letter under which it is known by the controller as a pre-initialization property.  Confusingly, this is often not "Z", but "B".  If you can not figure it out, open the file "Corelog.txt" in your Micro-Manager directory.  It contains some output from the Ludl controller that you can use to deduce the drive letter.


{{Devices_Sidebar}}
