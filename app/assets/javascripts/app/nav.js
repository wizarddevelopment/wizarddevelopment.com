window.APP.ToggleNav = function() {
  var menu = $('.js-nav-menu');
  $('.js-mobile-menu').on('click', function(e) {
    e.preventDefault();
    menu.toggleClass('show');
  });
};

$(window.APP.ToggleNav);
