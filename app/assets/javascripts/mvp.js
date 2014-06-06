
App = Ember.Application.create();

App.WizardGusComponent = Ember.Component.extend({
  pic: 'assets/gus.jpg',
  name: 'Gus!',
  about: 'Not to mention, funny, outgoing, NOT retarded, and a great basketball team player that puts Amy and Armando to division 10 level'
});

App.WizardArmandoComponent = Ember.Component.extend({
  pic: 'assets/armando.jpg',
  name: 'Armando!',
  about: 'He is a great programmer and the best basketball player in Chinatown'
});

App.WizardHannahComponent = Ember.Component.extend({
  pic: 'assets/hannah.jpg',
  name: 'Hannah!',
  about: 'She is CHO(Chief Happiness Officer) and Front End Developer'
});

App.WizardFrancisComponent = Ember.Component.extend({
  pic: 'assets/francis.jpg',
  name: 'Francis!',
  about: 'He is robo cat!'
});

App.WizardAmyComponent = Ember.Component.extend({
  pic: 'assets/amy.png',
  name: 'Amy!',
  about: 'Handlebars wizard!! Can use them for carrying logs or rendering content --amazing!'
});

App.Router.reopen({
  location: 'history'
});

//Start Ugly Routes? Note Research about Routes in Ember and Rails
App.TeamRoute = Ember.Route.extend({
  model: function(){
    return '/team';
  }
});

App.BusinessRoute = Ember.Route.extend({
  model: function(){
    return '/business';
  }
});

App.DevelopmentRoute = Ember.Route.extend({
  model: function(){
    return '/development';
  }
});

App.ContactRoute = Ember.Route.extend({
  model: function(){
    return '/contact';
  }
});
//End of Ugly Routes

App.Router.map(function(){
  this.route('business');
  this.route('team');
  this.route('development');
  this.route('contact');
});

