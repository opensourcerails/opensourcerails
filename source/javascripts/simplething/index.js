//= require "./libs/jquery-1.7.1.min"
//= require "./libs/bootstrap.min"

//= require "./plugins/slides.jquery.js"
//= require_self

$(function() {
  if($('.gallery').length) {
    $(".gallery").slides({
      preload: true,
      effect: 'slide, fade',
      play: 0,
      pause: 2500,
      autoHeight: true,
      currentClass: 'act',
      prev: 'sprev',
      next: 'snext',
      paginationClass: 'thumbs',
      generatePagination: false
    });
  }
});



