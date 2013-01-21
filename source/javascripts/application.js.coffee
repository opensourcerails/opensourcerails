#= require "./simplething/libs/jquery-1.7.1.min"
#= require "./simplething/libs/bootstrap.min"

#= require "./simplething/plugins/slides.jquery.js"
#= require "./vendor/jquery.utils"
#= require "./vendor/jquery.scrollTo"
#= require "./vendor/jquery.fancybox"
#= require "./vendor/jquery.tinysort"
#= require "./vendor/jquery.timeago"
#= require "./vendor/cookies"

#= require_self

$ ->
  $(".time-ago").timeago()


  # handle portfolio item sorting
  portfolioItems = $(".portfolio.items")
  portfolioCats = $(".portfolio-cats")
  if portfolioItems.length > 0 and portfolioCats.length > 0
    defaultSort = Cookies.get("portfolio-sort") || "watchers"
    sorter = portfolioItems.find(".sorter")
    portfolioItems
      .bind "sort", (e) ->
        $(this).hide()
        console.log("Sorting by: #{e.sort}")

        portfolioCats.find("li.act").removeClass("act")
        portfolioCats.find("li[data-sort='#{e.sort}']").addClass("act")

        sorter.empty()
        $(this).find(".item").detach().appendTo(sorter)

        sorter.find(".item").tsort({data: e.sort, order: "desc"})
        sorter.find(".item").each (i, el) ->
          # console.log("i: #{i}")
          # console.log(el)

          currentContainer = portfolioItems.find(".row-fluid").eq(i / 3)
          $(el).detach().appendTo(currentContainer)

        portfolioItems.attr("data-sort", e.sort)
        Cookies.set("portfolio-sort", e.sort)

        $(this).show()

      .fire("sort", sort: defaultSort)

    portfolioCats.find("li").click (e) ->
      e.preventDefault()
      portfolioItems.fire("sort", sort: $(this).data("sort"))

  if $(".gallery").length > 0
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
