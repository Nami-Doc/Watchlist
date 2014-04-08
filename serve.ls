const port = 3000
const dir = process.cwd!
const dev = true

require! <[component-serve express]>
cs = require 'component-serve'
app = express!

app.use '/build' component-serve do
  root: dir
  plugins:
    * require './component-jade-fixed'
    * require 'component-stylus'
    * require 'component-livescript'
  out: 'build'
  dev: dev
  require: true

app.use express.static dir
app.listen port, !->
  console.log 'Server started on http://localhost:%d/', port