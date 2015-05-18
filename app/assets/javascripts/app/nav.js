module.exports = function bindToggleNav() {
  var menu = $('.js-nav-menu');
  $('.js-mobile-menu').on('click', function(e) {
    e.preventDefault();
    menu.toggleClass('show');
  });
};
