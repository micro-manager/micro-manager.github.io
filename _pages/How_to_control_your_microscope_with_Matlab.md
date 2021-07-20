<span>'''Roy Wollman, September 2, 2006 (revised November 28, 2006)'''</span><br /><br /><br /> To control the microscope from Matlab, using Micro-Manager API, there are two options: <br />

# DIY (do it yourself)
# The microscopy toolbox for Matlab (see below)

<br />

== DIY ==

Matlab has an extensive Java support which makes things easy, just do the following:

# Install Micro-Manager in a path without any spaces.
# Add the path with the drivers (all the .dll files) to the windows PATH enviromental variable.
# In command prompt<br /><big><span><font face="monospace"> >> edit classpath.txt</font></span> </big><br/> Add the location of the jar file you just installed (its in the Micro-Manager folder), include the .jar at the end. 
# In command prompt<br /><big><span><font face="monospace"> >> edit librarypath.txt </font></span></big><br /> Add the location of the dll files.
# Restart Matlab
# Create a java object of class MMCore:<br /><pre>mmc = MMCore;</pre>

That's it. Now you can call all the Micro-Manager methods through that object. <br /><br /> For more extensive interface between Matlab and Micro-Manager, please take a look at the Microscopy toolbox.

== Microscopy toolbox for Matlab ==

The microscopy toolbox is an extension / interface to &mu;Manager written in Matlab. Its ultimate goal is to create "intelligent" microscopes that will combine analysis and acquisitions thus creating true Roboscopes (for more propaganda, see link below). Matlab has strong capabilities and an extensive code base for image analysis and computer vision. The integration between Matlab and Î¼Manager will bring image analysis and acquisition together and is an important step toward Roboscopes. The short terms goal of the Microscopy toolbox for Matlab is to create a tool that will make this integration easy and simple. <br /><br /> For more details please read the howto / manifest below. The project is at its early stages and the code is not mature enough for release, once we'll have the basics going we'll set up a sourceforge project and make everything available. If you want to get involved in this project, please contact Roy Wollman: rwollman at ucdavis dot edu<br /><br />[http://www.mcb.ucdavis.edu/faculty-labs/scholey/Roy/Roboscope.html The Microscopy Toolbox for Matlab homepage]<br /><br />
