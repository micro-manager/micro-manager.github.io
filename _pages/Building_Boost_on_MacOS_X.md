---
autogenerated: true
title: Building Boost on MacOS X
redirect_from: /wiki/Building_Boost_on_MacOS_X
layout: page
---

{% include notice icon="info" content="The following content is obsolete. Micro-Manager now requires a newer version of Boost, and it is easiest to install Boost from Homebrew." %}

As of this writing, MM is using the Boost 1.40 release. There are
reasonably complete instructions here:
<http://www.boost.org/doc/libs/1_40_0/more/getting_started/unix-variants.html>

Briefly:

1.  Download [boost
    1.40.0](http://sourceforge.net/projects/boost/files/boost/1.40.0/boost_1_40_0.tar.bz2/download)
2.  tar --bzip2 -xf /path/to/boost\_1\_40\_0.tar.bz2
3.  ./bootstrap.sh, (to build the bjam tool)
4.  Now to build only the libraries needed by Micro-Manager (a huge time
    saver), do:

```
sudo ./bjam --install --link=static --runtime-link=static --threading=multi --layout=tagged --with-system --with-thread --with-iostreams --with-date_time
```

(Now when building micromanager, configure should have the flag:  
`--with-boost-libdir=/path/to/your/boost/libs`)

If you wish to build Universal Binaries, you will need to build boost
separately for each architecture. You can do so with the following build
script:

```
# Note: build for ppc and i386 should be with g++4.0. Build for x86_64 should be with g++4.2.
# to accomplish this, the file tools/build/v2/user-config.jam should contain the following two lines:
# using darwin : 4.0 : g++-4.0 ;
#
# using darwin : 4.2 : g++-4.2 ;
sudo ./bjam --install --build-dir=ppc --toolset=darwin --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/ppc architecture=power address-model=32 macosx-version-min=10.4 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/ppc/lib --includedir=/usr/local/ppc/include --stagedir=/usr/local/ppc
sudo ./bjam --install --build-dir=i386 --toolset=darwin --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/i386 architecture=x86 address-model=32 macosx-version-min=10.4 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/i386/lib --includedir=/usr/local/i386/include --stagedir=/usr/local/i386
sudo ./bjam --install --build-dir=x86_64 --toolset=darwin-4.2 --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/x86_64 architecture=x86 address-model=64 macosx-version-min=10.5 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/x86_64/lib --includedir=/usr/local/x86_64/include --stagedir=/usr/local/x86_64
```

