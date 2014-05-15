Smooth Page Scrolling Example
=============================

Queuing your scroll changes within requestAnimationFrame isn't what makes scrolling smooth, it's pre-processing your scroll position through an easing equasion.  By constantly updating the future scroll position by making sure that deltas to the y-position are normalized down into what will eventually be a zero, but over time, and then applying it to your container whenever the user scrolls, you'll achieve a nice ease, which can then be dispatched to each of your parallax layers or page.

This repo illustrates the ability to intercept scroll events, pipe them through an easing equasion, and then apply them to a container.

Demo:  https://smoothscroll.firebaseapp.com/

Project Setup
-------------
- Install Node
 - [Node.js Installer](http://nodejs.org/)
- Install Grunt command line interface
 - `sudo npm install -g grunt-cli`
- For sourcemap support, SASS needs to be installed with the --pre flag
 - `gem install sass --pre`
- Clone and cd into the repo
 - `git clone https://github.com/damassi/smooth-scroll-test.git && cd smooth-scroll-test`
- Then install Grunt task dependencies
 - `npm install`

Development Tasks
-----------------

- For development: `grunt dev` then navigate to `http://localhost:3001` (or IP address).
