# assemble-materialize
A basic template for creating sites with the Assemble and the Materialize framework. Highly optimized Production build with a dev friendly Watch build.

## The stuff it does well
Grunt has been configured for optimal goodness
* **Minified** - CSS and JS assets are bundled and minified into header and footer
* **Cache-proof** - All resources are referenced with a cache-busting suffix to ensure that there are never any problems with stale assets.
* **Optimized Development** - Coffescript based Gruntfile automatically loads Grunt modules from package.json to reduce boilerplate
* **Friendly Editing Experience** - Edit the content in Markdown with  HTML sprinkled in wherever you'd like
* **Live View** - View the actual website while editing and have it reload right in your browser (on [Cloud9](http://cloud9.io))

## Requirements

Node.js and NPM

### Install Grunt CLI

```bash
npm install -g grunt-cli
```

### Install requirements
Then go to the project root and ask npm to install the necessary modules automagically:

```bash
npm install
```

### Borrowed and/or stolen
This project wouldn't exist were it not for the countless hours spent developing 
the shoulders it stands upon.

- Assemble - http://assemble.io
- Materialize - http://materializecss.com
- Material Design - https://material.google.com/
- HTML5 Boilerplate - https://github.com/h5bp
- jQuery - https://jquery.com/

### Running Grunt

You can run grunt the usual way with ```grunt```. Other options 
include ```grunt prod``` to assemble the production verision (Uglify and friends) or
```grunt watch``` to run a development version with live reload (on [Cloud9](http://cloud9.io)).

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

This page is hosted for free on [GitHub Pages](https://pages.github.com) but
since it's static, it could be reliably hosted from anywhere, with even the 
smallest hosting plans.

The real benefit is when using production grade hosting services with static
sites. Services like [Netlify](http://www.netlify.com) take static sites and
make them sing with a custom built hybrid CDN using the best-of-the-best for
each piece of the puzzle. The best part is all of this happens automatically
so there's no need to micromanage instances or resources.

What about performance?
--------------------

Including frameworks can have a negative impact on page load times. Attempting
to use build systems like Grunt can help, but the flexibility of these tools
means there are any number of ways of [Doing It Wrong](http://doingitwrong.com).

The build system utilizes Grunt in all the right ways to produce a site that is
optimized and cache proof. Combine this with the power of Netlify, and sites
can be easily hosted anywhere and still be hackernews-proof.
