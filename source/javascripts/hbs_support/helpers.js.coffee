# setup helpers
# console.log("handlebars helpers")

Handlebars.registerHelper 'autolink', (input) ->
  result = _(input).autolink()
  return new Handlebars.SafeString(result)

Handlebars.registerHelper 'highlight', (input, what) ->
  result = input
  try
    regex = new RegExp("#{what}", "i")
    result = input.replace(regex, "<strong>#{what}</strong>") if what.length > 0
  catch error
    result = input

  return new Handlebars.SafeString(result)

