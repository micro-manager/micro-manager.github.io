---
title: Micro-Manager Source Code
redirect_from: /wiki/Micro-Manager_Source_Code
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

The source code includes all Micro-Manager files (Java and C++) and all
supporting files (project files, build scripts, etc.). To build the
entire project a number of Open Source libraries and device SDKs must be
installed. See the [build
instructions](/Building_and_debugging_Micro-Manager_source_code). However, many taskes (creating a plugin or device adapter can be accomplished without having to build the full project from scratch).


## Current source code

The source code for Micro-Manager 2.x is located on GitHub at
https://github.com/micro-manager/micro-manager in the `main` branch.

As of April 2021 the source code has been split into multiple Git
repositories which are used as submodules of the main repository. In
order to fully clone the source code please follow these instructions:

1. Clone the main repository: `git clone https://github.com/micro-manager/micro-manager`

2. Initialize all submodules: `git submodule update --init --recursive`

When updating to a new revision of the repository using `git pull` it is a good
idea to run `git submodule update --recursive` in order to make sure that all
submodules are also up to date.

## Subversion repository containing dependencies

This is needed for building on Windows ([SlikSVN](https://sliksvn.com/download/)
provides the `svn` command):

```sh
svn checkout https://svn.micro-manager.org/3rdpartypublic
```

Note that this is a large repository and will take up about 5 GB of disk space.

{% include notice icon="info" content='If you already have a working copy of
`3rdpartypublic` created from the old URL (`valelab4.ucsf.edu`; you can check
with `svn info`), then you do not need to check out a new copy from scratch.
Instead you can use the command `svn relocate https://valelab4.ucsf.edu/svn
https://svn.micro-manager.org` to point your working copy to the current URL.'
%}

To build on Linux and macOS, usually you only need the `classext` subdirectory
of the repo (and `svn` supports checking out just a subdirectory):

```sh
mkdir 3rdpartypublic
svn checkout https://svn.micro-manager.org/3rdpartypublic/classext 3rdpartypublic/classext
```

A few device adapters (currently just Zaber) may use other directories of
`3rdpartypublic` on Linux.

On all operating systems, the `3rdpartypublic` directory should be in the same
parent directory as the `micro-manager` directory from Git.

## Source code of legacy versions

- The Micro-Manager 1.4 source code is in the `mm1.4` branch of the [GitHub
  repository](https://github.com/micro-manager/micro-manager).


## Note about the source code licensing terms

Micro-Manager is structured in three distinct layers: Graphical User
Interface (GUI), Device Adapters and MMCore. All source files, except
ones carrying a different license notice in the header, are copyright of
University of California. GUI and Device adapters are distributed under
the "[BSD](http://www.opensource.org/licenses/bsd-license.php)" license,
while MMCore is distributed under "[Lesser
GPL](http://www.opensource.org/licenses/lgpl-license.php)" license.
License text files are included in the source package, and each file
should have a header stating the exact type of license. A good starting
point to learn more about the Open Source Code licensing is
<http://www.opensource.org/>. If you have any questions or need some
clarification regarding our licensing terms please let us know:
<info@micro-manager.org>