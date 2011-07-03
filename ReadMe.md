dope
====
A Coffeescript framework for node.js written by @ajcates
--------------------------------------------------------

Dope is a MVC web framework written in [Coffeescript] that aims to offer the programmer the
best experience possible when working with it. It is a super simple framework 
with most modules being under 100 lines of code and documented in plain English.

Setup & Use
-----------
If you want to get going fast just clone [crack], set up the submodules and run.
    git clone git://github.com/ajcates/crack.git
    git submodule init
    git submodule update
    coffee .

Dope is so simple that it really is just a loose collection of modules I have written.
The modules are so loosely coupled together you actually need to set up your own server.

Don't worry this takes only a few lines of code and actually sets up the
core of dope.


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

Simple huh? Doing things this way gives the programmer the final say so in the way the
server handles things.

This code would normally run inside a index.coffee a directory above dope like so:
    
    YOUR-PROJECT/
    |~app/
    | |~controllers/
    | | `-index.coffee
    | `+lib/
    |~dope/
    | |+lib/
    `-index.coffee

This way you can keep dope as a Git submodule inside your project. 

Controllers
-----------
Controllers in dope are just a 2d array of functions. Example controller:

    exports.routes = [
        [
            #If the first function returns true go onto the second function
            (url) -> url.match /^\/?$/,
            (req, res) ->
                res.end "\n\n<br/>hello world!"
        ],
        [
            (url) -> url.match /^\/works?$/,
            (req, res) ->
                res.end "\n\n<br/>yep"
        ]
    ]

Controllers can route to other controllers:

    routr = require 'routr/'
    exports.routes = [
        [
            (url) -> url.match /^\/?$/,
            (req, res) ->
                res.end "\n\n<br/>hello world!"
        ],
        [
            (url) -> url.match /^\/sub?$/,
            routr <- (@, (require 'subcontroller.coffee').routes)
        ]
    ]


