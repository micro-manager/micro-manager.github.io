{| style="text-align: left"
!Summary:
|Adapter for [https://github.com/jdeschamps/MicroFPGA MicroFPGA]
|-
!Author:
|Joran Deschamps
|-
!License:
|LGPL
|-
!Platforms:
|Linux, Mac, and Windows
|-
!Since version:
|2.0.0-gamma
|-
!Automated Serial Port Setup:
|Yes
|-
!Peripheral device discovery:
|Yes
|-valign="top"
|}

MicroFPGA is a cost-efficient electronic platform generating typical signals used to control microscope elements. It is based on hobby [https://en.wikipedia.org/wiki/Field-programmable_gate_array FPGA] from [https://alchitry.com/collections/all Alchitry] (Au and Cu FPGAs). 

In particular, MicroFPGA allows complex and independent triggering of multiple lasers (us to ms pulses, on rising or falling camera trigger, following patterned sequences), as well as controlling several servomotors, TTL hardware (e.g. flip-mirrors, switches), reading analog signals or producing analog voltages (with the help of a complimentary electronics board).

In order to use MicroFPGA, you need to set-up the FPGA board and upload the MicroFPGA firmware. For more information, refer to the [https://github.com/jdeschamps/MicroFPGA Github repository].

The Github repository contains:
* [https://github.com/jdeschamps/MicroFPGA/blob/master/tutorials/README.md Guide and tutorials]
* Firmware for the [https://github.com/jdeschamps/MicroFPGA/tree/master/Au_firmware Au] and [https://github.com/jdeschamps/MicroFPGA/tree/master/Cu_firmware Cu] FPGA boards.
* [https://github.com/jdeschamps/MicroFPGA/tree/master/Electronics Complimentary electronics]
* Librairies for [https://github.com/jdeschamps/MicroFPGA/tree/master/MicroFPGA-Java Java] and [https://github.com/jdeschamps/MicroFPGA/tree/master/MicroFPGA-Py Python]

{{Note|For use with Micro-Manager 1.4, the baudrate must be changed within the firmware ([https://github.com/jdeschamps/MicroFPGA/blob/master/tutorials/changing_baudrate.md see tutorial]) as the default value is bigger than what the Micro-manager Hardware Wizard Configuration menu allows.}}

{{Devices_Sidebar}}
