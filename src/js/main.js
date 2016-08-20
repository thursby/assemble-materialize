(function() {
  $(function() {
    $('.button-collapse').sideNav();
    $('.parallax').parallax();
    return $(".scroll").click(function(event) {
      event.preventDefault();
      return $('html,body').animate({
        scrollTop: $(this.hash).offset().top
      }, 500);
    });
  });

}).call(this);
