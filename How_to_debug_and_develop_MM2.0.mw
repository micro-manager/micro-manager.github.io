=== Setting up Github ===

# Create an account at github.com and log in.
<!--
-->
# Go to https://github.com/micro-manager/micro-manager/ and click the fork button at the upper right. This creates a copy of the micro-manager source tree in your account that you can edit.
<!--
-->
# Go to your newly forked repository and download it to your computer, either using Github desktop or the git command line tools. [https://help.github.com/articles/set-up-git/ See here for instructions on getting started with git locally.]
<!--
-->
# In your local forked copy, add a remote that points to the master Micro-manager repository, known as an upstream. [https://help.github.com/articles/configuring-a-remote-for-a-fork/ See here for details.] 
<!--
-->
# You're now ready to edit code and submit pull requests back to micro-manager.

=== Setting up Netbeans ===

The following instructions for debugging Micro-Manager's Java code with NetBeans are intended to work on Windows or Mac. This is largely identical to the instructions for developing the Java code in 1.4.

(See also: [[Writing plugins for Micro-Manager]])

# Download and install the latest Micro-Manager nightly build. We will refer to the installed Micro-Manager directory as <code>$INSTALLDIR</code> below.
<!--
-->
# Download, install and run [http://netbeans.org NetBeans]. The Java SE Bundle is sufficient if you already have the JDK (Java Development Kit) installed on your computer. Otherwise, you can install the JDK and NetBeans at the same time from [http://www.oracle.com/technetwork/java/javase/downloads/ Oracle's JDK download page].
<!--
-->
# Choose '''File''' > '''New Project...''' >  [Categories] '''Java''' > [Projects] '''Java Project with Existing Sources'''. Press '''Next'''.
<!--
-->
# Give your project a name. The '''Project Folder''' is best saved outside of the Micro-Manager source directory. Press '''Next'''.
<!--
-->
# Under '''Source Package Folders''', click '''Add Folder''' at right and browse to <code>$SRCDIR/mmstudio/src/main/resources</code>. Also add <code>$SRCDIR/mmstudio/src/main/java</code>. If you want to develop a plugin, you can also add <code>$SRCDIR/plugins/*/src</code> at this time. Press '''Next'''.
<!--
-->
# Right-click your project in the '''Projects''' tab (probably at left) and select '''Properties'''.
<!--
-->
# Select '''Libraries''' under '''Categories'''. Make sure the '''Java Platform''' matches the version of Micro-Manager you are using (e.g., 64-bit JDK 1.6 - but using a newer Java Platform in NetBeans than the one shipped with Micro-Manager is usually okay).
<!--
-->
# Under '''Compile''' > '''Compile-time Libraries''', click '''Add Jar/Folder''' and add <code>$INSTALLDIR/ij.jar</code>, as well as  all jars in <code>$INSTALLDIR/plugins/Micro-Manager</code> ''except for'' <code>MMJ_.jar</code>.
<!--
-->
# Select '''Run''' under '''Categories'''. For the <default config>, set the following parameters:
<!--
-->
#* '''Main Class:'''  type in <code>ij.ImageJ</code>
<!--
-->
#* '''Working Directory:''' type in your <code>$INSTALLDIR</code>
<!--
-->
#* '''VM options:''' for 64 bit systems, type in <code>-Xmx3000M</code>, otherwise use <code>-Xmx600M</code>. This sets the maximum memory (megabytes) used by Java. Lately, you also need <code>-Dforce.annotation.index=true</code>.
<!--
-->
# Click '''OK''', and then right-click your project and choose '''Debug'''. If all is well, then Micro-Manager should launch inside ImageJ.

=== Submitting a Pull Request ===

Once you have made whatever changes you want in the Micro-manager code, you can submit a pull request to the maintainers for them to consider your changes. To do so:

# First, create a new branch in your git repository. This should have a name relevant to whatever change you are submitting.
<!--
-->
# Next, commit your changed code to this branch, and sync with your github repository.
<!--
-->
# Go to your forked micro-manager repository. Select the branch containing the code you want to submit, and click new pull request.
<!--
-->
# Select the mm2 branch to compare to your fork, and create the pull request.
