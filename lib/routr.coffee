#crazy mad uber mega cool router system made by ajcates. it's so flipping complex you brain will melt trying to understand the code.
module.exports = (routes, req, res) ->
    for route in routes
        #if the first item in the array of routes matches
        if route[0] req.url
            #call the matched function with the req and res
            return route[1] req, res
