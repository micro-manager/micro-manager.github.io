==Introduction==
This plugin uses Gaussian fitting to localize single fluorescent molecules for  tracking or reconstruction of super-resolution images. One window is used to set parameters for fitting and tracking, the second window (which can be opened from the first using the 'Data' button) is used to perform operations (such as rendering, drift correction, etc.) on data-sets of fitting results.

==Getting Started==
<table cellspacing=30><tr  valign=top><td>
[[Image: Main_LMPlugin.PNG]]</td>
<td><br><br>
To track a spot of interest in a time-series, draw a box around the spot and press the 'Track' button.  After a short while, a row will appear in the '''Gaussian tracking data Window'''.  Select the row and press '''Plot''' to visualize  movement of the spot in the x direction.


To obtain a super-resolution image, acquire images using a square ROI with a size that is a power of 2 (256x256 often works best).  Acquire a large data series of your blinking molecules (use the '''show''' button to get a feel for the number of spots that can be detected in your data).  Press '''Fit''' to find spots and fit Gaussians to them.  After a while, a row will appear in the  '''Gaussian tracking data Window'''.  Selected the row.  Make sure the drop-down box in the Localization Microscopy section is set to 8x.  Press '''Render'''.
</td>
</table>

==Localization Microscope Window (first window)==

__NOTOC__
<table cellspacing=15><tr  valign=top><td>
[[Image: Image-Prams.JPG]]</td>
<td>'''Imaging Parameters:'''<br> 
Values entered in this section will be used in subsequent calculations.  Press the '''read''' button to deduce some of these values from the meta-data contained in Micro-Manager datasets.  You will need to measure the [[Photon-conversion factor (pcf)]] or use the pcf provided on the camera data-sheet.  If you do not use EM gain, enter '1' in the field '''linear EM gain''' (to calculate the number of photons, digital numbers will be multiplied by pcf / linear EM gain.  The '''Camera Offset''' (in digital numbers) is the average of an exposure in which no light can reach the camera.  The program uses this to calculate the actual number of photons detected in signal and background.
</td>
</table>

<table cellspacing=15><tr valign=top><td>
[[Image: Max-settings.JPG]]</td>
<td>'''Finding Maxima'''
To find spots, the application searches the image using a box with the size given in the Fit Parameters section.  The minimum difference (in digital numbers) between the center pixel and the average of the four corner pixels should be at least the value of the '''Noise tolerance''' field for a putative spot to qualify.  The image can optionally be '''pre-filtered''' by obtaining the difference image of a Gaussian filter with a width equal to the pixel size and a Gaussian filter 5 times the pixel size.  However, such pref-filtering rarely helps and will slow down calculations. The '''show''' button will show on the frontmost window what objects will be recognized as spots.
</td>
</table>

<table cellspacing=15><tr valign=top><td>
[[Image: Fit-prams.JPG]]</td>
<td>'''Fitting Parameters'''
'''Dimensions:''' Determines the model used for the Gaussian.  1 - results in symmetric Gaussian in which only the width can vary, 2 - elliptical Gaussian, 3 - elliptical Gaussian in which the angle (theta) of the blob can vary.  See [http://en.wikipedia.org/wiki/Gaussian_function Wikipedia article on Gaussian] for details. <br> 
'''Fitter:''' Use either the [http://en.wikipedia.org/wiki/Simplex_algorithm Simplex] or [http://en.wikipedia.org/wiki/Levenberg%E2%80%93Marquardt_algorithm  Levenberg-Marquardt] fitter.  Levenberg Marquardt needs many fewer iterations to converge and is generally faster. <br>
'''Max Iterations:''' Try 1000 for Simplex Fitter and 50 for Levenberg-Marquardt.  Nicely shaped spots will converge much faster (especially using the LM fitter), so setting this number low will avoid spending many cpu cycles on poorly shaped spots.<br>
'''Box Size (pixels):''' This number will be rounded to the next higher odd number.  It is used in both the spot finding and Gaussian fitting.  Keeping it small (equivalent of about 4 times resolution of the microscope, i.e. about 800 nm total when using a 100x 1.4na objective) will speed up analysis considerably.
</td>
</table>

<table cellspacing=15><tr valign=top><td>
[[Image: Filter-data.JPG]]</td>
<td>'''Filtering Data''' <br>
Filtering data can greatly reduce the number of useless spots appearing in your results.  For instance, diffraction limited spots often have a size between 200 and 400nm, so checking the '''Width''' checkbox and filling in appropriate numbers for minimum and maximum will often exclude poorly fit data.  Tracks are usually finished when no spot is found in the local neighborhood in a given frame.  By checking the '''End track''' checkbox and entering a number of frames, the code will continue to search in consecutive frames for a qualifying spot.  
</td>
</table>

<table cellspacing=15><td>
[[Image: Data-processing.JPG]]</td>
<td> '''Data Processing''' <br>
The '''Fit''' button will start Gaussian fitting of all maxima found in the image stack (i.e., in all frames and all channels).  Fitting will happen only on the active ROI (or the whole image if no ROI is active).  To '''Track''', draw a ROI around the particle to be tracked.  The '''MTrack''' button will find all Maxima in the current ROI and track each one by one.  Tracking will only take place in the current channel.  Results from the '''Fit''', '''Track''' and '''MTrack''' activities will be shown in the '''Data''' window.  The '''Data''' window can also be opened using the '''Data''' button.  The '''Stop''' button can be used to interrupt ongoing fitting activities.  
</td>
</table>

==Data processing window==
Results from the Gaussian fits appear in the Data window, with one row per data set.  The data set will have a name (in the '''Image''' column) that can be changed.  The total number of spots identified (or the total number of frames with a spot for a track) will be shown.  Tracks will also show the standard deviation of X and Y positions as well as the total number of photons measured.


[[Image: DataProc_LMPlugin.PNG]]

<table cellspacing=15><td>
[[Image: DataProc_general.png]]</td>
<td> '''General Options''' <br>
Data can be saved in binary or text mode using the '''Save''' button.  The binary form is called 'Tagged Spot Format (TSF)' and is based on the Google Protocl Format.  A full description of the TSF format can be found here: [[Tagged_Spot_File_(tsf)_format]]

Previously saved data can be loaded using the '''Load''' button.  For text data to be recognized, they should resemble the text format saved by the application.  TSF files can be opened, as well as the fitted data saved by the Nikon software.  The '''Remove''' button will remove the selected row(s) from the table (saved data on disk will not be deleted).  The '''Show''' button wil open a window with a table showing the fitted data (including the X, Y, and possibly Z location at each frame and channel, as well as information about spot width, and calculated number of photons detected).  If the data set is large, it can take a long time for this window to open and it can take a large amount of RAM.  The '''Info''' button will show some information about  the data set (orginal image it was derived from, box size, original image size, pixel size, etc..).  

</td>
</table>

<table cellspacing=15><td>
[[Image: DataProc_2-color.png]]</td>
<td> '''2-Color Single Molecule''' <br>

</td>
</table>

<table cellspacing=15><td>
[[Image: DataProc_tracks.png]]</td>
<td> '''Processing Tracking Data''' <br>

</td>
</table>

<table cellspacing=15><td>
[[Image: DataProc_reconstruction.png]]</td>
<td> '''Localization Microscopy''' <br>

</td>
</table>


{{Documentation Sidebar}}
