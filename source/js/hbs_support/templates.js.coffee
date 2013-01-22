# console.log("handlebars inline templates")

# wire up templates
window.JST ||= {}
window.JST.inline ||= {}

$ = jQuery
$(document).ready ->
  $("script[type='text/x-handlebars-template']").each ->
    self = $(this)
    templateName = self.data("template")
    if templateName
      console.log("Compiling: #{templateName}")
      window.JST.inline[templateName] = Handlebars.compile(self.html())
    else
      console.log("Unable to find 'data-template' attribute for:")
      console.log(self)

