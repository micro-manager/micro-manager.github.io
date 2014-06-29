{| style="text-align: left"
!Summary:
|Interfaces with Andor MicroPoint pulse laser targeting device
|- valign="top"
!Author:
| Arthur Edelstein
|-
!License:
|3-clause BSD
|-
!Platforms:
|Windows, (Linux and Mac [http://www.ftdichip.com/Drivers/VCP.htm FTDI VCP drivers] are available, but yet not tested)
|- valign="top"
!Devices:
|MP-220*-EBD
|}
----

== Installation ==

=== USB Driver ===

The MicroPoint controller contains it's own USB-Serial convertor.  If the FTDI Virtual COM Port driver is already installed, nothing further needs to be done.  On Windows, the installed driver shows up in the Device Manager as:

      Ports (COM & LPT)
      `-USB Serial Port (COM*)

When the MicroPoint is not installed, it shows up in the Device Manager as:

      Other devices
      `-(?) USB I/O 24 R

To install the FTDI Virtual COM Port driver visit [http://www.andor.com/my/user/ MyAndor website] and find the public driver under <code>Drivers and 3rd Party > Driver: Micropoint</code>. Yes, you have to register and login to download the file.

== Device Configuration ==

The [[Projector|Projector plugin]] operates the Micropoint.  There are 2 behaviors of the plugin unique to the Micropoint:

# The dwell time setting has no effect.  It exists because the plugin was originally written for SLM devices.
# The plugin does not allow 2D regions with the MicroPoint; only point regions.  To draw multiple points, right-click the point tool and select "Multi-points Tool". If you need to use line or 2D regions, one could either:
## Write an ImageJ macro that converts the 2D or line region to point regions.  One can read the image pixel calibration for spacing the points and allow the user to specify their desired energy density in points per unit area.
## Extend the Projector plugin to handle line and 2D regions natively using the above logic.

[[File:Micropoint-calibration.png]] Figure: The calibration process completes two steps.  First, it fires a crosshair pattern to determine the camera orientation (left image), and then fires a grid pattern across the range of the phototargeting device (right image).  The algorithm accounts for the device range exceeding exceeding the camera sensor size, but the orientation pattern must be captured within the camera field of view.

== Resources ==

=== Development support ===
Please liaison with Micro-Manager developers to contact the Andor software team

{{Listserv_Search|MicroPoint}}

{{Devices_Sidebar}}
