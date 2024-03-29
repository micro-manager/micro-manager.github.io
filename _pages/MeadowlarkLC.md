---
autogenerated: true
title: MeadowlarkLC
redirect_from: /wiki/MeadowlarkLC
layout: page
---

|  |  |
|---|---|
| Summary: | Adapter for the [Meadowlark Optics]( https://www.meadowlark.com/ ) [D5020]( https://www.meadowlark.com/liquid-crystal-digital-interface-controller/ ) liquid crystal controller |
| Author: | Amitabh Verma and Ivan Ivanov |
| License: | BSD |
| Platforms: | Windows |
| Since version: | 2023-04-15 |

---

### Overview

This is a Micro-Manager device adapter for the [Meadowlark Optics](https://www.meadowlark.com/) [D5020](https://www.meadowlark.com/liquid-crystal-digital-interface-controller/) liquid crystal (LC) controller. It enables setting the voltage or retardance of a liquid crystal device. Multiple LCs per controller are supported. LC-specific voltage-to-retardance calibration curves at multiple wavelengths can be supplied for accurate conversion between voltage and retardance. A number of palette elements can be defined which support defining and switching the state of multiple LCs.

This device adapter can be used with the [recOrder](https://github.com/mehta-lab/recOrder) plugin for [napari](https://napari.org/) to assist in LC calibration for microscopy measurements.

### Installation

Install the Meadowlark Optics USB driver and CellDRIVE application following the manufacturer's instructions. Ensure that CellDRIVE successfully connects to the LC controller and can be used to change the retardance of the liquid crystals.

Copy the Meadowlark Optics `usbdrvd.dll` into the Micro-Manager installation folder. The file can be found in the `\C++ Example\64 bit\` directory on the installation drive supplied by the manufacturer.

The device adapter is supplied with a `mmgr_dal_MeadowlarkLC.csv` file which contains voltage versus retardance calibration data at three wavelengths for two LCs. It enables approximate conversion between voltage and retardance. The file may be updated with calibration data provided by the manufacturer.

### Supported devices

Currently, only the 20V version of the D5020 controller is supported. Support may be later extended to the 10V version of the controller.

### Calibration file structure

The `mmgr_dal_MeadowlarkLC.csv` file must follow structure such as:

```
Voltage(mv),490-A,490-B,Voltage(mv),546-A,546-B,Voltage(mv),630-A,630-B
-,-,-,-,-,-,-,-,-
0,490,490,0,546,546,0,630,630
0,970.6205,924.4288,0,932.2446,891.2008,0,899.6626,857.2885
200,970.7488,924.4422,200,932.2028,891.1546,200,899.5908,857.3078
...
20000,40.5954,40.4874,20000,38.6905,39.5402,20000,35.5043,38.1445
-,-,-,-,-,-,-,-,-
```

The first row of the CSV file is a header row, structured as [Voltage (mV), XXX-A, XXX-B, Voltage (nm), XXX-A, XXX-B, ...] where XXX is the calibration wavelength in nanometers. For example 532-A would contain measurements of the retardance of LC1 (i.e. the LC connected to the LC1 terminal of the controller, also known as LCA) as a function of applied voltage at 532 nm. The second row contains dashes in every column. The third row contains "0" in the Voltage column and the calibration wavelength in the retardance columns, e.g [0, 532, 532]. The following rows contain the LC calibration data. Retardance is recorded in nanometers and voltage is recorded in millivolts. The last row contains dashes in every column.