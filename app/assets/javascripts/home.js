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
      window.mixpanel.track("Viewed Home");
    },

    business: function() {
      this.nav.transitionTo("business-services");
      window.mixpanel.track("Viewed Business");
    },

    devteam: function() {
      this.nav.transitionTo("dev-teams");
      window.mixpanel.track("Viewed Dev Team");
    }

  });

  window.home = new HomePageRouter();
  Backbone.history.start({pushState: true});
});