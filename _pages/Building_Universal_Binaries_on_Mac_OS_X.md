{{Note|See [[Build on MacOS X]] for up-to-date instructions on building on OS X. If you really need to build universal binaries, look at the scripts in <code>buildscripts/nightly/nightlybuild_OSX_*.sh</code> for how to do it. It is no longer necessary to build for separate architectures and merge the binaries afterwards.}}

We found the least painful way to build Universal Binaries (32-bit ppc, 32-bit intel, 64-bit intel) to be to build code for each platform individually and then use the lipo tool to combine these libraries into Universal Binaries.  The Micro-Manager repository contains scripts that will execute cross-compilation for the three platforms (see [https://valelab.ucsf.edu/svn/micromanager2/branches/micromanager1.3/MacInstaller/nightlyBuildMMMac.sh nightlyBuildMMac.sh] and [https://valelab.ucsf.edu/svn/micromanager2/branches/micromanager1.3/MacInstaller/buildMMMac.sh buildMMMac.sh]), however, the supporting libraries (currently, boost, libdc1394, libusb, and for 1.4 also libtiff and zlib) need to be build for each platform independently.  Below are some notes on how this can be accomplished:

'''Cross-compiling Boost for three platforms:'''
<code><br>
sudo ./bjam --install --build-dir=ppc --toolset=darwin --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/ppc architecture=power address-model=32 macosx-version-min=10.4 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/ppc/lib --includedir=/usr/local/ppc/include --stagedir=/usr/local/ppc<br>
sudo ./bjam --install --build-dir=i386 --toolset=darwin --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/i386 architecture=x86 address-model=32 macosx-version-min=10.4 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/i386/lib --includedir=/usr/local/i386/include --stagedir=/usr/local/i386<br>
sudo ./bjam --install --build-dir=x86_64 --toolset=darwin-4.2 --link=static --runtime-link=static --threading=multi --layout=tagged --prefix=/usr/local/x86_64 architecture=x86 address-model=64 macosx-version-min=10.5 --with-system --with-thread --with-iostreams --with-date_time --libdir=/usr/local/x86_64/lib --includedir=/usr/local/x86_64/include --stagedir=/usr/local/x86_64<br>
</code><br>

'''Cross-compiling libtiff for three platforms:'''
<code><br>
./configure --prefix=/usr/local/i386 CC="gcc-4.0" CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386" CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386" CXX="g++-4.0"<br>
make clean<br>
make<br>
sudo make install<br>
./configure --prefix=/usr/local/ppc CC="gcc-4.0" CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc" CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc" CXX="g++-4.0"<br>
make clean<br>
make<br>
sudo make install<br>
./configure --prefix=/usr/local/x86_64 CC="gcc-4.2" CFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64" CXXFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64" CXX="g++-4.2"<br>
make clean<br>
make<br>
sudo make install<br>
</code><br>

'''Cross-compiling zlib for three platforms:'''
<code><br>
export CC="gcc-4.0"<br>
export CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386"<br>
export CXX="g++-4.0"<br>
export CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386"<br>
./configure --prefix=/usr/local/i386<br>
make clean<br>
make<br>
sudo make install<br>
export CC="gcc-4.0"<br>
export CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc"<br>
export CXX="g++-4.0"<br>
export CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc"<br>
./configure --prefix=/usr/local/ppc<br>
make clean<br>
make<br>
sudo make install<br>
export CC="gcc-4.2"<br>
export CFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64"<br>
export CXX="g++-4.2"<br>
export CXXFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64"<br>
./configure --prefix=/usr/local/x86_64<br>
make clean<br>
make<br>
sudo make install<br>
</code><br>

'''Cross compiling gphoto2 for three platforms:'''<br>
This worked with libgphoto 2.4.11.  Older versions had problems in some of the camera drivers and would need these to be excluded from the build. <br>
<code>
make clean<br>
./configure --prefix=/usr/local/ppc CC="gcc-4.0" CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc" CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch ppc" CXX="g++-4.0" --enable-static --host=ppc-darwin --with-libexif=no --without-libiconv-prefix --without-libintl-prefix LIBLTDL=/usr/local/ppc/libltdl.a LIBUSB_LIBS="/usr/local/ppc/lib/libusb.a -framework IOKit -framework CoreFoundation" LIBUSB_CFLAGS=-I/usr/local/ppc/include LIBLTDL=/usr/local/ppc/lib/libltdl.a PKG_CONFIG_LIBDIR="/usr/local/ppc/lib/pkgconfig/"<br>

make<br>
sudo make install<br>
make clean<br>
./configure --prefix=/usr/local/x86_64 CC="gcc-4.2" CFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64" CXXFLAGS="-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64" CXX="g++-4.2" --enable-static --with-libexif=no --without-libiconv-prefix --without-libintl-prefix LIBUSB_LIBS="/usr/local/x86_64/lib/libusb.a -framework IOKit -framework CoreFoundation" LIBLTDL=/usr/local/x86_64/lib/libltdl.a LIBUSB_CFLAGS=-I/usr/local/x86_64/include PKG_CONFIG_LIBDIR="/usr/local/x86_64/lib/pkgconfig/"
<br>
make clean<br>
make<br>
sudo make install<br>
./configure --prefix=/usr/local/i386 CC="gcc-4.0" CFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386" CXXFLAGS="-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386" CXX="g++-4.0" --enable-static  --with-libexif=no --without-libiconv-prefix --without-libintl-prefix LIBUSB_LIBS="/usr/local/i386/lib/libusb.a -framework IOKit -framework CoreFoundation"  LIBUSB_CFLAGS=-I/usr/local/i386/include LIBLTDL=/usr/local/i386/lib/libltdl.a PKG_CONFIG_LIBDIR="/usr/local/i386/lib/pkgconfig/" 
<br>
make<br>
sudo make install<br>

'''Cross-compiling libbzip2 (useful for OpenCV) for three platforms:'''
Download the source from [http://www.bzip.org/ bzip.org]<br>
Edit the Make file:<br>
CC=gcc-4.0<br>
CFLAGS=-g -O2 -mmacosx-version-min=10.4 -isysroot /Developer/SDKs/MacOSX10.4u.sdk -arch i386 -Wall -Winline $(BIGFILES)<br>
make<br>
sudo make install PREFIX=/usr/local/i386<br>
make clean<br>
<br>
Edit the Make file for x86_64:<br>
CC=gcc-4.2<br>
CFLAGS=-g -O2 -mmacosx-version-min=10.5 -isysroot /Developer/SDKs/MacOSX10.5.sdk -arch x86_64 -Wall -Winline $(BIGFILES)<br>
make<br>
sudo make install PREFIX=/usr/local/x86_64<br>
make clean<br>
<br>


'''Building OpenCV:'''
General instructions can be found on the [http://opencv.willowgarage.com/wiki/InstallGuide openCV] site.<br>
In a freshly downloaded OpenCV source, run:<br>
mkdir buildi386<br>
cd buildi386<br>
CC=gcc-4.0 CXX=g++-4.0 cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local/i386 -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBZIP2_LIBRARIES=/usr/local/i386/libbzip2.a -DWITH_OPENCL=OFF -DBUILD_NEW_PYTHON_SUPPORT=OFF -DWITH_JASPER=OFF -DWITH_JPEG=OFF -DWITH_PNG=OFF -DWITH_TIFF=OFF -DWITH_OPENEXR=OFF -DCMAKE_OSX_ARCHITECTURES=i386 -G "Unix Makefiles" ..
<br>
make<br>
sudo make install<br>
cd ..<br>
mkdir buildx86_64<br>
cd buildx86_64<br>
cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr/local/x86_64 -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DWITH_OPENCL=OFF -DBUILD_NEW_PYTHON_SUPPORT=OFF -DCMAKE_OSX_ARCHITECTURES=x86_64 -DWITH_JASPER=OFF -DWITH_JPEG=OFF -DWITH_PNG=OFF -DWITH_TIFF=OFF -DWITH_OPENEXR=OFF -G "Unix Makefiles" ..<br>
make<br>
sudo make install<br>
