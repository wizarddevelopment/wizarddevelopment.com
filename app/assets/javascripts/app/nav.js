module.exports = function bindToggleNav() {
  var menu = $('.js-nav-menu');
  $('.js-mobile-menu').on('click', function(e) {
    e.stopPropagation();
    menu.toggleClass('show');
  });
  $('.js-nav-menu').on('click', function(e) {
    menu.toggleClass('show');
  });

  $(window).on('click', function(e){
    if(e.target !== menu){
      menu.removeClass('show');
    }
  });
};
