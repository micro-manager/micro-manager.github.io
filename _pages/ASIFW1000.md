== ASI FW1000 adapter ==

<table><tr><td>
'''Summary:'''</td><td>Controls ASI Filter wheels and shutters</td></tr>
<tr><td>'''Author:'''</td><td>Nico Stuurman</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Controller, FilterWheel, Shutter</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
</table>

'''Serial port settings'''
{| cellspacing="10"
|Baudrate||9600
|-
|AnswerTimeout||500.0000
|-
|DataBits||8
|-
|DelayBetweenCharsMs||0.0000
|-
|Handshaking||Off
|-
|StopBits||1
|}

The ASIFW1000 controller [http://www.asiimaging.com/products/illumination-control/fw-1000-high-speed-filter-wheel/] can be equipped with one or more filter wheel control panels (each controlling two filter wheels) and one or more shutter control panels (each driving two shutters).  The controller connects to a serial port on your computer.

To drive any filter wheel or shutter, you will have to define the 'ASIFW1000 Controller' device.  You will need to specify the serial port to which the ASIFW1000 controller is connected.  Micro-Manager will report the Firmware version of the ASIFW1000 Controller.

Up to two filter wheels can be declared.  The filter wheel number is a pre-initialization property.  Make sure that you do not declare the same filter wheel number twice, or strange things will happen.  If you need control of more than two wheels, contact us, as the adapter can easily be modified to work with multiple wheels.  The controller will report the number of filters in the wheel to the software (but you will have to make sure that the controller has been programmed with the correct number), and the current position of the wheel.

Up to two shutters can be declared, which also are specified using a pre-initialization property.  Shutters can be "normally open" and "normally closed' (make sure you set this pre-initialization property correctly).  Although the controller can report whether a shutter is open or closed (or busy), there were so many obstacles in implementing this correctly, that I decided just to use a user-defined time-out.  Make sure the time-out is correct (look up the specs for your shutter to estimate how long it will take to open/close the shutter).


--[[User:Nico|Nico]] 21:48, 15 August 2007 (PDT)

{{Devices_Sidebar}}
