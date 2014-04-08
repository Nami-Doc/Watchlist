require! <[ modella modella-memory ]>

Watchee = modella 'Watchee'
  .use modella-memory!
  .attr 'id' {+required, type: 'number'}
  .attr 'name' {+required}
  .attr 'at' {+required, type: 'number'}

module.exports = Watchee