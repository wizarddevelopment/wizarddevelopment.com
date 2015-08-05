module.exports = function colorNav() {
  var $nav = $(".navigation");
  var $selector = $(".thesis");
  if (!$selector.get(0)){
    return;
  }

  var thresholdHeight = $selector.position().top - $nav.height();
  var toggled = false;
  var toggleNavClass = function() {
    var scrollHeight = window.pageYOffset;
    var pastThreshold = thresholdHeight <= scrollHeight;
    if (pastThreshold === toggled) { return; }
    if (pastThreshold) {
      $nav.addClass("dark-nav");
      toggled = true;
    } else {
      $nav.removeClass("dark-nav");
      toggled = false;
    }
  };
  $(window).on("scroll", toggleNavClass);
};
