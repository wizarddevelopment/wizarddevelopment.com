var bindContactForm = require('./app/contact');
var bindToggleNav = require('./app/nav');
var bindStickyNav = require('./app/sticky-nav');

$(function(){
  bindToggleNav();
  bindContactForm();
  bindStickyNav();
});

// global react components
window.React = require('react');
window.AccountDetails = require('./components/account-details');
