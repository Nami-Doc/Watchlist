const port = 3000
const dir = process.cwd!
const dev = true

require! <[ component-serve express fs ]>
cs = require 'component-serve'
app = express!

app.use '/build' component-serve do
  root: dir
  plugins:
    * require 'component-jade-fixed'
    * require 'component-stylus'
    * require 'component-livescript'
  out: 'build'
  dev: dev
  require: true

app.use express.static dir

app.use (req, res) !-> # serve the same static file
  res.writeHeader 200 'Content-Type': 'text/html'
  res.end fs.readFileSync 'index.html'

app.listen port, !->
  console.log 'Server started on http://localhost:%d/', port