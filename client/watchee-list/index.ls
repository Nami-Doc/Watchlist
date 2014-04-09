require! <[ reactive
      watchee-model reactive-watchers
			./template.html ]>

el = document.getElementById 'container'
new-model = new watchee-model
react = new reactive-watchers new-model, <[ name ep ]>

module.exports = (context, next) !->
  el.innerHTML = template!

  view = reactive el, context{models},
    delegate:
      do
        add-watch: !->
          # validate
          context.models.push new-model
          react.model = new-model := new watchee-model
      <<< react.generate!