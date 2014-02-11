= Search Paths =

== Introduction ==

If you install the official binary distribution of Micro-Manager, you will not need to configure any search paths. However, if you have built Micro-Manager yourself from the source, or are running Micro-Manager in a special way (e.g. from MATLAB or from your own application), then you need to ensure that the Core library and device adapters are correctly located. 

There are two sections in this page: how device adapters are loaded by the Core, and how the MMCoreJ_wrap native library is loaded. The latter, of course, only applies if you are using the Core from Java.

Each of the two sections is divided into two parts: the Old Mechanism and the New Mechanism. The New Mechanism is available since SVN r12743, the nightly build of 20140210, or release 1.4.17. It has not been clarified when the Old Mechanism took its current shape. The Old Mechanism still works (except for a few corner cases that were essentially bugs), but its use in new code is discouraged.

'''A quick summary''': If you are using a version of MM after the New Mechanism was added, and are using MMCoreJ, simply set the Java system property <code>mmcorej.library.path</code> to the path to the directory containing MMCoreJ_wrap and the device adapters. This can be done by passing the command-line argument
  -Dmmcorej.library.path=/path/to/libraries
to Java, or by calling
  System.setProperty("mmcorej.library.path", "/path/to/libraries");

=== Device Adapter Search Paths ===

==== The Old Mechanism ====

The Core searches a list of paths. Paths can be added to the list by calling the static method <code>CMMCore::addSearchPath()</code> (<code>mmcorej.CMMCore.addSearchPath()</code> in Java). There is no way to remove or reorder the paths.

The list of device adapters located in the search paths can be queried with <code>CMMCore::getDeviceLibraries()</code>.

If you are running the Core by itself, the list of search paths is initially empty. However, if you are using MMCoreJ (i.e. running from Java), this is not the case.

In the case of MMCoreJ only, the search path is initially populated with some default paths. Before the New Mechanism was introduced, the default paths were the following (<code>$JARPATH</code> represents the directory containing <code>MMCoreJ.jar</code>, and <code>$FIJIPLATFORM</code> is one of <code>win32</code>, <code>win64</code>, <code>macosx</code>, <code>linux32</code>, or <code>linux64</code>):

* <code>$JARPATH</code>
* <code>$JARPATH/..</code>
* <code>$JARPATH/../mm/$FIJIPLATFORM</code>
* <code>$JARPATH/../..</code>
* <code>$JARPATH/../../mm/$FIJIPLATFORM</code>
* On Linux only, a compile-time hard-coded path where libraries are expected to be located

Java code that was written to work with the Old Mechanism should still work for the time being, as long as the device adapters are located wither in the same directory as MMCoreJ_wrap (i.e. MMCoreJ_wrap.dll or libMMCoreJ_wrap.jnilib or libMMCoreJ_wrap.so) or in a directory explicitly added by calling <code>CMMCore::addSearchPath()</code>. If you are placing your device adapters in a different directory from MMCoreJ_wrap, you need to either add that directory to the search path or switch to using the New Mechanism.

==== The New Mechanism ====

In the New Mechanism, the static methods <code>CMMCore::addSearchPath()</code> and <code>CMMCore::getDeviceLibraries()</code> are deprecated. Instead, there are new ''instance'' methods: <code>CMMCore::setDeviceAdapterSearchPaths()</code>, <code>CMMCore::getDeviceAdapterSearchPaths()</code>, and <code>CMMCore::getDeviceAdapterNames()</code>.

To ensure consistent behavior, the Old (deprecated) and New methods should not be mixed within the same program.

Regardless of whether you are running from Java or not, the list of search paths initially includes the path where the library (or executable) containing the Core is located. So, for example, if your device adapters are in the same directory as the MMCoreJ_wrap native library, they will be found without the need to set the search paths.

=== MMCoreJ_wrap Search Paths ===

==== The Old Mechanism ====

MMCoreJ_wrap (MMCoreJ_wrap.dll, libMMCoreJ_wrap.jnilib, or libMMCoreJ_wrap.so) is searched for in the following directories (<code>$JARPATH</code> represents the directory containing <code>MMCoreJ.jar</code>, and <code>$FIJIPLATFORM</code> is one of <code>win32</code>, <code>win64</code>, <code>macosx</code>, <code>linux32</code>, or <code>linux64</code>):

* <code>$JARPATH</code>
* <code>$JARPATH/..</code>
* <code>$JARPATH/../mm/$FIJIPLATFORM</code>
* <code>$JARPATH/../..</code>
* <code>$JARPATH/../../mm/$FIJIPLATFORM</code>
* On Linux only, a compile-time hard-coded path where libraries are expected to be located

If it is not found in any of the above directories, it is loaded from the system default native library paths, usually given by the Java system property <code>java.library.path</code>.

==== The New Mechanism ====

If the Java system property <code>mmcorej.library.path</code> is set, that path (and only that path) is searched for MMCoreJ_wrap. This is the preferred mechanism and should be used by any new launchers.

Otherwise, for backward compatibility, the following paths are searched:

* <code>$JARPATH</code>
* <code>$JARPATH/..</code>
* <code>$JARPATH/../mm/$FIJIPLATFORM</code>
* <code>$JARPATH/../..</code>
* <code>$JARPATH/../../mm/$FIJIPLATFORM</code>
* On Linux only, a compile-time hard-coded path where libraries are expected to be located

If it is not found in any of the above directories, it is loaded from the system default native library paths, usually given by the Java system property <code>java.library.path</code>.

(The "Linux only" hard-coded path may be made configurable in the future, so that it can be enabled or disabled at build time on both OS X and Linux.)

{{Template:Programming_Sidebar}}
