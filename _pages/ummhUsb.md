---
title: Universal MM Hub (USB)
description: An adapter for a Universal MM Hub communicating via USB protocol
layout: page
---

## ummhUsb

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

This is a universal adapter for a user-defined hardware controller communicating via USB protocol.

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Artem Melnykov (melnykov.artem at gmail.com)

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

Windows (other platfotms supported but not tested)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Shutter, State, Stage, XYStage, Generic, Camera

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">

None

</td>
</tr>
</table>

The goal of this project is to provide a universal adapter for a custom hardware controller. The hardware controller itself has to be implemented by the user and is expected to:
* be able to communicate with the computer through a USB port (tested with USB2 but is expected to work with USB3);
* use the text string interface (specified below) for describing implemented devices.

An example controller based on Xilinx Zynq platform is available [here](https://github.com/artmeln/ummhUsbZynqController).

## Known limitations
* sequencing is not implemented;
* pre-initialization properties are not supported;
* the only devices that are implemented are Shutter, State, Stage, XYStage, Generic, and Camera.

## Device descriptions, principles of communication etc.

These aspects are described in detail for [UniversalSerialHub](https://micro-manager.org/universalserialhub). The USB version is very similar but communications happen via bulk transfers on endpoint 1 following USB protocol.

## Aspects of communication specific to the Camera device

A Camera device implemented in the controller must set several camera specific properties:

**ImageMaxWidth**	 (a positive integer)

**ImageMaxHeight** 	(a positive integer)

**PixelType** 	(8bit or 16bit)

**BitDepth**	 (a value in the 1-16 range)

In addition, the device must set properties related to USB2 transfer:

**Endpoint**	(2 or higher)

**TransferTimeout**	 (a positive integer, ms)

Similar to UniversalMMHubSerial, any command sent from the adapter to the controller sets the device busy flag inside the adapter and expects an answer. The only exception to this rule is GetImageBuffer command. As the adapter sends GetImageBuffer command, it does set the busy flag; however, the response is expected not on endpoint 1 but rather on the endpoint reserved for data transfers for this device. In this special case the response comes as a buffer of raw data. For example,

Camera-A>SnapImg>0;  *(request that Camera-A snap an image)*

Camera-A<SnapImg<0:0;  *(Camera-A successfully snapped an image)*

Camera-A>GetBufsize>0;  *(request the size of the image buffer from Camera-A)*

Camera-A<GetBufSize<0:6;  *(Camera-A successfully returned image buffer size 6)*

Camera-A>GetImgBuf>0;  *(request that Camera-A transfer image buffer)*

0x12 0x11 0x08 0x11 0x01 0x51  *(Camera-A sent data on endpoint 2)*


## Additional Information

UniversalMMHubUsb is similar in spirit to UniversalMMHubSerial adapter (formerly known as [UniversalSerialHub](https://micro-manager.org/universalserialhub)). Both use the same communication strategy and commands which are described in detail [here](https://micro-manager.org/universalserialhub). The main difference between the two adapters is the kind of serial protocol used for communication (USB2 or UART). USB2 communication is considerably faster which allows UniverslaMMHubUsb adapter to support devices transfering large amounts of data (such as cameras).

In UniversalMMHubUsb, all commands between the computer and the controller are passed on endpoint 1 while data transfers happen on other endpoints (one endpoint per device); all endpoints are configured for bulk transfer. As with UniversalMMHubSerial, the user must program the controller to implement the functionality of all devices and the ability to communicate with the PC. Programming a controller to communicate with UniversalMMHubUsb is more complicated than programming communication over a UART port. However, it allows you access to high-speed USB transfers (480Mbps for USB2). An example of programmed controller simulating a camera and several other devices is available [here](https://github.com/artmeln/ummhUsbZynqController).


