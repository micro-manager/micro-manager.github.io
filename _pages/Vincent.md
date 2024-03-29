---
autogenerated: true
title: Vincent
redirect_from: /wiki/Vincent
layout: page
---

## Vincent shutter controller adapter

<table>
<tr>
<td markdown="1">

**Summary:**

</td>
<td markdown="1">

Interfaces to Vincent (Uniblitz) shutter controllers

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

BSD

</td>
</tr>
<tr>
<td markdown="1">

**Platforms:**

</td>
<td markdown="1">

Windows, Mac OS X and linux (serial port)

</td>
</tr>
<tr>
<td markdown="1">

**Devices:**

</td>
<td markdown="1">

Vincent controllers VMM-D1/T1, D122, D3/D4, VCM-D1, ASI SC-2000,
possibly others

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

This adapter controls the [Vincent](http://www.uniblitz.com) shutter
controllers [D1, T1,
D3](http://www.uniblitz.com/departments/Shutter%20Control.aspx) and
[D122](http://www.uniblitz.com/resources_filelibrary/T132_d122_user_manual_1_3.pdf)
(not available anymore). Connect the controller through a serial port
and configure the port as specified in the manual to your controller
(the D122 uses a baudrate of 300, others are 9600, for the D122 set
'DelayBetweenCharsMs' to 50-100, for other controllers this can be 0).
Multiple controllers can be daisy chained as the adapter can address
these daisy-chained controllers (For property "Address", use "x" to
address all daisy-chained controllers, or if there is a single
controller).

The Vincent D3 controls up to 3 shutters. For each shutter, make a
separate Vincent-D3 device, and set the "Channel \#" pre-initialization
property to the desired shutter number.

--[Nico](/users/Nico) 09:36, 8 September 2007 (PDT)

If using an actual serial cable, ensure that the cable is of the ["null
modem"](http://en.wikipedia.org/wiki/Null_modem) type.

--oreopoj 14:06, 8 September 2010 (EST)

