---
autogenerated: true
title: Zaber
redirect_from:
  - /wiki/Zaber
  - /wiki/New_Zaber_adapter
layout: page
---

## Summary

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Device adapters for Zaber Technologies linear stages, XY stages, and microscope components

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Albert David and Soleil Lapierre, Zaber Technologies (contact@zaber.com)

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

BSD

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

All platforms (uses serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Stage, XYStage, FilterWheel, FilterCubeTurret, Objective Changer, Illuminator

</td>
</tr>
</table>

The Zaber device adapter supports single and dual-axis stages and
microscope components using the Zaber ASCII protocol. The devices can be
daisy-chained or connected to separate serial ports in an arbitrary
configuration.

## Compatibility

Currently Micro-Manager has five kinds of drivers for controlling Zaber
devices: Stage, XYStage, Filter Wheel, Filter Cube Turret, Objective Changer and
Illuminator. These drivers require Zaber devices to have firmware 6.14
or higher (unless otherwise noted) and be set to use the Zaber ASCII
protocol. The individual drivers each have specific device requirements:

-   The Stage driver requires any Zaber motion stage.
-   The XYStage driver requires either one controller with at least two axes or a two separate integrated controllers.
-   The Filter Wheel driver requires X-FWR that is connected.
-   The Filter Cube Turret driver requires that an X-FCR is connected.
    The X-FCR is a component of the [MVR
    microscope](https://www.zaber.com/products/microscopes/MVR).
-   The Objective Changer driver requires that an [X-MOR](https://www.zaber.com/products/microscopes/X-MOR-E) is
    connected. The X-MOR is a component of the [MVR
    microscope](https://www.zaber.com/products/microscopes/MVR).
-   The Illuminator driver requires that an [X-LCA series LED
    controller](https://www.zaber.com/products/microscopes/X-LCA4) is
    connected and has Firmware version 7.14 or later loaded.

The Stage and XYStage drivers optionally support [Lockstep
mode](https://www.zaber.com/protocol-manual#topic_command_lockstep),
where multiple physical axes can move in concert as a single logical
axis.

## Installation

Micro-Manager on Windows requires additional files installed by [Zaber Motion for Micro-manager](https://www.zaber.com/support/software-downloads.php?product=zaber_motion_micro_manager_win64&version=latest) installer.
Please run the installer after installing Micro-Manager.

## Set Up

### Zaber Device

If you're using Zaber stand-alone controllers, first ensure that they
are configured by following the easy set-up page here: [X-MCC Easy
Set-Up](https://www.zaber.com/products/controllers-joysticks/X-MCC/easy-set-up).

If you're using Zaber devices with built-in controllers, follow the easy
set-up page here: [Built-In Controller Easy
Set-Up](http://www.zaber.com/products/product_group.php?group=X-FWR-E&tab=Easy%20Set-up).

### Micro-Manager Set Up

[Setting Up A Two-Axis
System](https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Two-Axis_System)

[Setting Up A Single-Axis
System](https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Single-Axis_System)

[Setting Up A Filter
Wheel](https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Filter_Wheel)

[Setting Up A Filter Cube
Turret](https://www.zaber.com/wiki/Software/MicroManager#Setting_Up_A_Filter_Cube_Turret)

[Setting Up An
Objective Changer](https://www.zaber.com/w/Software/MicroManager#Setting_Up_An_Objective_Changer)

[Setting Up An
Illuminator](https://www.zaber.com/w/Software/MicroManager#Setting_Up_An_Illuminator)

## Control

There are several ways to control the position of the stage:

-   Stage Control Plugin
-   Mouse movement (click and drag in Snap/Live Window)
-   Property presets
-   Using the manual adjustment knobs on the controller

Adjust the speed and acceleration of each device through the *Tools &gt;
Device/Property Browser* dialogue box.

For more information on controls, scripting and setup through
Micro-Manager, you can go here: [Zaber Technologies Setup
Instructions](https://www.zaber.com/wiki/Software/MicroManager)
