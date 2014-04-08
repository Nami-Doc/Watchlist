export all = (model) ->
  (context, next) !->
    # not cached
    err, models <- model.all
    return if err
    context <<< {models}
    next!

export find = (model, key = 'id') ->
  (context, next) !->
    err, model <- model.find context.params[key]
    return if err
    context <<< {models}