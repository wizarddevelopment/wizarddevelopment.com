var bindContactForm = require('./app/contact');
var bindToggleNav = require('./app/nav');
var bindColorNav = require('./app/color_nav');

$(function(){
  bindToggleNav();
  bindContactForm();
  bindColorNav();
});

// global react components
window.React = require('react');
window.AccountDetails = require('./components/account-details');
