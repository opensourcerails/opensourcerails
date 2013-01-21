#= require "./simplething/libs/jquery-1.7.1.min"
#= require "./simplething/libs/bootstrap.min"

#= require "./simplething/plugins/slides.jquery.js"
#= require "./vendor/jquery.scrollTo"
#= require "./vendor/jquery.fancybox"

#= require_self

$ ->
  $(".gallery").slides
    preload: true
    effect: 'slide, fade'
    play: 0
    pause: 2500
    autoHeight: true
    currentClass: 'act'
    prev: 'sprev'
    next: 'snext'
    paginationClass: 'thumbs'
    generatePagination: false
    animationComplete: (i) ->
      # rescroll
      console.log("SWAPPED")
      $(".scroll-thumbs").scrollTo($(".scroll-thumbs .act"), offset: {left: -50})

  $(".fancybox").fancybox()
  $(".close-announcement").click (e) ->
    e.preventDefault()
    $(this).hide()

    $(".announcement")
        .find(".train-icon").hide().end()
        .css({'min-height': "auto"}).slideUp()

    # TODO: set a cookie with the current epoch time so the announcement stays hidden