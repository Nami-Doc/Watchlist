require! <[ modella modella-memory ]>

Watchee = modella 'Watchee'
  .use modella-memory!

  .attr 'id' {+required, type: 'number'}
  .attr 'name' {+required}
  .attr 'ep' {default: 0, type: 'number'}

module.exports = Watchee