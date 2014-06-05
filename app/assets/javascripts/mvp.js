// this runs on /mvp


App = Ember.Application.create();

App.GustavoComponent = Ember.Component.extend({
  tagName: 'gustavo',
  src: 'gustavo.jpg',
  name: 'Gus!'
});

App.Router.reopen({
  location: 'history'
});

App.Router.map(function(){
  this.route('mvp');
});