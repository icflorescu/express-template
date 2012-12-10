# Modules
express  = require 'express'
http     = require 'http'

pages = require './routes/pages'

startTime = (new Date()).getTime()

app = express()

# Configure application
app.configure ->
  app.locals.getAsset = (file) ->
    type = file[(file.lastIndexOf('.') + 1)..]
    if process.env.NODE_ENV == 'production'
      "/#{type}/#{file}?q=#{startTime}"
    else
      "/#{type}-dev/#{file}?q=#{(new Date()).getTime()}"

  app.set 'port', process.env.PORT or 3000
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('app secret goes here')
  app.use express.session()
  app.use app.router
  app.use express.static("#{__dirname}/public")

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', pages.index

http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get('port')}"
