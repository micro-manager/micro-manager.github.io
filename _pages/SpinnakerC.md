---
title: SpinnakerC
layout: page
---

|                  |                                                                  |
|------------------|------------------------------------------------------------------|
| Summary:         | Device adapter for FLIR cameras using the Spinnaker C API        |
| Authors:         | [CAIRN](https://www.cairn-research.co.uk), Mark Tsuchida         |
| Platforms:       | Windows (64-bit)                                                 |
| Available since: | 2026-03-09 nightly build                                         |

------------------------------------------------------------------------

SpinnakerC is a rewrite of the [Spinnaker](Spinnaker) device adapter using
the FLIR Spinnaker C API (rather than the C++ API). It provides the same
functionality but has more flexible requirements for the Spinnaker SDK version.

## Installation

Download and install the [Spinnaker
SDK](https://www.teledynevisionsolutions.com/products/spinnaker-sdk/) version
4.3 or later (but earlier than version 5). In the installer, make sure to
select the driver for the type of camera you use (GigE, USB, or USB legacy).
Installing SpinView is recommended to verify that the camera works
independently of Micro-Manager.
