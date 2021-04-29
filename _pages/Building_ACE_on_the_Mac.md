MicroManager currently doesn't link ACE though versions prior to 1.3.42 (Subversion revision 3467) used ACE, so if you are still working with an old version of MicroManager here are the instructions.

Download  [http://download.dre.vanderbilt.edu/ ACE] version 5.6.1, or possibly later (be sure to get the 'full' version, you only need ACE, no TAO).

Unpack in a logical place (for instance: /usr/local/src) use bunzip2 and tar -xvf to unpack the .tar.bz2 file.

ACE has an autotools build mechanism, and a 'traditional' build.  The autotools build worked with ACE version 5.5 on the Mac, but has been broken since.  To use the 'traditional' build follow the  [http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#aceinstall build instructions].

For example:

cd into ACE_Wrappers and type:

<code>ACE_ROOT=`pwd`; export ACE_ROOT</code>


Create and edit $ACE_ROOT/ace/config.h
On Tiger (10.4) it should read:

<code><pre>
#define ACE_HAS_NONSTATIC_OBJECT_MANAGER
#include "ace/config-macosx-tiger.h"
</pre></code>

For ACE version 5.7.2 with Tiger (10.4), I found it necessary to also add the following to the config.h file:

<code><pre>
#define ACE_LACKS_UNSETENV
#define ACE_LACKS_ISCTYPE
#define ACE_NEEDS_DL_UNDERSCORE
</pre></code>

Create a build configuration file, $ACE_ROOT/include/makeinclude/platform_macros.GNU
On Tiger (10.4) it should read:

<code><pre>
debug = 1
shared_libs = 0
static_libs = 1
include $(ACE_ROOT)/include/makeinclude/platform_macosx_tiger.GNU
</pre></code>


If you wish to build ACE as a shared library, you would need to change this and also define DYLD_LIBRARY_PATH to include $(ACE_ROOT)/lib

Now cd into $ACE_ROOT/ace, type make and pray no errors will occur.

To make the library available to your system, place a symbolic link in /usr/local/include that points to the $(ACE_ROOT)/ace directory:<br>
<code>sudo ln -s $ACE_ROOT/ace /usr/local/include/ace</code>

Copy libACE.a to /usr/local/lib

===External links===
[http://mackeeper.zeobit.com/mac-photo-recovery mac hard drive recovery]

{{Programming_Sidebar}}
