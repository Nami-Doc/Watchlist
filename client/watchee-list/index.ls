require! <[ reactive
			./template.html ]>

template = template!
el = document.getElementById 'container'

module.exports = (context, next) !->
	reactive template, {watchees: context.models}