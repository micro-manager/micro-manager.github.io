== Nikon Ti motorized microscope ==

<table>
<tr><td>'''Summary:'''</td><td>Nikon Ti2 motorized microscopes</td></tr>
<tr><td>'''Author:'''</td><td>Mark Tsuchida, Open Imaging, Inc.</td></tr>
<tr><td>'''License:'''</td><td>Freeware. Source code cannot be made available, sorry.</td></tr>
<tr><td>'''Platforms:'''</td><td>Windows 32-bit and 64-bit</td></tr>
</table>

Supported since the 20180220 nightly builds (1.4 and 2.0beta).

=== Installation ===

First, install Nikon's [http://nikon.com/products/microscope-solutions/support/download/software/biological/index.htm Ti2 Control] software. Make sure it can control your microscope. (Some have reported that ver. 2.1.0 does not work with Micro-Manager on Windows 10. Try Nikon Ti2 Control for Windows Ver. 1.2.0.55.)

Next, copy the file <code>Ti2_Mic_Driver.dll</code> into the Micro-Manager folder. The file is located at <code>C:\Program Files\Nikon\Ti2-SDK\bin</code>.

NikonTi2 should then appear in the Hardware Configuration Wizard.
