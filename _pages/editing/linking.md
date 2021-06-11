---
title: Linking
layout: page
section: Support:Editing the Wiki
nav-links: true
---

This page demonstrates how to link to certain special classes of external content.

## GitHub

### Examples

Use `path` to link to a file off the repository root:

{% capture github-path-code %}
{% raw %}{% include github path='WELCOME.md' %}{% endraw %}
{% endcapture %}
{% capture github-path-result %}
{% include github path='WELCOME.md' %}
{% endcapture %}
{% include code-example code=github-path-code result=github-path-result %}

Use `source` to link to a source file within the repository's
`src/main/java` subtree:

{% capture github-source-code %}
{% raw %}{% include github source='net/imagej/ImageJ.java' %}{% endraw %}
{% endcapture %}
{% capture github-source-result %}
{% include github source='net/imagej/ImageJ.java' %}
{% endcapture %}
{% include code-example code=github-source-code result=github-source-result %}

Use `org` and `repo` to link to a different repository than
`imagej/imagej`:

{% capture github-org-repo-code %}
{% raw %}{% include github org='fiji' repo='TrackMate' path='README.md' %}{% endraw %}
{% endcapture %}
{% capture github-org-repo-result %}
{% include github org='fiji' repo='TrackMate' path='README.md' %}
{% endcapture %}
{% include code-example code=github-org-repo-code result=github-org-repo-result %}

You can give just a `repo` (or just an `org`), and it will be used for
both `org` and `repo`:

{% capture github-org-repo-2-code %}
{% raw %}{% include github repo='fiji'
  path='plugins/Examples/Fiji_Cube.ijm' %}{% endraw %}
{% endcapture %}
{% capture github-org-repo-2-result %}
{% include github repo='fiji'
  path='plugins/Examples/Fiji_Cube.ijm' %}
{% endcapture %}
{% include code-example code=github-org-repo-2-code result=github-org-repo-2-result %}

If you give neither a `path` nor a `source` then it links to the
repository as a whole:

{% capture github-whole-repo-code %}
{% raw %}{% include github repo='fiji' %}{% endraw %}
{% endcapture %}
{% capture github-whole-repo-result %}
{% include github repo='fiji' %}  
{% endcapture %}
{% include code-example code=github-whole-repo-code result=github-whole-repo-result %}

Use `tag` to specify a tag (rather than `master`):

{% capture github-tag-code %}
{% raw %}{% include github tag='imagej-2.0.0-beta-7.9'
  path='app/src/test/java/imagej/debug/TypeHierarchy.java' %}{% endraw %}
{% endcapture %}
{% capture github-tag-result %}
{% include github tag='imagej-2.0.0-beta-7.9'
  path='app/src/test/java/imagej/debug/TypeHierarchy.java' %}  
{% endcapture %}
{% include code-example code=github-tag-code result=github-tag-result %}

Specifying `tag` alone links to the tag description:

{% capture github-tag-alone-code %}
{% raw %}{% include github tag='imagej-2.0.0-rc-44' %}{% endraw %}
{% endcapture %}
{% capture github-tag-alone-result %}
{% include github tag='imagej-2.0.0-rc-44' %}  
{% endcapture %}
{% include code-example code=github-tag-alone-code result=github-tag-alone-result %}

Use `commit` to specify a commit hash:  

{% capture github-commit-code %}
{% raw %}{% include github
  commit='7a10880d485a13fc449d84c7e2eca3e1481064ee'
  label='imagej@7a10880d' %}{% endraw %}
{% endcapture %}
{% capture github-commit-result %}
{% include github
  commit='7a10880d485a13fc449d84c7e2eca3e1481064ee'
  label='imagej@7a10880d' %}  
{% endcapture %}
{% include code-example code=github-commit-code result=github-commit-result %}

Use `issue` or `pr` to specify an issue or PR number:

{% capture github-issue-pr-code %}
{% raw %}{% include github issue='83' label='imagej#83' %}
or {% include github pr='88' label='imagej#88' %}{% endraw %}
{% endcapture %}
{% capture github-issue-pr-result %}
{% include github issue='83' label='imagej#83' %}
or {% include github pr='88' label='imagej#88' %}  
{% endcapture %}
{% include code-example code=github-issue-pr-code result=github-issue-pr-result %}

Use `label` to override the label:

{% capture github-label-code %}
{% raw %}{% include github repo='fiji'
  path='plugins/Examples/Fiji_Logo_3D.js'
  label='Fiji...in 3D!' %}{% endraw %}
{% endcapture %}
{% capture github-label-result %}
{% include github repo='fiji'
  path='plugins/Examples/Fiji_Logo_3D.js'
  label='Fiji...in 3D!' %}
{% endcapture %}
{% include code-example code=github-label-code result=github-label-result %}

## Wikipedia

{% capture wikipedia-code %}
Check out the
{% raw %}{% include wikipedia title="ImageJ" %}{% endraw %}
article on Wikipedia!
{% endcapture %}
{% capture wikipedia-result %}
Check out the
{% include wikipedia title="ImageJ" %}
article on Wikipedia!
{% endcapture %}
{% include code-example code=wikipedia-code result=wikipedia-result %}

## Maven

{% capture maven-code %}
The Maven artifact for ImageJ as a whole is
{% raw %}{% include maven g='net.imagej' a='imagej' v='2.0.0' %}{% endraw %}
{% endcapture %}
{% capture maven-result %}
The Maven artifact for ImageJ as a whole is
{% include maven g='net.imagej' a='imagej' v='2.0.0' %}
{% endcapture %}
{% include code-example code=maven-code result=maven-result %}

## Javadoc

### Examples

{% capture javadoc-project-code %}
{% raw %}See also the
{% include javadoc project="SciJava" %}
javadocs.{% endraw %}
{% endcapture %}
{% capture javadoc-project-result %}
See also the
{% include javadoc project="SciJava" %}
javadocs.
{% endcapture %}
{% include code-example code=javadoc-project-code result=javadoc-project-result %}

{% capture javadoc-class-code %}
See also the
{% raw %}{% include javadoc
  project="ImageJ1"
  package="ij.process"
  class="ImageProcessor" %}{% endraw %}
class.
{% endcapture %}
{% capture javadoc-class-result %}
See also the
{% include javadoc
  project="ImageJ1"
  package="ij.process"
  class="ImageProcessor" %}
class.
{% endcapture %}
{% include code-example code=javadoc-class-code result=javadoc-class-result %}

{% capture javadoc-anchor-code %}
See also the
{% raw %}{% include javadoc
  project="SciJava"
  package="org.scijava.module"
  class="ModuleService"
  anchor="getModules()" %}{% endraw %}
method.
{% endcapture %}
{% capture javadoc-anchor-result %}
See also the
{% include javadoc
  project="SciJava"
  package="org.scijava.module"
  class="ModuleService"
  anchor="getModules()" %}
method.
{% endcapture %}
{% include code-example code=javadoc-anchor-code result=javadoc-anchor-result %}

{% capture javadoc-label-code %}
See also the
{% raw %}{% include javadoc package="net.imagej.ops"
  class="package-summary" label="ImageJ Ops" %}{% endraw %}
javadocs.
{% endcapture %}
{% capture javadoc-label-result %}
See also the
{% include javadoc package="net.imagej.ops"
  class="package-summary" label="ImageJ Ops" %}
javadocs.
{% endcapture %}
{% include code-example code=javadoc-label-code result=javadoc-label-result %}
