---
autogenerated: true
title: Visual Studio project settings for device adapters
redirect_from: /wiki/Visual_Studio_project_settings_for_device_adapters
layout: page
section: Programming:Device Adapters
---

Here are instructions for how to set up a Visual Studio project for a
new device adapter. For more details on how to write device adapters for
Micro-Manager, see [Building Micro-Manager Device
Adapters](Building_Micro-Manager_Device_Adapters). For
instructions on how to build existing device adapters in the
Micro-Manager subversion repository, see the page on [Building MM on
Windows](Building_MM_on_Windows).

# Setting up a new device adapter project

## Prerequisites

See the page on [Building MM on Windows](Building_MM_on_Windows) for how to set
up a development environment for Micro-Manager, including Microsoft Visual
Studio. The following assumes that those instructions were followed.

## Adding the project

1.  Open `micromanager.sln` (at the root of the `mmCoreAndDevices` source
    tree) in Visual Studio.
2.  In the **Solution Explorer** (usually at the left of the window),
    right-click on the **Solution** (at the top of the list), and choose
    **Add &gt; New Project...**.
3.  Choose the **Dynamic-Link Library (DLL)** template. Click **Next**.
4.  Give your
    project a **Name** (this will be your device adapter's name, so
    avoid spaces and use alphanumeric characters, dashes, and
    underscores only). Set the **Location** to either `DeviceAdapters/`
    or `TestDeviceAdapters/` (in theory, it does not matter where you
    set this). Click **Create**.
5.  Your new project should show up in the **Solution Explorer**.
6.  Delete the headers and source files created by the template; they
    are not useful for device adapters.
7.  By adding a new project, the solution gained settings for the "x86"
    platform. Micro-Manager is 64-bit only, so we don't want this.
    From the platform drowdown in the toolbar, select **Configuration
    Manager...**. From the "Active solution platform:" dropdown, select
    **Edit...**. Delete the x86 platform from the solution.
8.  Additionally, we want to remove the "x86" settings from the project
    as well. Still in the Configuration Manager, find your project in the
    list. From its Platform dropdown, select **Edit...**. Delete "x86 (which may instead show up as Win32)".
9.  Notice the tabs at the bottom of the
    **Solution Explorer**. Click **Property Manager**.
    Find your project in the **Property Manager** list. Right-click on
    the project and select **Add Existing Property Sheet...**. Choose
    `buildscripts/VisualStudio/MMCommon.props`.
    Repeat the same command, this time choosing
    `buildscripts/VisualStudio/MMDeviceAdapter.props`. Make sure that
    the two added property sheets are displayed under each configuration
    (Debug\|x64 and Release\|x64), with MMDeviceAdapter at the top
    (= downstream). These property sheets provide various project
    settings common to all Micro-Manager device adapters.
10. Now return to the **Solution Explorer** by clicking on the leftmost
    tab at the bottom of the **Property Manager**.
11. Lets add our first source files to the project. Right-click the
    project, and choose **Add &gt; New Item...**, then **C++ Class**.
12. Enter a class name for your first device, e.g. `MyCamera`. Leave the
    **Base class** empty for now.
13. You can delete the line in `MyCamera.cpp` that `#include`s `pch.h`
    (which we deleted above). How to
    actually code device adapters is beyond the scope of this particular
    page, so lets continue with the project settings.
14. Expand your project in the Solution Explorer and right click on
    **References**; choose **Add Reference...**.
    Scroll down and select
    **MMDevice-SharedRuntime** (not to be confused with
    MMDevice-StaticRuntime). Click **OK**.
    This reference causes your device adapter to be
    linked to the common Micro-Manager device adapter library (built
    from the code in the `MMDevice/` directory).
16. Right-click your project and choose **Properties**. This shows the
    project's Property Pages. In this window,
    the settings are only applied to the build
    configuration and platform selected at the top of the **Property
    Pages** window. We only have one platform (x64), but we
    want the settings to apply to both configurations (Debug and
    Release), so choose **All Configurations** from the
    **Configuration:** popup menu (make sure you do this again if you
    close and reopen the **Property Pages**).
17. Under **Configuration Properties &gt; General**, make sure **Platform
    Toolset** is set to **Visual Studio 2022 (v143)**.
18. Under **Configuration Properties &gt; C/C++ &gt; General**, set
    **Warning Level** to **inherit from parent or project defaults**
    (which should display **Level4** after clicking **Apply**).
19. Under **Configuration Properties &gt; C/C++ &gt; Precompiled
    Headers**, set **Precompiled Header** to
    **inherit from parent or project defaults** (which should display
    **Not Using Precompiled Headers** after clicking **Apply**).
21. That's it! Write the code for your device class, and right-click
    your project and select **Build**. If all goes well, your device
    adapter DLL should be built as
    `build/Release/Win32/mmgr_dal_Example.dll` (or in the directory
    corresponding to the selected configuration and platform).

Advanced note: If, for some reason, your device adapter needs to be
built against the static version of Microsoft's C Runtime (known as
compiler option `/MT`), rather than the default DLL version (`/MD`), you
need to use MMDevice-StaticRuntime instead of MMDevice-SharedRuntime.
This is the case if you are linking against a third-party static library
(not a DLL import library, but a real static library) that was built
against the static C Runtime. See the **Runtime Library** property below
under **C/C++ &gt; Code Generation**.
    
# Visual Studio project properties for Micro-Manager device adapters

Here are some notes on how project properties should be set for
Micro-Manager device adapters. They are organized analogously to the
hierarchy in the **Property Pages** window.

Note that the following assumes that you have correctly added the
`MMCommon.props` and `MMDeviceAdapter.props` property sheets (in that
order, so that MMCommon is upstream) to your project (see the earlier
section on setting up new projects).

## Configuration Properties

The options in this section cannot be set in common property sheets and
must be set correctly in each project.

### General

**Output Directory**, **Intermediate Directory**, **Target Name**,
**Target Extension**: These are set by the common property sheets. Make
sure your project does not override the defaults.
    
**Windows SDK Version**: 10.0 (latest installed version).

**Platform Toolset**: Currently we use **Visual Studio 2022 (v143)**.
    
**C++ Language Standard**: Default (ISO C++ 14 Standard).

### Advanced
    
**Character Set**: For new projects, leave default (**Use Unicode
Character Set**). However, do not change this setting for existing
projects unless you know what you are doing.
    
This should not affect most device adapter projects.
For those device adapters that use the Windows Win32 API (discouraged
unless strictly necessary), it will determine whether the Win32
functions operate on char strings (**Use Multi-Byte Character Set** =
use ASCII and old-fashioned non-Unicode encodings) or wide char strings
(**Use Unicode Character Set** = use UTF-16). If it is necessary to use
Win32 API calls, it is encourage that the device adapter use the
versions of the functions with a "A" or "W" suffix, so that build
settings do not affect code behavior. (See also the
[official docs](https://docs.microsoft.com/en-us/windows/win32/learnwin32/working-with-strings).)
We do not currently have any explicit support
for non-ASCII strings.

### Debugging

Default settings should be fine.

### VC++ Directories

Leave these at their default values, as modifying them
will just be confusing in most cases. Use the settings under **C/C++**
and **Linker** for setting include and library directories.

### C/C++

#### C/C++ &gt; General

**Additional Include Directories**: If you need to include third-party
header files, add the directory containing them here. Note that the
Boost C++ library (not all modules) is made available by default.

**Warning Level**: We prefer **Level4**. Choose
**inherit from parent or project defaults**.

#### C/C++ &gt; Optimization

Default settings should be fine.

#### C/C++ &gt; Preprocessor

**Preprocessor Definitions**: The necessary **MODULE\_EXPORTS** macro is
provided by the `MMDeviceAdapter.props` property sheet, so no
special settings are necessary for most device adapters.

#### C/C++ &gt; Code Generation

**Enable C++ Exceptions**: **Yes (/EHsc)** (the default) is recommended.
Do not turn on SEH Exceptions; see [this
page](https://web.archive.org/web/20150906223040/http://blogs.msdn.com/b/larryosterman/archive/2004/09/10/228068.aspx)
for why.

**Runtime Library**: Use the DLL variants (the default). If you need to
link against a third-party static library that uses the static (non-DLL)
variant, you will need to choose the non-DLL variants here. Avoid this
unless actually necessary. Make sure to use the corresponding variant of
MMDevice if making the switch (see above under **Framework and
References**).

#### C/C++ &gt; Precompiled Headers

**Precompiled Header**: We avoid using precompiled headers to keep the
project organization simple. Select
**inherit from parent or project defaults** (which is **Not Using
Precompiled Headers**), and remove any `stdafx.*` or `pch.h` files from your
project.

### Linker

#### Linker &gt; General

**Output File**: The default setting should produce the `mmgr_dal_`
prefix if the common property sheets are included correctly.

**Additional Library Directories**: If linking to a third-party library,
you will need to add the directory containing the `.lib` files here.

**Link Library Dependencies**: Must be set to **Yes** (=
**inherit from parent or project defaults**) for the reference to
MMDevice to work correctly.

#### Linker &gt; Input

**Additional Dependencies**: If linking to a third-party library, add
the filenames (`*.lib`) here.

#### Linker &gt; Debugging

**Generate Debug Info**: Best to set to **Yes (/DEBUG)** even for
release builds.

### Build Events

No settings required. Use is discouraged.
