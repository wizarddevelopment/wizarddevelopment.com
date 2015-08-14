module.exports = function embedlyDemo() {
  $('.add-style').on('click', function(e) {
    e.preventDefault();
    $('.preview-content').removeClass('newspaper blog');
    $('.preview-content').addClass(e.target.text.toLowerCase());
  });
};
