Smooth Page Scrolling Example
=============================

This repo illustrates the ability to intercept scroll events, pipe them through an easing equasion, and then apply them to a container.  Useful in situations where you would like to normalize scrolling across unknown types of devices / platforms and apply the result to a parallax container or typical webpage.

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
