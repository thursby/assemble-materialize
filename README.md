# assemble-materialize
A basic one page template using Grunt, Assemble.io and the Materialize framework


## Quick Start
The fastest way to get started is to clone the project into Cloud9 and start hacking.
Use the HTML5 template and then install the prereqs with Grunt

### Install Grunt CLI

```bash
npm install -g grunt-cli
```

### Install requirements
Then go to the project root and ask npm to install the necessary modules automagically:

```bash
npm install
```

### Running Grunt

You can run grunt the usual way with ```grunt``` and this will build a development version of the project.
The JS and CSS resources will be copied rather than minified.

Use ```grunt prod``` to assemble the production verision using Uglify and friends. 
This also performs cache busting to ensure a consistent experience.

The ```grunt watch``` command is perfect for development, as it will reload after
any file change is detected. This also works with Cloud9's LiveReload feature.

What is assemble-materialize?
--------------------------

It's a website.

Specifically, it's a starter template to help create a modern,
full featured website, but in a way that is simultaneously fast, cheap, and easy.

Using Grunt and Assemble.io, the Materialize framework may be used to build
beautiful interfaces that are simple to maintain and so simple they may be
hosted practically anywhere, for cheap or even free in a lot of cases.

This template's aim is to make these two technologies easy to use together.

What is it good for?
-----------------------------

Absolutely some things. Not every site makes sense as a static site. Some
sites have requirements that can only be met by dynamic content management 
systems. 

A static site like this one doesn't have the overhead of a CMS, so it can be
hosted practically anywhere. Plus, without the overhead of database queries and
executing dynamic code, static sites are much faster than dynamic sites.

Some great use cases for a static site are:

- Brochure site
- Marking landing page
- Promotional site
- Movie or video game launch

Why would anyone do that?
-------------------

As long as it meets requirements, a static site will be cheaper to build,
cheaper to run, and cheaper to maintain. All of this without sacrificing 
performance. 

This page is hosted for free thanks to [GitHub Pages](https://pages.github.com).

In fact, static sites can use cutting edge technology like 
[Netlify](http://www.netlify.com) as a host. Services like Netlify host static 
sites on their custom built CDN in multiple locations around the planet.

### Borrowed and/or stolen
This project wouldn't exist were it not for the countless hours spend developing 
the shoulders it stands upon.

- Assemble - http://assemble.io
- Materialize - http://materializecss.com
- Material Design - https://material.google.com/
- HTML5 Boilerplate - https://github.com/h5bp
- jQuery - https://jquery.com/
