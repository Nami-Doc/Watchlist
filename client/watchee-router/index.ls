require! <[ router
			watchee-model watchee-list ]>
{all: router-all} = require 'router-set-context'

module.exports = new router
  ..on '/list', (router-all watchee-model), watchee-list