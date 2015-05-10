var bindContactForm = require('./app/contact');
var bindToggleNav = require('./app/nav');

$(function(){
  bindToggleNav();
  bindContactForm();
});

// global react components
window.React = require('react');
window.AccountDetails = require('./components/account-details');
