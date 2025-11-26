---
title: Micro-Manager Installation Notes
redirect_from: /wiki/Micro-Manager_Installation_Notes
layout: page
section: Downloads
nav-links:
- title: Latest Release
  url: /Download_Micro-Manager_Latest_Release
- title: Nightly Builds
  url: /Micro-Manager_Nightly_Builds
- title: Old Versions
  url: /Micro-Manager_Version_Archive
- title: Installation Notes
  url: /Micro-Manager_Installation_Notes
- title: Source Code
  url: /Micro-Manager_Source_Code
---


  
After you install Micro-Manager using the instructions for your
platform, you can test-drive the software in demo-mode. The application
will start in demo-mode by default after installation. To use
Micro-Manager with an actual microscope you will need to configure the
software for the specific hardware components that are part of your
setup.  

The configuration process includes editing configuration files and is
described in the [Configuration Guide](Micro-Manager_Configuration_Guide).
Installation includes a number of sample hardware configuration
files (with extension \*.cfg) provided only as an example or starting
point - they need to be edited in order to use the system with any
particular hardware setup.  

## Windows

Run the installer (MM\_Setup\_x\_y\_zz.exe) and follow the prompts. The
package includes a copy of ImageJ. Besides the
manufacturer's low-level drivers for your camera and possibly other
equipment, no other software is required to fully use Micro-Manager.
Micro-Manager will be installed in C:\\Program Files\\Micro-Manager-x.y by default.

Micro-Manager works on Window 10 or 11, 64-bit.

Currently, the Micro-Manager installer is not signed. This can cause
issues with Windows not trusting the software. If you see the blue
**Windows Protected your PC** dialog, click on **More Info**, which will
unveil the **Run Anyway** button. If the "Windows Protected your PC"
dialog is red, you have multiple options. You can go to Windows
Settings, Update & Security, Windows Security, App & Browser control,
Reputation based Protection Settings, switch off "Check apps and files".
Or, you can right click on the installer and select "Unblock".

If the application looks too small, use the Windows File Explorer
and locate the installation directory (such as C:\Program Files\Micro-Manager).
Right click on ImageJ.exe, select Properties, select the Compatibility tab,
ensure that "Use this setting to fix scaling problems..." is checked and click 
OK or Apply (you may want to do this "for all users").

## macOS

Double click the file Micro-Manager DMG (disk image) that you just downloaded (see
[Download Micro-Manager Latest
Release](Download_Micro-Manager_Latest_Release)). This will
open a drive called 'Micro-Manager'. The drive is on the desktop and in
every Finder Window. Open the drive (by double-clicking). In the drive
there is a folder called Micro-Manager-x.y.z. You can install the
application by dragging this folder to your Applications folder, or you
can launch the application by opening the folder and double clicking the
'ImageJ' icon. If you want to run the 64-bit version of Micro-Manager,
click the "ImageJ64" icon.

The disk image is signed and notarized to meet Apple's requirements.

You also need Java 11 to be installed to run Micro-Manager. It is recommended to
install [Temurin](https://adoptium.net/temurin/releases) JDK 11 for
macOS **x64** (because currently Micro-Manager is Intel/x64 only).

If you go to "Plugins" in the menu and see the item "Why are plugins
missing?", you will need to quit ImageJ and move the ImageJ.app to the
desktop, then move it back. On some Macs you will need to press the
option (or ctrl) key while dragging the app to actually move it rather
them make a shortcut.

## Linux

Micro-manager should work with most standard Linux distributions (e.g.,
Ubuntu, Fedora, Gentoo). However, no pre-compiled version is provided,
and you need to compile and install it from source. See:

-   [Linux installation from source
    (Ubuntu)](Linux_installation_from_source_(Ubuntu))
-   [Linux installation from source
    (Gentoo)](Linux_installation_from_source_(Gentoo))

## If you already use ImageJ

Micro-Manager is packaged as an [ImageJ](http://rsb.info.nih.gov/ij/)
plug-in and contains a copy of the entire ImageJ application, together
with the Java run-time engine. Starting Micro-Manager will automatically
start ImageJ as well. If you already use ImageJ and have it installed on
your machine beforehand, the original installation will not be affected.
Micro-Manager installs and uses its own copy of ImageJ. However, if you
have any existing ImageJ macros or plugins that you want to use with
Micro-Manager, you will have to copy them manually to the appropriate
sub-folders within the root Micro-Manager folder.  

Migrating your favorite ImageJ plugins to Micro-Manager installation
should not cause any problems.
