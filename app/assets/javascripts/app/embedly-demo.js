var EmbedlyDemo = module.exports = function() {
  var self = this;
  var hashTagActive = "";
  $('.embedly-button').on('click', function(e){
    // e.preventDefault();
    embedlyDemo = new EmbedlyDemo();
    var url = $('#url').val();
    var encodedUrl = encodeURIComponent(url);
    var requestUrl = "http://api.embed.ly/1/extract?key=4d990bca1808406aa35f798781bc2c9b&url=" + encodedUrl;
    return self.sendRequest(requestUrl);
  });
};

EmbedlyDemo.prototype.sendRequest = function(requestUrl) {
  var self = this;

  $('spinner').addClass('loading-circle');
  $.ajax(requestUrl).success(function(data) {
    self.data = data;
    var display = data.content || data.media.html || data.description;
    var htmlTitle = "<div class='embedly-title'><h1>" + data.title + "</h1></div>";
    var content = htmlTitle + "<div class='embedly-content'>" + display + "</div>";
    self.appendContent(content);
    self.appendImages(data.images);
    $('.style-buttons').removeClass('hide');
  }).error(function(data) {
    var errorMessage = '<p class="ajax-error">Content not found, please try again. Be sure to use the full url like this: "http://www.wizard.codes/the-winnower-api/" or " http://blog.us.playstation.com/2015/08/09/the-drop-new-playstation-games-for-8112015/ "';
    self.appendContent(errorMessage);
  }).complete(function(){
    $('spinner').removeClass('loading-circle');
  });
};

EmbedlyDemo.prototype.getVideo = function(requestUrl) {
  var self = this;

  $('spinner').addClass('loading-circle');
  $.ajax(requestUrl).success(function(data) {
    self.data = data;
    var htmlTitle = "<div class='embedly-title'><h1>" + data.title + "</h1></div>";
    var content = htmlTitle + "<div class='embedly-content'>" + data.content + "</div>";
    self.appendContent(content);
  }).error(function(data) {
    var errorMessage = '<p class="ajax-error">Content not found, please try again. Be sure to use the full url like this: "http://www.wizard.codes/the-winnower-api/" or " http://blog.us.playstation.com/2015/08/09/the-drop-new-playstation-games-for-8112015/ "';
    self.appendContent(errorMessage);
  }).complete(function(){
    $('spinner').removeClass('loading-circle');
  });
};

EmbedlyDemo.prototype.appendContent = function(content) {
  $('.preview-content').empty();
  $('.preview-content').append(content);
};

EmbedlyDemo.prototype.appendImages = function(images) {
  var imageDivs = "";
  $.each(images, function(index, image) {
    imageDivs += "<img class='thumbnail' src='" + image.url + "' />";
  });

  var galleryDiv = "<div class='image-gallery'><h3>Images</h3>" + imageDivs + "</div>";
  $('.preview-content').append(galleryDiv);
};

EmbedlyDemo.mount = function() {
  if ($('.embedly-button').get(0)) {
    embedlyDemo = new EmbedlyDemo();
  }
  return embedlyDemo;
};
