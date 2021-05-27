'''WARNING: This is underdevelopment and should only be considered alpha (pre-beta).'''
'''USE AT OWN RISK'''
== Summary ==
<table>
<tr><td valign=top>'''Summary:'''</td><td>3D Deconvolution</td></tr>
<tr><td valign=top>'''Authors:'''</td><td>Karl Bellv&eacute; and Kevin Fogarty</td></tr>
<tr><td valign=top>'''Maintainers:'''</td><td>Karl Bellv&eacute;</td></tr>
<tr><td valign=top>'''License:'''</td><td>None</td></tr> 
<tr><td valign=top>'''Platforms:'''</td><td>Linux</td></tr>
</table>

== Description ==
<math>
\Phi \left ( f \right ) = \sum_{i=1}^{n}\left | g-h * f \right |^{2} + \alpha \cdot \left | f \right |^{2}
</math>

The algorithm is a constrained, iterative approach for solving the L2 regularization of an ill-posed  problem to determine the positive fluorescence distribution that minimizes the equation where g is the observed  3-D fluorescence data, f is the underlying 3-dimensional fluorescence distribution, h is the 3-D point-spread function and * denotes convolution. Thus, the algorithm finds the fluorescence distribution that minimizes a weighted combination of the least-squares fit to the observed data (the total squared residuals) and the total squared intensity of the distribution (a measure of "smoothness"), with α the weighting factor that determines the smoothness of the resulting distribution. The software implements an iterative conjugate-gradient  method to minimize a related function that has the same minimum, is strictly convex, and is twice differentiable, and the method is guaranteed to converge (Carrington, et al., 1995). Convergence is assumed when the (normalized) first derivative is "small" and the algorithm automatically stops. 

== EPR Library ==
EPR Library (libepr.so.0.0) does the actual 3D deconvolution. A java JNI class, restoreImage.java, is provided to access the library. EPR Library is freely available for those in academia, as long as the library is only used with &micro;Manager. If you need to use the EPR library under other terms, please contact the Biomedical Imaging Group at the University of Massachusetts.

=== EPR Library Key ===
You must obtain a key to use the EPR Library. The key is generated from a submitted email address. This is similar to &micro;Manager's request for an email address when you first use the program. This allows tracking the usage of the EPR Library for grant progress reports. 

=== EPR Library Expiration ===
The EPR Library will expire approximately 90 days after it is compiled. This will only be in place during the testing period.

== Requirements ==
* Linux x86_64
* CUDA capable Graphic Card > 1.1
* EPR Library (libepr.so.0.0)
** Obtain this from the Biomedical Imaging Group
* Big.jar
** This is included in the normal &micro;Manager distribution
* License Key
** Obtain this from the Biomedical Imaging Group.

== Example BSH Script ==
The script below is designed to do a 3D Restoration on an open image window that contains a single channel with multiple time points. It needs a License key to be functional as well.

The script also includes the I2I class. It is an internal image format from the Biomedical Imaging Group. It is used to move stacks of 2D data from &micro;Manager to 3D data used by the EPR Library.

The script needs to be modified for your use. It currently loads a PSF that is in the I2I format. The script can be modified to use a &micro;Manager image for the PSF.
<pre>
////////////////////////////////////////////////////////////////////////////////////////////////
//
// Karl Bellve
// Biomedical Imaging Group
// University of Massachusetts Medical School
// Karl.Bellve@umassmed.edu
//
////////////////////////////////////////////////////////////////////////////////////////////////
import edu.umassmed.big.I2I;
import edu.umassmed.big.restoreImage;
import ij.IJ;
import ij.gui.*;
import java.awt.*; 

////////////////////////////////////////////////////////////////////////////////////////////////
// 
// User Setable Parameters 
//
//
////////////////////////////////////////////////////////////////////////////////////////////////

// EPR license key
String key = "";

// file and directory locations;
String psfName = "psf.i2i";
String resultName = "image-restored";

String psfDirName = "<insert location of PSF>";
String resultDirName = "<insert location to put 3D deconvolved image>";

// Restoration settings
float nAlpha = 0.001;
float nConvergence = 0.001;	
float nScale = 1;
int   nMax_Iterations = 20;
int   nChannel = 0;

// The following two arrays must have size nrChannels

String [] channelName = new String [] {"491","561","660"};
Color [] channelColor = new Color [] {Color.GREEN,Color.RED,Color.BLUE};
nrChannels = channelName.length;
////////////////////////////////////////////////////////////////////////////////////////////////
// Do not edit below this line
////////////////////////////////////////////////////////////////////////////////////////////////

// clear all previous acquisitions
gui.closeAllAcquisitions();
gui.clearMessageWindow();

win = IJ.getImage().getWindow();
nType = 1; //0 = 8 Gray, 1 = 16 gray, 2 = 32 Gray
if (nType != win.getImagePlus().GRAY16) {
	print("Sorry, only working on 16 bit gray images now");
	return;
}

nBytes = 2;
if (nType == 0) nBytes = 1;
if (nType == 1) nBytes = 2;
if (nType == 2) nBytes = 4;

long nWidth = win.getImagePlus().getWidth();
long nHeight = win.getImagePlus().getHeight();
long nChannels = win.getImagePlus().getNChannels();
long nSlices = win.getImagePlus().getNSlices();
long nFrames = win.getImagePlus().getNFrames();
long nType = win.getImagePlus().getType();
long nSize = win.getImagePlus().getStack().getSize();
long nStackSize = win.getImagePlus().getStackSize();
long nImageStackSize = win.getImagePlus().getImageStackSize();

int columns = 15;

GenericDialog dialog = new GenericDialog("3D Deconvolution, Karl Bellve, Biomedical Imaging Group");
dialog.addStringField("resultName:",resultName,columns);
dialog.addStringField("psfName:",psfName,columns);
dialog.addNumericField("Channel:",nChannel,0,columns,"");
//dialog.addSlider("Channel",1,nChannels,1);
dialog.addNumericField("Alpha:",nAlpha,5,columns,"");
dialog.addNumericField("Convergence:",nConvergence,5,columns,"");
dialog.addNumericField("Scale:",nScale,2,columns,"");
dialog.addNumericField("Iterations:",nMax_Iterations,0,columns,"");
dialog.setOKLabel("Execute");
dialog.showDialog();

if (dialog.wasCanceled()) return;

String resultName = dialog.getNextString();
String psfName = dialog.getNextString();
int    nChannel = dialog.getNextNumber();
float  nAlpha = dialog.getNextNumber();
float  nConvergence = dialog.getNextNumber();
float  nScale = dialog.getNextNumber();
int    nMax_Iterations = (int)dialog.getNextNumber();

if (nChannel < 0) {
	print("Please pick a channel between 0 and " + nChannels-1);
	return;
}
if (nChannel > (int)(nChannels -1)) {
	print("Please pick a channel between 0 and " + nChannels-1);
	return;
}

print("Height:   " + nHeight);
print("Width:    " + nWidth);
print("Slices:   " + nSlices);
print("Channels: " + nChannels);
print("Frames:   " + nFrames);
print("Type:     " + nType);
print("Size:     " + nSize);
print("SSize:    " + nStackSize);
print("ISSize:   " + nImageStackSize);

// Window to put restored image in. 
gui.openAcquisition(resultName, resultDirName, (int)nFrames, (int)nChannels, (int)nSlices);

//
// i2i class to hold and create images
//
	
i2iPSF = new I2I(psfDirName + psfName);
i2iImage = new I2I((int)nWidth,(int)nHeight,(int)nSlices);
i2iResult = new I2I((int)nWidth,(int)nHeight,(int)nSlices);

//
// End i2i
//

restoration = new restoreImage(key,1);  // Use Cuda device 1
ImageStack = win.getImagePlus().getImageStack();

gui.initializeAcquisition(resultName, (int) nWidth, (int) nHeight, (int) nBytes);

for (frame=0; frame < nFrames; frame++) {
	for (channel=0; channel < nChannels; channel++) {
  		now = System.currentTimeMillis();
		// order appears to be Channel,Slice,Frame

		slice = 0;
		while (slice < nSlices) {
			//int position = (frame * nSlices) + slice + channel + 1;
			int position = (0 * nSlices) + slice + channel + 1;
			print ("Position: " + position + " Slice: " + slice);
			short[] img = ImageStack.getPixels(position); // 1 indexed
			i2iImage.addUImage(img,slice);  // 0 indexed
	   	slice++;
	   }
		print("Starting Restoration for frame: " + frame + " channel: " + nChannel);

		restoration.setDebug(3);
		// Image must be set to restoration library first
		restoration.setImage(i2iImage.getImage(),i2iImage.getX(),i2iImage.getY(),i2iImage.getZ());
		// PSF must be set to restoration library second
		restoration.setPSF(i2iPSF.getImage(),i2iPSF.getX(),i2iPSF.getY(),i2iPSF.getZ());
		// Executing restoration
		restoration.execute(i2iResult.getImage(),nAlpha,nConvergence,nScale,nMax_Iterations);
  		// Saving restored image
  		//i2iResult.saveImage(resultDirName +"/" + resultName + "_" + frame +".i2i");

		// add restore image to new GUI window	
		slice = 0;
		while (slice < nSlices) {
			img = i2iResult.getImage2D(slice); // 0 indexed
			print ("Frame: " + frame + " Channel: " + channel + " Slice: " + slice);
			gui.addImage(resultName, img, frame, channel, slice); // 0 indexed
			slice++;
		}
	}
}

// tell garbarge collection to remove the trash
restoration = null; 
print ("Finished");
</pre>
--[[User:Kdb|Karl Bellve, Biomedical Imaging Group, University of Massachusetts]] 10:36, 22 April 2011 (PDT)
