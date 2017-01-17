== Description of  tagged spot file format (.tsf) ==

Nico Stuurman, April 3, 2013.

The goal of the tagged post file format is to provide an efficient data format for superresolution microscopy data that generate images by locating the position of single fluorescent emitters.  Two formats exists, a binary format (using Google protocol buffers, syntax v2) and a text format.  An application is free to support only one or the other, but is encouraged to support both.

=== Binary format. ===
  

The binary format relies on Google Protocol buffers ([http://code.google.com/apis/protocolbuffers/]) to encode data. Two message types are defined, “SpotList”, which contains metadata concerning the dataset, and “Spot”, which contains the per-spot data.  For convenience, a copy of the proto file describing these messages is included at the bottom of the document, however, the authoritative version resides at: [https://github.com/nicost/TSFProto].

Note that you can extend the TSF.proto file yourself and add fields that you need for your specific application.  The file created with your proto file can still be read by all other software that reads the tagged spot file format (although it will not be able to interpret the fields that you added).  

File offsets are of type signed int or signed long (to ensure compatibility with Java code) and are encoded as big endian.

=== File layout on disk: ===

'''int magic (4 bytes)''' - must be 0 (this is for compatibility with older versions of the tsf format)

'''long SpotList offset (8 bytes)''' - offset in bytes to SpotList message (note, this is the offset from the beginning of the file minus 12 bytes).

As many copies of the message “Spot” as desired, where

'''varint length''' - Size of the Spot message in a Google Protocol buffer defined varint

'''Spot message'''

The Spot messages are followed by the SpotList message:

'''varint length''' - Size of SpotList message in a Google Protocol buffer defined varint

'''SpotList message'''

The reason for putting the SpotList message at the end is that this makes it possible to write all the Spot data first and then include in the SpotList the number of Spots that have been written.  Code that reads the file can first read the SpotList (using the SpotList offset) and will then know how many Spot messages to expect.  Note that it is not necessary to know this number in advance, one can simply parse Spot messages until no more new ones are found.


===  Building and/or using the code ===

To use the tsf format in your own code, you need Java or C++ source code to work with the tsf format.  This source code is created by the Google Protocol Buffers binary based on the TSF.proto file.  You can create this source code yourself by downloading and installing Google Protocol Buffers and compiling the the TSF.proto file.  To do so, I use the following script (Mac OS X shell script):

<code>
protoc -I=src/ --java_out=build src/TSFProto.proto
javac -sourcepath build -classpath dist/gproto.jar build/edu/ucsf/tsf/TaggedSpotsProtos.java
jar cf dist/TSFProto.jar -C build .
protoc -I=src/ --cpp_out=buildcpp src/TSFProto.proto
g++ -c buildcpp/TSFProto.pb.cc -o buildcpp/libTSFProto.o
ar cru buildcpp/libTSFPProto.a buildcpp/TSFProto.o /usr/local/lib/libprotobuf.a</code>

Alternatively, you can download and install the source code that I build.  It resides in a git repository at: [https://github.com/nicost/TSFProto].  The Java source code is in directory “build”, the C++ source code in directory “buildcpp”.

If you code in C++, you can save a lot of time by making use of the class TSFUtils, which is part of the source code of the example application [https://github.com/nicost/TSFProto/tree/master/tsfutil tsftrans].  The example command line application tsftrans can read and write tsf files in both binary and text formats and is an easy tool to convert between the two.

The following (pseudo Java) code shows how you can read in a file in TSF format:

<code>
        FileInputStream fi = new FileInputStream(selectedFile);
        DataInputStream di = new DataInputStream(fi);

        // the file has an initial 0, then the offset (as long)
        // to the position of spotList
        int magic = di.readInt();
        long offset = di.readLong();
        fi.skip(offset);
        edu.ucsf.tsf.TaggedSpotsProtos.SpotList psl = SpotList.parseDelimitedFrom(fi);
        fi.close();


        // psl contains the header information
        // the following code shows examples how to use it   

        String name = psl.getName();
        int width = psl.getNrPixelsX();
        int height = psl.getNrPixelsY();
        float pixelSizeUm = psl.getPixelSize();
        long totalSpots = psl.getNrSpots();
        long maxNrSpots = 0;

        // now read the messages that contain the spot data
        // Re-open the stream

        fi = new FileInputStream(selectedFile);
        fi.skip(12); // size of int + size of long

        // simple example of reading Spot messages.
        // One could also store the Spots as an Array or List
        // and access the Spot data directly in the code (i.e., use
        // the Spot message as a native data structure

        edu.ucsf.tsf.TaggedSpotsProtos.SpotSpot pSpot;

        while (fi.available() > 0 && (expectedSpots == 0 || totalSpots < expectedSpots)) {

             pSpot = Spot.parseDelimitedFrom(fi);
             double x = pSpot.getXPosition();
             double y = pSpot.getYposition();
             double in = pSpot.getIntensity();
             if (pSpot.hasZ()) {
                 double zc = getZ();            
             }

             totalSpots++;
        }
        fi.close();
</code>


=== Reading and writing files from Matlab ===

To be written...


=== Text format ===

The text version of the Tagged Spot format is modeled closely after the binary format.  The first line of the file (terminated with a newline “\n” symbol) contains the Summary metadata (the SpotList message in the binary format).  It contains Key-Value pairs (separated by “: “) where the keys are defined in the TSF.proto file SpotList description, and the values are given in asci representation.  The Key-Value pairs are separated by the tab (“\t”) sign.

The second line of the file contains the Keys of the Spot message for the Spot data that follow.  The allowed names for the Keys are defined in the TSF.proto file Spot message definition.  Keys are separated by tabs (“\t”), and the line ends with a newline (“\n”) symbol.

All following lines are Spot data in asci format separated by tabs (“\t”) and each Spot is on its own line (that ends with “\n”).

== TSF.proto file: ==


<code>
package TSF;

option java_package = "edu.ucsf.tsf";
option java_outer_classname = "TaggedSpotsProtos";

enum FitMode {
   ONEAXIS = 0;
   TWOAXIS = 1;
   TWOAXISANDTHETA = 2;
}

enum ThetaUnits {
   DEGREES = 0;
   RADIANS = 1;
}

enum IntensityUnits {
   COUNTS = 0;
   PHOTONS = 1;
}

enum LocationUnits {
   NM = 0;
   UM = 1;
   PIXELS = 2;
}

message FluorophoreType {
   required int32 id = 1; // Key for Spot.fluorophore_type.
   optional string description = 2;
   optional bool is_fiducial = 3;
}

// ROI in pixels, should be consistent with nr pixels given in SpotList
message ROI {
   required int32 x = 1;
   required int32 y = 2;
   required int32 x_width = 3;
   required int32 y_width = 4;
}

message SpotList {
   // UID for the application that generated these data
   // Request a UID from nico at cmp.ucsf.edu or use 1 
   required int32 application_id = 1 [default = 1];

   optional string name = 2; // name identifying the original dataset 
   optional string filepath = 3; // path to the image data used to generate these spot data
   optional int64 uid = 4; // Unique ID, can be used by application to link to original data
   optional int32 nr_pixels_x = 5; // nr pixels in x of original data
   optional int32 nr_pixels_y = 6; // nr pixels in y of original data
   optional float pixel_size = 7; // pixel size in nanometer
   optional int64 nr_spots = 8; // number of spots in this data set
   optional int32 box_size = 17; // size (in pixels) of rectangular box used in Gaussian fitting
   optional int32 nr_channels = 18; // Nr of channels in the original data set
   optional int32 nr_frames = 19; // Nr of frames in the original data set
   optional int32 nr_slices = 20; // Nr of slices in the original data set
   optional int32 nr_pos = 21; // Nr of positions in the original data set

   // Fluorophore type characterizations. If you use the fluorophore type field,
   // you must add a FluorophoreType message for each used id.
   repeated FluorophoreType fluorophore_types = 26;

   // If units will always be the same for all spots, then use these units tags,
   // otherwise use the unit tags with each spot
   optional LocationUnits location_units = 22;
   optional IntensityUnits intensity_units = 23; 
   optional ThetaUnits theta_units = 27;

   // If fitmode  will always be the same for all spots, then use this fitmode
   // otherwise use the fitmode with each spot
   optional FitMode fit_mode = 24;

   // flag indicating whether this is a sequence of spot data in consecutive 
   // time frames thought to originate from the same entity
   optional bool is_track = 25 [default = false]; 

   // The electron conversion factor (camera gain), defined as
   // # of electrons per pixel / # of counts per pixel
   // The ecf can be different for different channels (which can 
   // happen when separate cameras are used for seperate channels),
   // therefore provide the ecf for each channel in the channel order
   repeated double ecf = 28; 

   // The quantum efficiency can be used to calculate the number
   // of photons that hit the sensor, rather than the number of 
   // electrons that were derived from them
   // Since this number is wavelength dependent, provide the QE
   // for each channel (in the channel order)
   repeated double qe = 30;

   optional ROI roi = 29;


   // The followinf ids can be used in your own .proto derived from this one
   extensions 1500 to 2047;
      
}
   
message Spot {
   // Identifier for a physical molecule. Multiple localizations will be considered
   // to be generated by the same molecule if they share the same molecule ID.
   // Typically, a molecule generates up to one localization per frame.
   // If you don't implement tracking, assign a different molecule ID to
   // each localization.
   // The difference between molecules and clusters is that a cluster is a group
   // of physical molecules, e.g. a raft on a membrane. When you are tracking to
   // link your localizations, you're looking at a molecule, and when you're 
   // thresholding on the nearest neighbor distance, it's typically a cluster.
   // If you are using both cluster and molecule, localizations with the same
   // molecule ID should have the same cluster ID.
   // Molecule IDs must be globally unique across clusters. 
   required int32 molecule = 1;

   // Identifier for an input channel. Input channels represent different optical
   // paths, often with different spectral characteristics. For example, in a
   // biplane setup, you'd have two channels, one for each camera. Channels are
   // 1-based.
   // Please note that channels and fluorophore type are subtly different: channel
   // gives the *physical* excitation path (camera 1 or camera 2), while fluorophore
   // type gives the *fluorophore's* type (Cy5, Cy3, Tetraspeck). For example, for
   // biplane single-color 3D, you'd set the channel field if you emit separate
   // localizations for both channels, but never the type field. For biplane
   // two-color experiments, you'd set both channel and type if you fit in both
   // channels independently, and only types if your fitter combines information
   // for both channels. For spectrally separated measurements, channel and type
   // are usually identical, but for spectral unmixing, they may differ.
   required int32 channel = 2;

   // Frame number (image number). The frames of each channel are numbered
   // sequentially, starting from 1.
   required int32 frame = 3;

   // Z slice. If you are taking a series of images at different axial offsets,
   // you can tag the localizations from each respective slice with this 1-based
   // field. Please apply the offset between slices before saving to a TSF file:
   // z=100 with slice=1 is considered same position as z=100 with slice=2.
   optional int32 slice = 4;

   // Lateral position. If you are taking images at multiple x/y stage positions,
   // you can tag the localizations from each position with this 1-based field.
   // Positions are 1-based. Please apply the offset between positions before
   // saving the TSF file:
   // x=100 with pos=1 is considered same position as x=100 with pos=2.
   optional int32 pos = 5;

   // Fluorophore type. The number is 1-based. Please compare the note for
   // channel for the distinction between type and channel.
   optional int32 fluorophore_type = 19;

   // The identifier of the cluster that the localization belongs to, 1-based.
   // A cluster is a logical group of multiple physical molecules. Typical
   // examples are membrane rafts, 
   optional int32 cluster = 20;

   // xyz coordinates of the spot in location_units  
   // after fitting and optional correction
   optional LocationUnits location_units = 17;
   required float x = 7;
   required float y = 8;
   optional float z = 9;

   // Intensity values

   // Use intensity_units only if different from SpotList
   // integrated spot density. This can either be determined from a fit or 
   // using any other methods.  This number should be corrected for background
   optional IntensityUnits intensity_units = 18; 
   required float intensity = 10; // integrated spot density
   // Background around the spot. 
   // This can be determined through a fit or other methods
   // This number should not include the camera bias, i.e. it should be linearly
   // proportional to the number of photons in the background
   optional float background = 11;   

   // Peak shape parameters

   // Peak width at half height in location units
   // for asymetric peaks, calculate the width as the square root of the 
   // product of the widths of the long and short axes
   optional float width = 12; 
   // Shape of the peak: width of the long axis 
   // divided by width of the short axis
   optional float a = 13; 
   
   // Rotation of asymetric peak, only used 
   // when fitmode == TWOAXISANDTHETA
   optional float theta = 14; 

   // Original xyz coordinates from fitting before drift 
   // or other correction correction
   optional float x_original = 101;
   optional float y_original = 102;
   optional float z_original = 103;

   // localization precision
   optional float x_precision = 104;
   optional float y_precision = 105;
   optional float z_precision = 106;
 
   // position in the original image (in pixels) used for fitting
   optional int32 x_position = 107;
   optional int32 y_position = 108;

   // These ids can be used in your own .proto derived from this one
   extensions 1500 to 2047;

}



</code>



{{Documentation_Sidebar}}
