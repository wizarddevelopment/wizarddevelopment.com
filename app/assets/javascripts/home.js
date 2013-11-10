$(function () {
  var HomePageRouter = Backbone.Router.extend({

    routes: {
      "": "home",
      "business": "business",
      "devteam": "devteam"
    },

    initialize: function() {
      this.nav = new APP.HomeNavigator(this);
    },

    home: function() {
      this.nav.showHome();
    },

    business: function() {
      this.nav.transitionTo("business-services");
    },

    devteam: function() {
      this.nav.transitionTo("dev-teams");
    }

  });

  window.home = new HomePageRouter();
  Backbone.history.start({pushState: true});
});