== Summary ==

<table><tr><td>
'''Summary:'''</td><td>Device adapters for Zaber Technologies linear stages, XY stages, filter wheels and microscope components</td></tr>
<tr><td>'''Author:'''</td><td>Albert David and Soleil Lapierre, Zaber Technologies (contact@zaber.com)</td></tr>
<tr><td>'''License:'''</td><td>BSD</td></tr> 
<tr><td>'''Platforms:'''</td><td>All platforms (uses serial port)</td></tr>
<tr><td>'''Devices:'''</td><td>Stage, XYStage, FilterWheel, FilterCubeTurret, Illuminator</td></tr>
</table>

The Zaber device adapter supports single and dual-axis stages and microscope components using the Zaber ASCII protocol. The devices can be daisy-chained or connected to separate serial ports in an arbitrary configuration.

== Compatibility ==

Currently Micro-Manager has five kinds of drivers for controlling Zaber devices: Stage, XYStage, Filter Wheel, Filter Cube Turret and Illuminator. These drivers require Zaber devices to have firmware 6.06 or higher (unless otherwise noted) and be set to use the Zaber ASCII protocol. The individual drivers each have specific device requirements:
* The Stage driver requires any Zaber motion stage.
* The XYStage driver requires that at least two devices are connected to a port
* The Filter Wheel driver requires that a [http://www.zaber.com/products/product_group.php?group=X-FWRX-FWR filter wheel] is connected.
* The Filter Cube Turret driver requires that an X-FCR is connected. The -FCR is a component of the [https://www.zaber.com/products/microscopes/MVR MVR microscope].
* The Illuminator driver requires that an [https://www.zaber.com/products/microscopes/X-LCA4 X-LCA series LED controller] is connected and has Firmware version 7.14 or later loaded.

The Stage and XYStage drivers optionally support [https://www.zaber.com/protocol-manual#topic_command_lockstep Lockstep mode], where multiple physical axes can move in concert as a single logical axis.

==Set Up==

===Zaber Device===
If you're using Zaber stand-alone controllers, first ensure that they are configured by following the easy set-up page here: [http://www.zaber.com/products/product_group.php?group=X-MCB2&tab=Easy%20Set-up X-MCB2 Easy Set-Up]. In particular, ensure the controller has optimized settings by setting the correct ''peripheralid'' setting. You can find more information on how to set the peripheral ID in Zaber’s Protocol Manuals ([https://www.zaber.com/wiki/Manuals/ASCII_Protocol_Manual#peripheralid ASCII]).
 
If you're using Zaber devices with built-in controllers, follow the easy set-up page here: [http://www.zaber.com/products/product_group.php?group=X-FWR-E&tab=Easy%20Set-up Built-In Controller Easy Set-Up].

===Micro-Manager Set Up===

[https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Two-Axis_System Setting Up A Two-Axis System]

[https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Single-Axis_System Setting Up A Single-Axis System]

[https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Filter_Wheel Setting Up A Filter Wheel]

[https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Filter_Cube_Turret Setting Up A Filter Cube Turret]

[https://www.zaber.com/w/Software/MicroManager#Setting_Up_An_Illuminator Setting Up An Illuminator]

==Control==

There are several ways to control the position of the stage:
*Stage Control Plugin
*Mouse Movement (click and drag in Snap/Live Window)
*Filter Wheel Presets
*Using the manual adjustment knobs on the controller

Adjust the speed and acceleration of each device through the ''Tools > Device/Property Browser'' dialogue box.

For more information on controls, scripting and setup through Micro-Manager, you can go here: [https://www.zaber.com/wiki/Software/MicroManager Zaber Technologies Setup Instructions]
