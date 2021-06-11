---
title: Notices
layout: page
section: Support:Editing the Wiki
nav-links: true
---

This page demonstrates how to add various stylized notices to your page.
Informational notices allow you to notify the reader of important details to
keep in mind. The notice will span the width of the page. Optionally, you can
specify an icon or glyph symbol, background color, and/or highlight color.

## Basic usage

{% highlight liquid %}{% raw %}{% include notice content="Hello world!" %}{% endraw %}{% endhighlight %}
{% include notice content="Hello world!" %}

## Markdown styling

{% highlight liquid %}{% raw %}{% include notice content="I like to use **bold** and *italic* text." %}{% endraw %}{% endhighlight %}
{% include notice content="I like to use **bold** and *italic* text." %}

## Multiple lines

{% highlight liquid %}{% raw %}{% include notice class="fas fa-city" content="
What do these cities have in common?

| City           | Country        |
|----------------|----------------|
| Dresden        | Germany        |
| Edinburgh      | United Kingdom |
| Madison        | United States  |
| Melbourne      | Australia      |
| Ostrava        | Czech Republic |
| Zürich         | Switzerland    |
" %}{% endraw %}{% endhighlight %}

{% include notice class="fas fa-city" content="
What do these cities have in common?

| City           | Country        |
|----------------|----------------|
| Dresden        | Germany        |
| Edinburgh      | United Kingdom |
| Madison        | United States  |
| Melbourne      | Australia      |
| Ostrava        | Czech Republic |
| Zürich         | Switzerland    |
" %}

## Custom colors

{% highlight liquid %}{% raw %}{% include notice background-color="chartreuse" highlight-color="brown"
  content="Green background with brown stripe? How exciting!" %}{% endraw %}{% endhighlight %}
{% include notice background-color="chartreuse" highlight-color="brown"
  content="Green background with brown stripe? How exciting!" %}

## Custom font size

{% highlight liquid %}{% raw %}{% include notice size="2em"
  content="I'm huge, and therefore more important!" %}{% endraw %}{% endhighlight %}
{% include notice size="2em"
  content="I'm huge, and therefore more important!" %}

## Icons

You can specify any icon from the
{% include github org="imagej" repo="imagej.github.io"
  path="media/icons" label="media/icons folder" %}
by name, sans file extension.

### Informational

{% highlight liquid %}{% raw %}{% include notice icon="info"
  content="Take careful note of this sentence." %}{% endraw %}{% endhighlight %}
{% include notice icon="info"
  content="Take careful note of this sentence." %}

### Warning

{% highlight liquid %}{% raw %}{% include notice icon="warning"
  content="Watch out for snakes!" %}{% endraw %}{% endhighlight %}
{% include notice icon="warning"
  content="Watch out for snakes!" %}

### Technical note

{% highlight liquid %}{% raw %}{% include notice icon="tech"
  content="To compile, use `./configure && make & make install`." %}{% endraw %}{% endhighlight %}
{% include notice icon="tech"
  content="To compile, use `./configure && make & make install`." %}

### Usage tip

{% highlight liquid %}{% raw %}{% include notice icon="tip"
  content="Want to get more done?
  [Sleep faster!](https://youtu.be/1g2ntIN7JuY)" %}{% endraw %}{% endhighlight %}
{% include notice icon="tip"
  content="Want to get more done?
  [Sleep faster!](https://youtu.be/1g2ntIN7JuY)" %}

### Project-specific commentary

{% highlight liquid %}{% raw %}{% include notice icon="imagej"
  content="This website documents the ImageJ ecosystem." %}{% endraw %}{% endhighlight %}
{% include notice icon="imagej"
  content="This website documents the ImageJ ecosystem." %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="fiji"
  content="Fiji includes ImageJ2's integrated search bar." %}{% endraw %}{% endhighlight %}
{% include notice icon="fiji"
  content="Fiji includes ImageJ2's integrated search bar." %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="imagej1"
  content="ImageJ 1.x was first released in 1997." %}{% endraw %}{% endhighlight %}
{% include notice icon="imagej1"
  content="ImageJ 1.x was first released in 1997." %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="bonej"
  content="BoneJ includes a lot of useful plugins." %}{% endraw %}{% endhighlight %}
{% include notice icon="bonej"
  content="BoneJ includes a lot of useful plugins." %}

### Operating-system-specific commentary

{% highlight liquid %}{% raw %}{% include notice icon="linux"
  content="Linux is my favorite operating system." %}{% endraw %}{% endhighlight %}
{% include notice icon="linux"
  content="Linux is my favorite operating system." %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="apple"
  content="Some people really love macOS!" %}{% endraw %}{% endhighlight %}
{% include notice icon="apple"
  content="Some people really love macOS!" %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="windows"
  content="Lots of people use Windows." %}{% endraw %}{% endhighlight %}
{% include notice icon="windows"
  content="Lots of people use Windows." %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="pi"
  content="ImageJ works on Raspberry Pi!" %}{% endraw %}{% endhighlight %}
{% include notice icon="pi"
  content="ImageJ works on Raspberry Pi!" %}

--------------

{% highlight liquid %}{% raw %}{% include notice icon="android"
  content="Someday, ImageJ will work on Android phones." %}{% endraw %}{% endhighlight %}
{% include notice icon="android"
  content="Someday, ImageJ will work on Android phones." %}

### Font Awesome

{% highlight liquid %}{% raw %}{% include notice class="fab fa-fort-awesome"
  content="You can use Font Awesome icons.
  [More than 5,000 icons!](https://fontawesome.com/v5.9.0/icons)" %}{% endraw %}{% endhighlight %}
{% include notice class="fab fa-fort-awesome"
  content="You can use Font Awesome icons.
  [More than 5,000 icons!](https://fontawesome.com/v5.9.0/icons)" %}

### Unicode

{% highlight liquid %}{% raw %}{% include notice glyph="&#127881;" highlight-color="pink"
  content="You can use Unicode symbols including emoji.
  [More than 100,000 symbols!](https://graphemica.com/)" %}{% endraw %}{% endhighlight %}
{% include notice glyph="&#127881;" highlight-color="pink"
  content="You can use Unicode symbols including emoji.
  [More than 100,000 symbols!](https://graphemica.com/)" %}
