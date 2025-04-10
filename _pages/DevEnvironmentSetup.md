---
title: Device Adapter Development Environment Setup
layout: page
section: Programming:Device Adapters
---

#### Overview

Developing Micro-Manager device adapters requires setting up a specific directory structure and obtaining the necessary source code and dependencies.

**Note:** For complete, up-to-date instructions, please refer to our [Source Code](/Micro-Manager_Source_Code) page.

#### Directory Structure

Create a base directory (e.g., `MyDevRoot`) with the following subdirectories:

* `/micro-manager` - Main development source code
* `/3rdpartypublic` - Required open-source third-party libraries
* `/3rdparty` - Optional proprietary libraries for specific hardware support

#### Basic Setup

1. Create your base directory and the three subdirectories listed above
2. Clone the Micro-Manager source code into the `/micro-manager` directory
3. Initialize and update any git submodules (i.e. `mmCoreAndDevices`)
4. Download or clone the required third-party libraries into `/3rdpartypublic`
5. Add any proprietary libraries to `/3rdparty` if needed for your hardware

For detailed instructions on each step, refer to the [Source Code](/Micro-Manager_Source_Code) page.





