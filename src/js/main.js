(function() {
  $(function() {
    $("#toc").pushpin({
      top: $("#toc").offset().top
    });
    $(".scroll").click(function(event) {
      event.preventDefault();
      return $('html,body').animate({
        scrollTop: $(this.hash).offset().top
      }, 500);
    });
    return $('.scrollspy').scrollSpy();
  });

}).call(this);
