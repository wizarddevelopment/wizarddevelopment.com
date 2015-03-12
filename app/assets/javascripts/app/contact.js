window.APP.ContactForm = function(){
  var form = $('#new_contact_request');

  form.on('ajax:error', function(e, xhr){
    var response = xhr.responseJSON;
    form.find('.error').remove();
    Object.keys(response).forEach(function(key){
      var value = response[key].join(' and ');
      $('label[for="contact_request_' + key + '"]').append('<span class="error"> ' + value + '</span>');
    });
    mixpanel.track("Contact Form Error", response);
  });

  form.on('ajax:success', function(e, response){
    form.after('<h1 class="coffee">We got the message. We\'ll get back to you soon!</h1>');
    form.hide();
    mixpanel.track("Contact Form Success");
  });

};

$(window.APP.ContactForm);
