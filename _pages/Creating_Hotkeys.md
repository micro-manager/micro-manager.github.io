µManager has the ability to create customized hotkeys that can perform any action or set of actions that you create a script for. This page describes the process for setting up a new hotkey.

<ol>
<li>Go to the Tools menu and select "Script Panel" to bring up the Beanshell scripting panel. From here you can create, modify, and run scripts as described [https://micro-manager.org/wiki/Script_Panel_GUI on this page].

<li>Create a script that does what you want, and save it to a file. In this screenshot, we have created a script "exposure.bsh" that sets the exposure time to 50ms, and then refreshes the GUI so it shows the new exposure time.

[[File:Hotkey1.png]]

<li>In the upper-left corner of the scripting panel, click the "Add" button. This will add the script to the list of scripts that can be used for shortcuts.

[[File:Hotkey2.png]]

<li>Go to the Tools menu and select "Shortcuts" to bring up the hotkeys menu.

[[File:Hotkey3.png]]

<li>Click the "Add" button. This will add a new row that, by default, has an action of "Snap" and a corresponding command key of "space". Click on the space icon; it should turn red. Hit 1, to change the hotkey to trigger when you type 1. Click on "Snap" and a menu will come up; at the bottom should be our exposure.bsh script. Select it.

[[File:Hotkey4.png]]

<li>Close the hotkeys dialog. Now, whenever you type 1 in the program and you aren't modifying a text field, the exposure time will be set to 50ms.
</ol>
