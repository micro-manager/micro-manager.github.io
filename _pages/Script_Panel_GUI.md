Micro-Manager has build-in scripting capabilities.  Scripts are written in [http://www.beanshell.org/ Beanshell], which is an interpreted language with a syntax very similar to Java. 

More recently, the same functionality and more has been exposed through a Python interface (see [https://github.com/micro-manager/pycro-manager Pycro-manager]). 

Tutorials for scripting in Beanshell and pycro-manager can be found [https://nicost.github.io/I2K-MM/ here].

Scripts are edited and run from the ScriptPanel (in the Tools menu):

[[Image:ScriptPanel.png]]

Scripts (files) can be added to the Script-Button Panel.  They can be run with the 'Run' button or by double-clicking the script name.  The latter method will run the script as it is saved in the filesystem, i.e., changes made in the editor will not be run (use the right-most run button for that purpose).  This allows you to edit scripts in an external editor but still conveniently run them within Micro-Manager.

Single lines of script can be executed in lower right panel, which is an interactive Beanshell interpreter (a read-evaluate-print loop).  The Beanshell interpreter has a history: use the up and down arrows to scroll through the executed Beanshell lines.

The editor pane contains an editor with syntax color highlighting and copy-paste capabilities.

Scripts have access to three Micro-Manager specific objects: the Micro-Manager Core (mmc), the Micro-Manager GUI (gui), and the Micro-Manager Acquisition Engine (acq).  The [https://valelab.ucsf.edu/~MM/doc/mmcorej/mmcorej/CMMCore.html mmc object] allows for relatively low level access to Micro-Manager functionality, whereas the [https://valelab.ucsf.edu/~MM/doc/mmstudio/org/micromanager/api/ScriptInterface.html gui object] makes it easy to accomplish more complicated tasks. A number of [[Example Beanshell scripts]] is available.

An extensive user's guide for Beanshell is [http://beanshell.org/manual/bshmanual.html#Table_of_Contents available on the Beanshell website.]

A few additional commands have been added to the Beanshell environment in Micro-Manager to make scripting more efficient:

<pre>
  doc(x);     // Get javadocs API for class or object x
  inspect(x); // Look at member methods and fields of object x
</pre>

A very handy Beanshell function is:
<pre>
  unset("y"); // Removes the function "y" from the current namespace
</pre>

{{Programming_Sidebar}}
