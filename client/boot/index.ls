require! <[ watchee-router
			./template.html ]>

module.exports = (div) ->
	div.innerHTML = template!

	# start routers
	watchee-router.start! # either one : listen!