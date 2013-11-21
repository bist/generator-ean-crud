# Node Libraries 
path = require 'path'

#Routes
module.exports = 
   initRoutes: (app, publicDir, templateDir, clientDir) ->

      app.get '/', (req, res) ->
         res.sendfile path.join(publicDir, 'index.html')

      app.get '/static/*', (req, res) ->
         res.sendfile path.join(publicDir, req.params[0])

      app.get '/templates/*', (req, res) ->
         res.sendfile path.join(templateDir, req.params[0])

      app.get '/app/*', (req, res) ->
         res.sendfile path.join(clientDir, req.params[0])