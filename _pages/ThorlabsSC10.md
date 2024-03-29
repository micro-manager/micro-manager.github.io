---
autogenerated: true
title: ThorlabsSC10
redirect_from:
  - /wiki/ThorlabsSC10
  - /wiki/Thorlabs_SC10
layout: page
---

## Thorlabs SC10 adapter

<table cellspacing=3>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1" valign="top">

Interface to [Thorlabs SC10 shutter
controller](http://www.thorlabs.com/thorProduct.cfm?partNumber=SC10)

</td>
</tr>
<tr>
<td markdown="1">

**Author:**

</td>
<td markdown="1">

Nico Stuurman

</td>
</tr>
<tr>
<td markdown="1">

**License:**

</td>
<td markdown="1">

LGPL

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Windows, Mac OS X, Linux

</td>
</tr>
<tr>
<td markdown="1">

**Available since version:**

</td>
<td markdown="1">

1.3.40

</td>
</tr>
<tr>
<td markdown="1" valign=top>

**Default serial port settings:**

</td>
<td markdown="1" valign=top>

|                     |      |
|---------------------|------|
| AnswerTimeout       | 500  |
| BaudRate            | 9600 |
| DelayBetweenCharsMs | 0    |
| Handshaking         | Off  |
| Parity              | None |
| StopBits            | 1    |

</td>
</tr>
</table>


The [Thorlabs SC10 shutter
controller](http://www.thorlabs.com/newgrouppage9.cfm?objectGroup_ID=927)
operates the Thorlabs SH05 beam shutter. This adapter makes the shutter
usable as a normal shutter in Micro-Manager. On startup, the adapter
will switch the controller to mode=1 operation ("normal" operation").
The adapter has an "OnCommand" property that can be used to send
commands to the controller (see the SC10 documentation). Note that the
above mentioned serial port settings are the default but that they can
be changed through software commands.

{% include notice icon="info" content="The Thorlabs TSC001 shutter driver is different from the SC10 and is not supported." %}
