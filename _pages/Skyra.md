<table><tr><td>
'''Summary:'''</td><td>Skyra Laser Controller</td></tr>
<tr><td>'''Author:'''</td><td>Karl Bellve  </td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All</td></tr>
<tr><td>'''Devices:'''</td><td>[https://www.coboltlasers.com/lasers/multi-line-laser www.coboltlasers.com/lasers/multi-line-laser]</td></tr>
<tr><td>'''Since Version:'''</td><td>April 6, 2020</td></tr>
<tr><td>'''Example Configuration:'''</td><td>[[Media:Skyra_NicoLase.cfg]]</td></tr>
</table>

=== Description === 
The Skyra is a multi-line laser from Cobolt. 

===The serial port===
* 115,200 or 19200 baud, 
* no flow control, 
* one stop bit
* no parity
* 8 data bits
* delaybetweenChars 0 ms. 

This driver supports '''automatic serial port detection'''.

=== Notes ===

{{Note|Lasers will ignore the power setting for a few minutes while they start up. Re-set power/current after warm up is over}}

{{Note|If the Laser has '''aborted''', you could issue a '''restart''' command via the Serial Command property, followed by a key cycle to restart the laser.}}

=== Device Properties===

The new driver supports constant current, constant power, and modulation modes. Also, you can select Analog or Digital modulation. The ability to enable/disable Autostart is now supported. There is also direct serial communication supported via '''Serial Command'''

[[File:Skyra_proporties.png|400px]]

[http://micro-manager.3463995.n2.nabble.com/template/NamlServlet.jtp?macro=search_page&node=3463995&query=Skyra Click here to search for Skyra on the Micro-Manager mailing list archive.]
