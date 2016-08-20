$ ->
  $('.button-collapse').sideNav()
  $('.parallax').parallax()


  $(".scroll").click (event) ->
    event.preventDefault()
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500)
