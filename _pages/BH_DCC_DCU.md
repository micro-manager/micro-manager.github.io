---
title: Becker & Hickl DCC and DCU
layout: page
---

| Summary | [Becker & Hickl](https://www.becker-hickl.com/) [DCC](https://www.becker-hickl.com/products/dcc-100-dcc-100pcie/) and [DCU](https://www.becker-hickl.com/products/dcu-400-dcu-800/) Detector Control Cards/Units |
| Author  | Mark A. Tsuchida |
| License | BSD |
| Platforms | Windows |
| Devices | DCC-100 (PCI, PCIe); DCU-400, DCU-800 (USB) |

---

## Installation

1. Install the latest [TCSPC
   Package](https://www.becker-hickl.com/products/tcspc-package/) from
   [BH](https://www.becker-hickl.com/). This includes drivers and control apps
   for TCSPC cards as well as DCC/DCU. The installer allows you to select
   components to install. You should select at least **DCC** _and_ **DCC DLL**.
   No license key should be needed for DCC control.
2. Copy the DCC DLL (`C:\Program Files (x86)\BH\DCC\DLL\dcc64.dll`) to the
   Micro-Manager install folder.

## Configuration

1. In the Hardware Configuration Wizard, add **BH_DCC_DCU > DCCHub** or
   **BH_DCC_DCU > DCUHub**.
2. Set the pre-initialization properties for the hub. Select whether to use
   software simulation of the devices (only useful for testing), and select the
   modules to control. If you only have a single device, you can accept the
   default settings.
3. When the list of peripherals is shown, check the box for each module
   (**DCCModule1**, etc.).

Up to 8 DCC devices and up to 4 DCU devices can be controlled on the same
computer.

## Usage

If you are new to these devices, it is best to first familiarize yourself with
their behavior using the manufacturer-provided applications (DCC or DCU).

Each device (module) has a number of connectors (3 for DCC; 5 for DCU), each
with a number of features: a subset of +5V, -5V, +12V, Gain/HV, cooling, and
digital output. In Micro-Manager, these are each controled using a separate
property: for example, the **C1_GainHV** property sets the detector gain
control voltage (percentage) for connector 1.

Note that power and control outputs are not activated until the
**EnableOutputs** property is switched on. (DCU models have a separate property
for each connector: **C1_EnableOutputs**, etc.) Whether the cooler power supply
is under the control of the **EnableOutputs** property may depend on the exact
version of your device; see the manual or contact the manufacturer.

## Gain/HV properties

The **GainHV** property (of each connector) is a percentage (0-100). (The
actual voltage range of the control output depends on which output pin is used.
See the manufacturer documentation.)

It is possible to set an upper limit in the device's nonvolatile memory
(EEPROM). Setting the Gain/HV limit is not supported in Micro-Manager; use the
manufacturer-provided control program. The allowed value range in Micro-Manager
should reflect this limit.

## Detector overload

For connectors that have a **GainHV** property, there is an input for a
detector overload signal (provided, e.g., by a preamplifier). When this input
(which uses inverted logic) goes low, the Gain/HV and other outputs are shut
off.

(Exactly which outputs are shut off in reaction to which overload signals is a
little complicated; make sure to check the manufacturer documentation.)

When an overload is detected, it is indicated by the read-only properties
**C1_Overloaded**, etc. (These are updated approximately once per second.)

To reset the overload state and reactivate the power and control outputs, set
the **ClearOverloads** property to **Clear** (it will toggle back to a blank
value). In the case of DCU, there are separate properties for each connector:
**C1_ClearOverload**, etc.

## Cooler current limit

The cooler power supply allows setting a voltage (e.g., **C3_CoolerVoltage**,
in volts) and current limit (e.g., **C3_CoolerCurrentLimit**, in amperes),
aside from an on/off switch (e.g., **C3_Cooling**).

If the current limit is reached, this is indicated by the read-only property
**C3_CoolerCurrentLimitReached**. (As with detector overload, these are updated
approximately once per second.) There is no manual reset for this state; it
will go back to **No** when the current limit is no longer being reached.

## Digital output

The digital output property (DCC: **C2_DigitalOut**; DCU: **C5_DigitalOut**) is
an 8-bit binary mask: `0` means all bits off, `255` means all bits on.

Example: `7` (= binary `00000111`) will turn on bits 0, 1, and 2 and turn off
bits 3-7.

## Troubleshooting

### **BH_DCC_DCU** is not available in the Hardware Configuration Wizard

Make sure that you have copied the `dcc64.dll` file to the Micro-Manager
folder.

If the problem persists, maybe try also copying the file `C:\Program Files
(x86)\BH\DCC\DLL\64b\ftd2xx.dll` to the Micro-Manager folder. (I didn't need to
do this, but this DLL (the FTDI USB-serial D2XX driver) is installed by various
programs so it's possible that I didn't see what would happen on a fresh
system.)

### "DCC (DCU) module is in use by another application"

If you get this error message:

1. Make sure you are not running any other program that accesses the DCC or
   DCU (such as the BH DCC or DCU app or another copy of Micro-Manager).
2. Open the BH DCC (or DCU) application. Select the module(s) in question and
   click "Apply". Confirm forced initialization if asked.
3. Close the BH DCC (or DCU) app.
4. Restart Micro-Manager or reload the hardware configuration.
