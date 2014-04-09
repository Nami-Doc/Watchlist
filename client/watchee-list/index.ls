require! <[ reactive reactive-watchers
      watchee-model
			./template.html ]>

el = document.getElementById 'container'
new-model = new watchee-model
react = new reactive-watchers new-model, <[ name ep ]>

module.exports = (context, next) !->
  el.innerHTML = template

  view = reactive el, context{models},
    delegate:
      react.generate! with
        add-watch: !->
          # validate
          context.models.push new-model
          react.model = new-model := new watchee-model