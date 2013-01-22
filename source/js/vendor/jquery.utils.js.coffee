$ = jQuery

$.fn.fire = (eventName, options) ->
  options = options || {}
  options["type"] = eventName
  if options.ignoreErrors
    try
      return this.trigger(options)
    catch e
      return this
  else
    return this.trigger(options)

# Returns the full html for an element
$.fn.outerHTML = ->
  return $('<div>').append( this.eq(0).clone() ).html()

# opposite of is()
$.fn.isnt = (selector) ->
  return !this.is(selector)

# Returns whether or not a result set has results in it
$.fn.onPage = ->
  return this.size() > 0

$.fn.notOnPage = ->
  return this.size() == 0

# Looks within to see if the element is still in browser's dom
$.fn.inDom = ->
  return this.parents("html").size() > 0

