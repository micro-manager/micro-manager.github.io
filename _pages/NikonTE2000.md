---
autogenerated: true
title: NikonTE2000
redirect_from: /wiki/NikonTE2000
layout: page
---

## Nikon TE2000 motorized microscope

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Adapter for Nikon TE2000 motorized microscopes

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Nenad Amodaj, minor contributions by Nico Stuurman

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
<td markdown="1" valign='top'>

**Devices:**

</td>
<td markdown="1">

Hub (TE2000), NosePiece, Shutter, Epi-Shutter, Uniblitz-Shutter, Optical
Path, Analyzer, FilterBlock, Lamp, Focus (z-drive), PerfectFocus

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Serial port settings:**

</td>
<td markdown="1" valign=top>

|                     |      |
|---------------------|------|
| AnswerTimeout       | 8000 |
| BaudRate            | 9600 |
| DelayBetweenCharsMs | 0    |
| Handshaking         | Off  |
| Parity              | None |
| StopBits            | 1    |

</td>
</tr>
</table>


This adapter communicates to all the devices in the TE2000 through the
hub device. Thus, to use any of these devices, you will need to first
define the hub device (and the serial port behind which the hub lives).

{% include notice icon="info" content="This adapter sends commands one by one (i.e., it sends a command and waits for an answer before it will send the next command). Performance can be improved by sending commands without waiting for an answer and the source code has some facilities to do this.  Volunteers to work on this will be highly appreciated by all users of the adapter!" %}

{% include Listserv_Search text="Nikon" %}
