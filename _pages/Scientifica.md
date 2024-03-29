---
autogenerated: true
title: Scientifica
redirect_from: /wiki/Scientifica
layout: page
---

## Scientifica adapter

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Interfaces all current [Scientifica](http://www.scientifica.uk.com/)
motorized equipement

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Nenad Amodaj and Matthew Player(ElecSoft)

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

All Platforms (serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

XYStage, ZStage

</td>
</tr>
</table>

This adapter interfaces all
[Scientifica](http://www.scientifica.uk.com/) motorized systems through
[Scientifica](http://www.scientifica.uk.com/) hardware. It communicates
with the controller through the serial port so that no further software
is needed but the serial port needs to be specified for all devices
(Even though the XYStage and ZStage are likely to be on the same port).

Special properties of the XYStage:  

<table valign='left'>
<tr>
<td markdown="1">

**MaxSpeed**

</td>
<td markdown="1">

Sets the maximum speed of the XY stage

</td>
</tr>
<tr>
<td markdown="1">

**Acceleration**

</td>
<td markdown="1">

Sets the acceleration of the XY stage

</td>
</tr>
</table>

COM Settings:  

<table valign='left'>
<tr>
<td markdown="1">

**Answer Timeout**

</td>
<td markdown="1">

Long enough for stage to complete moves

</td>
</tr>
<tr>
<td markdown="1">

**Baud Rate**

</td>
<td markdown="1">

9600

</td>
</tr>
<tr>
<td markdown="1">

**Delay Between Chars Ms**

</td>
<td markdown="1">

0

</td>
</tr>
<tr>
<td markdown="1">

**Handshaking**

</td>
<td markdown="1">

Off

</td>
</tr>
<tr>
<td markdown="1">

**Parity**

</td>
<td markdown="1">

None

</td>
</tr>
<tr>
<td markdown="1">

**Stop Bits**

</td>
<td markdown="1">

1

</td>
</tr>
</table>

