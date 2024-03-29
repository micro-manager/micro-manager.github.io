---
autogenerated: true
title: Nikon
redirect_from: /wiki/Nikon
layout: page
---

## Nikon miscellaneous devices

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Interfaces with various devices from Nikon

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Nenad Amodaj (Z-drive), Nico Stuurman (TIRF shutter and IntensiLight)

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

All (uses serial interface)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Z-drive, TIRF-Shutters, Intensilight shutter

</td>
</tr>
<tr>
<td markdown="1">

**Example Config File:**

</td>
<td markdown="1">
</td>
</tr>
</table>

Each of these Nikon devices is a completely independent devices, so each
of these devices will need to be controlled through their own serial
port. Serial port settings are standard (but consult the manual to the
device). AnswerTimeoutMs should be set to 2000 ms.

The Z-drive is an add-on 'cup' fitting on the Nikon manual focus drive.
The TIRF shutter is the T-LUSU. The newer TiTIRF shutter appears to be
the T-LUSU(2) and has the ability to illuminate the sample with multiple
lasers simultaneously.

Funny thing about the IntensiLight shutter is that it closes much
quicker when you put the unit sideways. The ND filters in the
IntensiLight are supported as of Micro-Manager version 1.3.43. Make sure
that the timeout for the serial port to the Intensilight is at least as
long as the longest ND filter switch time (2500 msec or so).

--[Nico](/users/Nico) 14:33, 25 August 2007 (PDT)

