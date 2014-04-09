require! <[ watchee-router
			./template.html ]>

module.exports = (div) ->
	div.innerHTML = template name: 'Your Watch List'

	# start routers
	watchee-router.start! # either one : listen!