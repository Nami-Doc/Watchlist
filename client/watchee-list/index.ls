require! <[ vue
      watchee-model
			./template.html ]>

el = document.getElementById 'container'

module.exports = (context, next) !->
  el.innerHTML = template!
  new vue do
    el: '#container'
    
    data:
      watchees: context.models
      'new-watchee-name': ''
      'new-watchee-ep': 0

    ready: !->
      #@$watch 'watchee', (watchees) !-> # replace all

    methods:
      add: !->
        return unless name = @'add-watchee-name'?trim!
        return unless   ep = @'add-watchee-ep'?trim!
        return if isNaN ep
        
        debugger
        @watchees.push new watchee-model