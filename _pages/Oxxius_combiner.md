== Oxxius combiner ==

<table><tr><td>
'''Summary:'''</td><td>Interface to any Oxxius combiner. Provides an access to the individual laser sources, as well as to shutters or various accessories and modules.</td></tr>
<tr><td>'''Author:'''</td><td>Tristan Martinez</td></tr>
<tr><td>'''License:'''</td><td>LGPL</td></tr> 
<tr><td>'''Platforms:'''</td><td>All (requires a USB port or access to an Ethernet network)</td></tr>
<tr><td>'''Devices:'''</td><td>[http://www.oxxius.com/Wavelength-Combiner Oxxius L4Cc and L6Cc models]</td></tr>
<tr><td>'''Since Version:'''</td><td>1.4.23</td></tr>
<tr><td>'''Example Config File:'''</td><td>None</td></tr>
</table>

Foreword: This Device Adapter relates to laser combiners and to BTC-AOM controllers. For stand-alone LaserBoxx sources, refer to the Device Adapter named [[Oxxius]].

==Installation==
* Using the USB port
The USB port needs to be turned into a virtual serial port. To proceed, connect to the combiner (using Oxxius' GUI for example), enter the command "CDC 1", then reboot the combiner.
Take note of the COM port assigned to your combiner, then use the following parameters in the Hardware Configuration Wizard:
    Answer Timeout: 500
    Baudrate: 115200 (this value is seemingly ignored anyway)
    DataBits: 8
    DelayBetweenCharsMs: 0
    FastUSB to Serial: Disable
    Handshaking: Off
    Parity: None
    StopBits: 1
    Verbose: 1

* Using the Ethernet port
If needed, use the command "?EIP" to query the IP address of the combiner. Enter it in the connection settings.

==Combiner Hub==
This Hub provides an access to the laser sources, accessories and various components connected to (or mounted in) the combiner. The hub's "chidren" are detailed in the following paragraphs.

Hub properties:
    Serial number (read only)
    Interlock status: "Open" or "Closed"  (read only)
    Emission key status: "Armed" or "Disarmed" (read only)

==LaserBoxx source==
Provides an interface to various LaserBoxx laser sources. While some models are physically linked to either an AOM or an "MPA" attenuator, this Device Adapter provides a uniform interface in all these situations.

Available properties (model-dependant):
    State (read only)
    Alarm (read only)
    Control mode: "ACC" or "APC" (read and write)
    Analog modulation selection: "ON" or "OFF" (read and write)
    Digital modulation selection: "ON" or "OFF" (read and write)
    Current set point, as a percentage of the nominal current (read and write)
    Power set point, as a percentage of the nominal power (read and write)
    Emission status: "ON" or "OFF" (read and write)

Inheritance: CShutterBase.

==Shutter==
To control an electromechanical shutter.
Available property:
    State: "Open" or "Closed" (read and write)

Inheritance: CShutterBase.

==M-Dual==
This Device Adapter relates to the "MDL-MDUAL" extension, which splits the laser beam over two output channels, according to a configurable split ratio.
Available property:
    Split ratio: percentage of the total power directed to the first channel(read and write)

Inheritance: CGenericBase.

==Flip Mirror==
This Device Adapter relates to the "MDL-FLPM" extension, which directs the laser beam over one of two distinct channels.
Available property:
    Switch position: "0" for channel 1, "1" for channel 2(read and write)

Inheritance: CGenericBase.

==Known limitations==
* Requires firmware version 1.0.17 or higher. Use the command "?SV" to query the version of your combiner.
* Cobolt laser sources are not yet supported.

==Support==
Contact the author at "support at oxxius.com".

{{Devices_Sidebar}}
