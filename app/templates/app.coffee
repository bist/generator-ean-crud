# Node Libraries
express = require 'express'
http = require 'http'
config = require 'yaml-config'
path = require 'path'
winston = require 'winston'
expressWinston = require 'express-winston'
domain = require 'domain'


# Configuration
settings = config.readConfig require.resolve('./config.yaml')

# Directories
publicDir = path.join(__dirname, "#{settings.misc.clientDirectory}/public")
commonDir = path.join(__dirname, "#{settings.misc.clientDirectory}/common")
clientDir = path.join(__dirname, "#{settings.misc.clientDirectory}/modules")
serverRoutesDir = path.join(__dirname, 'src/server/routes')


# ======= Create & Run Web Server =======

# ------- create web server -------
app = express()

# ------- configure web server modules -------
winston.add winston.transports.File,
   filename: "#{settings.app.logDir}/app.log"   
winston.remove winston.transports.Console

app.enable('trust proxy')

handleUncaughtExceptions = (req, res, next)->
   requestDomain = domain.create()
   requestDomain.add(req)
   requestDomain.add(res)
   requestDomain.on 'error', (err)->
      console.log err.code
      next(err)
   requestDomain.run(next)

handleServerExceptions = (err, req, res, next) ->
   res.send(500, "<h1>Unexpected error occured</h1><h2>#{err}</h2>")
   next()

app.configure () ->
   app.use handleUncaughtExceptions
   app.use express.bodyParser()
   app.use express.cookieParser()
   app.use express.session({secret: "wBxXBlJZt2Zbi0vztcG9EKBzCe2flRPK", key: 'sid', cookie: {maxAge: settings.misc.sessionExpiration, httpOnly: true, secure: settings.misc.secureCookies}})
   app.use expressWinston.logger({ transports: [ new winston.transports.File(json: true, filename: "#{settings.app.logDir}/access.log") ] })
   app.use app.router
   app.use expressWinston.errorLogger({ transports: [ new winston.transports.File(json: true, colorize: true, filename:"#{settings.app.logDir}/error.log" )  ]   })
   app.use handleServerExceptions
   app.use express.static(commonDir, { maxAge: settings.misc.oneHour })
   app.use express.static(clientDir, { maxAge: settings.misc.oneHour })
   app.use express.static(publicDir, { maxAge: settings.misc.oneHour })

app.configure 'development', () ->
   app.use express.errorHandler({ dumpExceptions: true, showStack: true })
                                                                                             # ------- init routes -------
clientRoutes = require path.join(serverRoutesDir, 'client')
serverRoutes = require path.join(serverRoutesDir, 'server')

clientRoutes.initRoutes(app, publicDir, commonDir, clientDir)
serverRoutes.initRoutes(app, settings)

# ------- run web server -------
winston.info "Starting <%= _.slugify(appName) %>:"
server = http.createServer(app)
server.listen settings.app.port, () ->
   winston.info "Listening on port %s...", settings.app.port;
