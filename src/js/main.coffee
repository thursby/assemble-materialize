$ ->
  $("#toc").pushpin({ top: $("#toc").offset().top })
  $(".scroll").click (event) ->
    event.preventDefault()
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500)
  $('.scrollspy').scrollSpy()