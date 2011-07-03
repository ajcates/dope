dope
====
A Coffeescript framework for node.js written by @ajcates
--------------------------------------------------------

Dope is my Coffeescript web framework that I work on in my spare time. It is a
super simple framework with most modules being under 100 lines of code and
documented in plain English.

In fact you can look at dope as being so simple that it really is just a collection
of modules I have written. The modules are so loosely coupled together you actually
need to set up server. Don't worry this takes only a few lines of code and is almost
as simple as the Hello World code on the node.js homepage.


    #Add in library paths.
    require.paths.unshift './dope/lib/'
    require.paths.unshift './app/lib/'

    #Require needed libs to start up a Server
    http = require 'http'
    controller = require './app/controllers/'
    routr = require 'routr/'

    #Creating our server
    http.createServer((req, res) ->
        #Log the url for teh lulz
        console.log req.url
        #Routing out request
        [req, res] = routr controller.routes, req, res
    ).listen(1337);

    console.log "w00t da server running @ \nhttp://127.0.0.1:1337/"

This code would normally run inside a index.coffee a directory above dope. This way
you can keep dope as a Git submodule inside your project. I have even set up some 
what of a boiler plate for [dope] called crack to help you get started faster on
your projects.
