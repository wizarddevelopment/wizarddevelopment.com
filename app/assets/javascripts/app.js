var bindContactForm = require('./app/contact');
var bindToggleNav = require('./app/nav');
var bindStickyNav = require('./app/sticky-nav');
var styleContent = require('./app/style-content');
var EmbedlyDemo = require('./app/embedly-demo');

$(function(){
  bindToggleNav();
  bindContactForm();
  bindStickyNav();
  styleContent();
  EmbedlyDemo.mount();
});

// global react components
window.React = require('react');
window.AccountDetails = require('./components/account-details');
