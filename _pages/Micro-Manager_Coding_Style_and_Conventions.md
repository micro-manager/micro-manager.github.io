==Micro-Manager Coding Style==

'''Formatting and style'''

* All indents are 3 spaces (no tab characters).
* Curly braces open in the same line in Java and in a new line in C++ (see examples).
* Class names begin with uppercase, and with each word capitalized, e.g. <code>MyFirstClass</code>.
* Function names use the same convention except that in Java they begin with lowercase and in C++ with uppercase, e.g. <code>MyFunc()</code> in C++ and <code>myFunc()</code> in Java.
* All variables begin with lower case, e.g. <code>myVar</code>.
* Class member variables begin with lowercase and end with underscore, e.g. <code>memberVar_</code>.
* Do not use <code>this->memberVar_</code> idiom unless it is absolutely necessary to avoid confusion.
* Static constants in C++: <code>const char* const g_Keyword_Description</code>.
* Static constants in Java: <code>static final String METADATA_FILE_NAME</code>.
* <code>if/else</code>, <code>for</code>, and <code>while</code> statements should include curly braces, even if they are only followed by a single line.
* For Java code, follow the [http://geosoft.no/development/javastyle.html#Recommendation Java style recommendations at Geosoft].

'''Comments, headers, etc…'''

* Function/class headers use documentation JavaDoc convention (see examples).
* The code should be clear and self explanatory.
* Use comments to explain algorithms and anything that is not self evident.
* Function headers should explain the “contract” with the caller if it is not totally clear from the function signature (parameters). In general all public methods should have headers.
* Use common sense and avoid unnecessary headers and comments for code that is obvious.
* In general, do not enter revision history comments in the source code, nor in the file header. They impair readability and break the visual flow.


'''Revision/change tracking'''

* Only the latest version matters. Keep the code elegant and simple (both visually and functionally).
* Use source code control to retain the revision history in the particular file, i.e. check in the SVN often and each time enter the revision history comment.
* Work incrementally. Make small changes and make sure the code compiles. Check-in after every major step to retain revision history.
* If there is a danger of destabilizing the main application, open a branch and work in it for a while, but still check in at least once each day.

==Micro-Manager Coding Conventions==

===Exceptions in mmstudio===
<code>org.micromanager.utils.ReportingUtils</code> is a static Java class that contains methods to simplify reporting Java errors and exceptions to the user and logging them in the CoreLog. The class methods <code>ReportingUtils.showError(...)</code> or <code>ReportingUtils.logError(...)</code> should be used in catch blocks. <code>ReportingUtils.showError(...)</code> is useful for infrequent exceptions, while <code>ReportingUtils.logError(...)</code> should be used in loops so that the user is not force to acknowledge a whole series of errors.

You can automate generation of such catch blocks in Eclipse by going to:
 Preferences > Java > Code Templates > Code > Catch block body > Edit...
and change the Pattern to:
 // ${todo} Auto-generated catch block
 ReportingUtils.showError(${exception_var});

{{Programming_Sidebar}}
