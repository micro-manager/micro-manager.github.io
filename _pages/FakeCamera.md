<table><tr><td>
'''Summary:'''</td><td>Adapter for fake/virtual camera that loads images from disk. Can provide different images depending on stage postions.</td></tr>
<tr><td>'''Author:'''</td><td>Lukas Lang</td></tr>
<tr><td>'''License:'''</td><td>Apache License, Version 2.0</td></tr> 
<tr><td>'''Platforms:'''</td><td>Windows, 32 & 64-bit, Linux (see [[#Building on Linux|below]])</td></tr>
<tr><td>'''Available since version:'''</td><td>1.4.23, 1. November 2017</td>
</table>

This camera adapter adds a virtual camera that can be configured to load arbitrary images from disk. Supported formats are all those supported by OpenCV's [https://docs.opencv.org/2.4/modules/highgui/doc/reading_and_writing_images_and_video.html?highlight=imread#imread <code>imread</code>], in particular:
* PNG
* BMP
* TIF/TIFF
* JPG/JPEG
* ...

The pixel type can be set to 8/16-bit grayscale and 8/16-bit RGB (16-bit RGB does currently not work due to a limitation in Micromanager). All images are converted to the selected type, regardless of their true pixel format.

The path mask can be set in the Device Property browser and supports the following placeholders:

<table>
<tr><td><code>??</code></td><td>Position of focus stage</td>
<tr><td><code>?{<prec>}?</code></td><td>Position of focus stage, with precision <code><prec></code></td>
<tr><td><code>?[<stage>]</code></td><td>Position of stage <code><stage></code></td>
<tr><td><code>?{<prec>}[<stage>]</code></td><td>Position of stage <code><stage></code> with precision <code><prec></code></td>
</table>

The positions are rounded according to the specified precision (default is 0, i.e. integers). The resolved path (i.e. the path with the current positions inserted) is shown in the "Resolved path" property. Demo stages provided by the [[DemoCamera]] device adapter can be used in place of physical stages to fully work without hardware (to add multiple stages, add multiple DHub devices)

===Example path mask===
The examples assume the following stage positions:
* Focus stage: 7.41um
* "x-Axis" stage: 3.52um
* "y-Axis" stage: -1.33um

<table>
<tr><td>'''Path mask'''</td><td>'''Resolved path'''</td></tr>
<tr><td><code>C:\imgs\img_??.png</code></td><td><code>C:\imgs\img_7.png</code></td></tr>
<tr><td><code>C:\imgs\img_??_?[x-Axis]_?[y-Axis].png</code></td><td><code>C:\imgs\img_7_3_-1.png</code></td></tr>
<tr><td><code>C:\imgs\img_?{1}?_?{2}[x-Axis]_?[y-Axis].png</code></td><td><code>C:\imgs\img_7.4_3.52_-1.png</code></td></tr>
</table>

===Building on Linux===
The device adapter can be used on Linux (RGB mode currently does not work). To build it, the instructions in [[Linux_installation_from_source_(Ubuntu)]] need to be adapted as follows (tested on Ubuntu 16):

<ul>
<li>During "Install Build programs & libraries", also install OpenCV 2.4.8.3, following the guide [https://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html here]. In short:
<ul>
<li>Dependencies
{{MessageBox|1=Commandline|2=<pre>

sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev   libavformat-dev libswscale-dev tar
</pre>}}</li>
<li>Download code & extract it
{{MessageBox|1=Commandline|2=<pre>

wget https://github.com/opencv/opencv/archive/2.4.8.3.tar.gz
tar -xvf 2.4.8.3.tar.gz
</pre>}}</li>
<li>Build & install it
{{MessageBox|1=Commandline|2=<pre>

cd opencv-2.4.8.3
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make
sudo make install
</pre>}}</li>
</ul>
<li>During "Create the Autotools files" add <code>--with-opencv</code> to the configure call:

{{MessageBox|1=Commandline|2=<pre>

cd ~/mm/micro-manager1.4
./autogen.sh
./configure --enable-imagej-plugin=/usr/local/ImageJ --with-opencv
</pre>}}</li>
<li>Continue normally</li>
</ul>

{{Listserv_Search|FakeCamera}}

{{Devices_Sidebar}}
