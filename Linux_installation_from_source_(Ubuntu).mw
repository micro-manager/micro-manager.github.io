Intallation notes to install micro-manager from source on Ubuntu systems. These instructions can also be used without modifications for installations on [http://debian.org Debian systems] (tested on Debian Wheezy and Debian Jessy).

{{Note|These instructions are for Micro-Manager 1.4 rather than Micro-Manager 2.0 (which uses JDK 8 and has source code on [https://github.com/micro-manager/micro-manager github] rather than in a subversion repository. Instructions for building Micro-Manager 2.0 can be found [[Linux installation from source MM2 | here]]}}

{{Note|This page has been updated for the build system changes of r13120, based on testing on Ubuntu 12.04 LTS.}}

See also: <code>doc/how-to-build.md</code> in the source tree.

= Preparation =


== Install JDK ==

If you are building the Micro-Manager Java GUI, Java 1.6 or 1.7 is recommended[http://imagej.1557.x6.nabble.com/Java-error-when-compiling-a-plugin-tp5004378p5004386.html]. The simplest way is to use OpenJDK:

{{MessageBox|1=Commandline|2=<pre>

sudo apt-get install openjdk-6-jdk
</pre>}}

(You can also use <code>openjdk-7-jdk</code>.)

== Install ImageJ ==

[http://rsb.info.nih.gov/ij/download.html Download the Linux version of ImageJ] from the NIH website.  From a terminal, unzip to <code>/usr/local/</code>, and remove the embedded JRE, as we already have one installed.

{{MessageBox|1=Commandline|2=<pre>

cd ~/Downloads/
sudo unzip ij*-linux*.zip -d /usr/local/
sudo rm -rf /usr/local/ImageJ/jre
sudo chmod a+Xr /usr/local/ImageJ
</pre>}}

== Install Build Programs and Libraries ==

You will need a subversion client to checkout the source code, several libraries, and build tools.  Install them with:

{{MessageBox|1=Commandline|2=<pre>

sudo apt-get install subversion build-essential autoconf automake libtool \
                     libboost-all-dev zlib1g-dev swig ant
</pre>}}

You may also need to install additional packages (for cameras and special hardware).  See the full list in [[#Dependencies]]

== Fetch Source Repositories ==

Create a directory for the the subversion repositories, such as <code>~/mm</code>.  Besides the source tree, additional binary dependencies are stored in the <code>3rdpartypublic</code> repository.  The build scripts in the source tree assume <code>3rdpartypublic</code> is in the same parent folder level:

{{MessageBox|1=Commandline|2=<pre>
mkdir ~/mm
cd ~/mm
svn co https://valelab4.ucsf.edu/svn/micromanager2/trunk/ micro-manager1.4
svn co https://valelab4.ucsf.edu/svn/3rdpartypublic/
</pre>}}

This creates 2 new folders in the <code>mm</code> directory:
<pre>
    ~/mm/micro-manager1.4
    ~/mm/3rdpartypublic
</pre>

Subversion (svn) will likely complain saying that it cannot verify the https certificate. Typing **t** to temporarily trust the certificate allows to retrieve the repository.

Also, when retrieving large repository (like the 3rdpartypublic/ repository), svn can hung in the middle of the process, with an error message:

<pre>
svn: REPORT de '/svn/3rdpartypublic/!svn/vcc/default': 
Could not read chunk delimiter: Secure connection truncated (https://valelab4.ucsf.edu)
</pre>

This can be [http://stackoverflow.com/questions/4031845/svn-resuming-aborted-checkout#13789596 solved] by typing:

{{MessageBox|1=Commandline|2=
<pre>
svn cleanup 3rdpartypublic/
svn update 3rdpartypublic/ # This command might be executed several times
</pre>}}

= Building Micro-Manager =

== Create the Autotools files ==

{{MessageBox|1=Commandline|2=<pre>

cd ~/mm/micro-manager1.4
./autogen.sh
./configure --enable-imagej-plugin=/usr/local/ImageJ
</pre>}}

== Download build dependencies ==

{{MessageBox|1=Commandline|2=<pre>

make fetchdeps   # Required since SVN r14001-r14016
</pre>}}

== Compile ==

{{MessageBox|1=Commandline|2=<pre>

make
</pre>}}

== Install ==

{{MessageBox|1=Commandline|2=<pre>

sudo make install
</pre>}}

= Post Install =

== Editing the startup script ==

A script named <code>mmimagej</code> will have been installed in <code>/usr/local/ImageJ</code>. You might want to edit its contents to pass extra flags to Java. You may also want to put this script in your <code>PATH</code>.

= Running Micro-Manager =

Start Micro-Manager by typing:

{{MessageBox|1=Commandline|2=<pre>

/usr/local/ImageJ/mmimagej 2>&1 >/dev/null &
</pre>}}

To view the Core logging in the terminal while Micro-Manager is running, start simply as:

{{MessageBox|1=Commandline|2=<pre>

/usr/local/ImageJ/mmimagej
</pre>}}

= Appendix =

== Dependencies ==

{| class="wikitable"
|+ You need the following packages:
! Name || Equivalent Synaptic package name
|-
|colspan="2"  style="background: #ddd; border-top: 1px solid gray; padding: 5px; text-align: center"| Required Dependencies:
|-
| Subversion || <code>subversion</code>
|-
| GNU C++ || <code>build-essential</code>
|-
| GNU Autotools || <code>autoconf</code>, <code>automake</code>
|-
| GNU Libtool || <code>libtool</code>
|-
| Boost libraries || <code>libboost-all-dev</code>
|-
| zlib compression library || <code>zlib1g-dev</code>
|-
| Simplified Wrapper and Interface Library || <code>swig</code>
|-
| OpenJDK || <code>openjdk-6-jdk</code> or <code>openjdk-7-jdk</code>
|-
|colspan="2"  style="background: #ddd; border-top: 1px solid gray; padding: 5px; text-align: center"| Optional Dependencies:
|-
| Python || <code>python-dev</code>, <code>python-numpy-dev</code>
|-
| Firewire Camera Library || <code>libdc1394-*-dev</code>
|-
| Open Source Computer Vision Library || <code>libopencv-dev</code>
|-
| GPhoto2 || <code>libgphoto2-2-dev</code>
|-
| FreeImagePlus (used by GPhoto device adapter) || <code>libfreeimage-dev</code>
|-
| libusb 0.1 || <code>libusb-dev</code>
|-
| Andor SDK 2/3 || N/A - request from Andor website
|}

{{Programming_Sidebar}}
