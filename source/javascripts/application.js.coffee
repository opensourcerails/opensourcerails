#= require "./lib"
#= require_tree "./templates"
#= require "./components"
#= require "./pages"

$ = jQuery
$doc = $(document)

$doc.ready ->

  # some keyboard shortcuts to help in debug mode
  if Settings.client.debug_mode
    $("body").bind "keydown", "meta+e", ->
      $("body").toggleClass("grid-debug")
      $("#footnotes_holder").toggle()
      return true

  # global styles go
  $(".alert").alert()

  # linkable clicks
  $(document).on "click", ".linkable", (e) ->
    e.preventDefault()
    window.location = $(this).data("href")

  # setup data fixed elements
  $("[data-fixed]").each (index) ->
    self = $(this)
    self.fixed(top: self.data("fixed"))

  # make all of the flash messages disappear
  $('.alert[data-auto-dismiss="true"]').delay(2500).fadeOut("slow")

  if Modernizr.touch
    $("body").addClass("touch-enabled")
  else
    $("body").addClass("touch-disabled")

