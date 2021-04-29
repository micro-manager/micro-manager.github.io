<table><tr><td>
'''Summary:'''</td><td>Cobolt Laser Controller</td></tr>
<tr><td>'''Author:'''</td><td>Karl Bellve  </td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All</td></tr>
<tr><td>'''Devices:'''</td><td>[https://www.coboltlasers.com/lasers/ www.coboltlasers.com]</td></tr>
<tr><td>'''Since Version:'''</td><td>1.3.36</td></tr>
<tr><td>'''Example Configuration 1:'''</td><td>[[Media:Cobolt.cfg]]</td></tr> 
<tr><td>'''Example Configuration 2:'''</td><td>[[Media:Cobolt_NicoLase.cfg]]</td></tr>
</table>

The Cobolt laser controller controls compact solid-state lasers.

'''This driver had a major rewrite on April 10, 2020.''' 

'''Max Power''' is still in the code to be backwards compatible with the old Cobolt driver, but it is deprecated and not used.


===The serial port===
* 115,200 or 19200 baud, 
* no flow control, 
* one stop bit
* no parity
* 8 data bits
* delaybetweenChars 0 ms. 

The new driver supports '''automatic serial port detection'''.

=== Notes ===

{{Note|Lasers will ignore the power setting for a few minutes while they start up. Re-set power/current after warm up is over}}

{{Note|If the Laser has '''aborted''', you could issue a '''restart''' command via the Serial Command property, followed by a key cycle to restart the laser.}}

=== Device Properties===

The new driver supports constant current, constant power, and modulation modes. Also, you can select Analog or Digital modulation. The ability to enable/disable Autostart is now supported. There is also direct serial communication supported via '''Serial Command'''

[[File:Cobolt_properties.png|400px]]

=== Linux udev Rule ===

As Root, create a file named /etc/udev/rules.d/99-Cobolt.rules with the following context:

 # allow users to claim the device
 SUBSYSTEMS=="usb", ATTRS{product}=="Cobolt Laser Driver MLD",  ATTRS{idVendor}=="25dc", MODE="0660", GROUP="users", SYMLINK+="ACM%n"

[http://micro-manager.3463995.n2.nabble.com/template/NamlServlet.jtp?macro=search_page&node=3463995&query=Cobolt Click here to search for Cobolt on the Micro-Manager mailing list archive.]

Karl Bellv&eacute;, Biomedical Imaging Group, University of Massachusetts 10:36, 10 April 2020 (PDT)


----


A useful device for control of additional laser shutter can be an [[Arduino]] board; a way to integrate hardware and software may be build a GUI panel to  control easily laser power and shutter devices:
*[[Control_laser_shutters_with_Arduino| Control laser shutter with Arduino]] by Rocco D'Antuono
*[[Media:GUI_panel_for_Cobolt_laser_control.bsh|GUI panel for Cobolt laser control]] by Rocco D'Antuono
