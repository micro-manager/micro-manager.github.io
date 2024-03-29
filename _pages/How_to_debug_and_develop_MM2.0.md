---
autogenerated: true
title: How to debug and develop MM2.0
redirect_from:
  - /wiki/How_to_debug_and_develop_MM2.0
  - /wiki/How_to_set_up_the_Java_environment_to_debug_MM2.0_and_how_to_work_with_Github_and_submit_pull_requests.
layout: page
---

### Setting up Github

1.  Create an account at github.com and log in.

<!-- -->

1.  Go to <https://github.com/micro-manager/micro-manager/> and click
    the fork button at the upper right. This creates a copy of the
    micro-manager source tree in your account that you can edit.

<!-- -->

1.  Go to your newly forked repository and download it to your computer,
    either using Github desktop or the git command line tools. [See here
    for instructions on getting started with git
    locally.](https://help.github.com/articles/set-up-git/)

<!-- -->

1.  In your local forked copy, add a remote that points to the master
    Micro-manager repository, known as an upstream. [See here for
    details.](https://help.github.com/articles/configuring-a-remote-for-a-fork/)

<!-- -->

1.  You're now ready to edit code and submit pull requests back to
    micro-manager.

### Setting up Netbeans

The following instructions for debugging Micro-Manager's Java code with
NetBeans are intended to work on Windows or Mac. This is largely
identical to the instructions for developing the Java code in 1.4.

(See also: [Writing plugins for
Micro-Manager](Writing_plugins_for_Micro-Manager))

1.  Download and install the latest Micro-Manager nightly build. We will
    refer to the installed Micro-Manager directory as `$INSTALLDIR`
    below.

<!-- -->

1.  Download, install and run [NetBeans](http://netbeans.org). The Java
    SE Bundle is sufficient if you already have the JDK (Java
    Development Kit) installed on your computer. Otherwise, you can
    install the JDK and NetBeans at the same time from [Oracle's JDK
    download
    page](http://www.oracle.com/technetwork/java/javase/downloads/).

<!-- -->

1.  Choose **File** &gt; **New Project...** &gt; \[Categories\]
    **Java** &gt; \[Projects\] **Java Project with Existing Sources**.
    Press **Next**.

<!-- -->

1.  Give your project a name. The **Project Folder** is best saved
    outside of the Micro-Manager source directory. Press **Next**.

<!-- -->

1.  Under **Source Package Folders**, click **Add Folder** at right and
    browse to `$SRCDIR/mmstudio/src/main/resources`. Also add
    `$SRCDIR/mmstudio/src/main/java`. If you want to develop a plugin,
    you can also add `$SRCDIR/plugins/*/src` at this time. Press
    **Next**.

<!-- -->

1.  Right-click your project in the **Projects** tab (probably at left)
    and select **Properties**.

<!-- -->

1.  Select **Libraries** under **Categories**. Make sure the **Java
    Platform** matches the version of Micro-Manager you are using (e.g.,
    64-bit JDK 1.6 - but using a newer Java Platform in NetBeans than
    the one shipped with Micro-Manager is usually okay).

<!-- -->

1.  Under **Compile** &gt; **Compile-time Libraries**, click **Add
    Jar/Folder** and add `$INSTALLDIR/ij.jar`, as well as all jars in
    `$INSTALLDIR/plugins/Micro-Manager` *except for* `MMJ_.jar`.

<!-- -->

1.  Select **Run** under **Categories**. For the
    <default config>

    , set the following parameters:

\#\* **Main Class:** type in `ij.ImageJ`

\#\* **Working Directory:** type in your `$INSTALLDIR`

\#\* **VM options:** for 64 bit systems, type in `-Xmx3000M`, otherwise
use `-Xmx600M`. This sets the maximum memory (megabytes) used by Java.
Lately, you also need `-Dforce.annotation.index=true`.

1.  Click **OK**, and then right-click your project and choose
    **Debug**. If all is well, then Micro-Manager should launch inside
    ImageJ.

### Submitting a Pull Request

Once you have made whatever changes you want in the Micro-manager code,
you can submit a pull request to the maintainers for them to consider
your changes. To do so:

1.  First, create a new branch in your git repository. This should have
    a name relevant to whatever change you are submitting.

<!-- -->

1.  Next, commit your changed code to this branch, and sync with your
    github repository.

<!-- -->

1.  Go to your forked micro-manager repository. Select the branch
    containing the code you want to submit, and click new pull request.

<!-- -->

1.  Select the mm2 branch to compare to your fork, and create the pull
    request.
