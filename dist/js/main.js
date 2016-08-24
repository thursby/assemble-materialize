(function() {
  $(function() {
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    $(".scroll").click(function(event) {
      event.preventDefault();
      return $('html,body').animate({
        scrollTop: $(this.hash).offset().top
      }, 500);
    });
    return $("#index-banner").YTPlayer();
  });

}).call(this);
