// IIFE or Immediately-invoked function expression keeps all the variables we use here
// inside of here so they can't get messed up by anything else
(function () {

  // turns on strict mode which helps you catch mistakes early
  "use strict";

  // All dom manipulation or binding should happen after the dom has finished loading,
  // We call this function in the jquery document ready binding

  var HomeNavigator = function (router) {
    this.router = router;
    this.state = 'home';
    this.bindButtons();
    this.mobileView = $(window).width() < 767;
    this.missionStatementHeight = $(".mission_statement").height();

    $("#business-services-content").css("display", "none");
    $("#dev-teams-content").css("display", "none");
    $('select').selectbox();
  };

  HomeNavigator.prototype.bindButtons = function () {
    var thisNavigator = this;
    $(".home").on('click', function () {
      thisNavigator.router.navigate('', {trigger:true});
    });

    $(".business-services").click(function () {
      thisNavigator.router.navigate('business', {trigger:true});
    });

    $(".dev-teams").click(function () {
      thisNavigator.router.navigate('devteam', {trigger:true});
    });
  };

  HomeNavigator.prototype.setHeaderToServiceMode = function () {
    $("header").css("position", "absolute");
  };

  HomeNavigator.prototype.hideMissionStatement = function () {
    $(".mission_statement").animate({
      //-- slide up
      height: "0",
      opacity: "0.0",
      top: "200px"
    }, {
      duration: 1000,
      specialEasing: {
        height: "easeInOutQuint",
        opacity: "easeInOutQuint",
        top: "easeInOutQuint"
      }
    });
    $(".business-services, .dev-teams").animate({
      //-- slide up
      top: "-120px"
    }, {
      duration: 1000,
      specialEasing: {
        top: "easeInOutQuint"
      }
    });
  };

  HomeNavigator.prototype.showMissionStatement = function () {
    $(".mission_statement").animate({
      //-- slide up
      height: this.missionStatementHeight,
      opacity: "1.0",
      top: "0px"
    }, {
      duration: 1000,
      specialEasing: {
        height: "easeInOutQuint",
        opacity: "easeInOutQuint",
        top: "easeInOutQuint"
      }
    });
  };

  HomeNavigator.prototype.homeToBusiness = function () {
    var thisNavigator = this;
    this.setHeaderToServiceMode();
    $("#business-services-content").css({
      "display": "block",
      "position": "absolute",
      "marginLeft": "-100%",
      "opacity": "0.0",
      "top": (this.mobileView ? "480px" : "400px")
    });
    //-- setp 2: animate .buttons
    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move right
        left: 260 - $(".business-services").width() + 28
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }

    $(".business-services").addClass("active");
    $(".dev-teams").removeClass("active");
    $(".business-services").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });

    $(".dev-teams").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#business-services-content").animate({
      //-- slide in
      marginLeft: "-5%",
      opacity: "0.7"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint",
        opacity: "easeInOutQuint"
      },
      complete: function () {
        thisNavigator.hideMissionStatement();
        $(this).animate({
          //-- slide up
          top: "0px",
          opacity: "1.0"
        }, {
          duration: 1000,
          specialEasing: {
            top: "easeInOutQuint",
            opacity: "easeInOutQuint"
          },
          complete: function () {
            $(this).css("position", "relative");
          }
        });
      }
    });
  };

  HomeNavigator.prototype.homeToDev = function () {
    var thisNavigator = this;
    this.setHeaderToServiceMode();
    $("#dev-teams-content").css({
      "display": "block",
      "position": "absolute",
      "marginLeft": "100%",
      "opacity": "0.0",
      "top": (this.mobileView ? "480px" : "400px")
    });

    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move left
        left: -(260 - ($(".dev-teams").width() / 2) - 28)
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }

    $(".dev-teams").addClass("active");
    $(".business-services").removeClass("active");
    $(".business-services").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });

    $(".dev-teams").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#dev-teams-content").animate({
      //-- slide in
      marginLeft: "-5%",
      opacity: "0.7"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint",
        opacity: "easeInOutQuint"
      },
      complete: function () {
        thisNavigator.hideMissionStatement();
        $(this).animate({
          //-- slide up
          top: "0px",
          opacity: "1.0"
        }, {
          duration: 1000,
          specialEasing: {
            top: "easeInOutQuint",
            opacity: "easeInOutQuint"
          },
          complete: function () {
            $(this).css("position", "relative");
          }
        });
      }
    });
  };

  HomeNavigator.prototype.businessToDev = function () {
    $("#business-services-content").css({
      "display": "block",
      "position": "absolute",
      "marginLeft": "-100%",
      "opacity": "1.0",
      "top": "0px"
    });

    //-- setp 2: animate .buttons
    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move right
        left: 260 - $(".business-services").width() + 28
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }

    $(".business-services").addClass("active");
    $(".dev-teams").removeClass("active");
    $(".business-services").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    $(".dev-teams").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#business-services-content").animate({
      //-- slide in
      marginLeft: "-5%"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint"
      },
      complete: function () {
        $(this).css("position", "relative");
      }
    });
    $("#dev-teams-content").animate({
      //-- slide out
      marginLeft: "100%"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint"
      },
      complete: function () {
        $(this).css("display", "none");
      }
    });
  };

  HomeNavigator.prototype.devToBusiness = function () {
    $("#dev-teams-content").css({
      "display": "block",
      "position": "absolute",
      "marginLeft": "100%",
      "opacity": "1.0",
      "top": "0px"
    });
    //-- setp 2: animate .buttons
    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move left
        left: -(260 - ($(".dev-teams").width() / 2) - 28)
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }
    $(".business-services").removeClass("active");
    $(".dev-teams").addClass("active");
    $(".business-services").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    $(".dev-teams").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#dev-teams-content").animate({
      //-- slide in
      marginLeft: "-5%"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint"
      },
      complete: function () {
        $(this).css("position", "relative");
      }
    });
    $("#business-services-content").animate({
      //-- slide out
      marginLeft: "-100%"
    }, {
      duration: 750,
      specialEasing: {
        marginLeft: "easeInOutQuint"
      },
      complete: function () {
        $(this).css("display", "none");
      }
    });
  };

  HomeNavigator.prototype.showHome = function () {
    $("#business-services-content, #dev-teams-content").slideUp("slow", function () {
      $("header").css("position", "relative");
    });

    $(".buttons").animate({
      //-- move left
      left: "0px",
      top: 0
    }, {
      duration: 650,
      specialEasing: { left: "easeInOutQuint" }
    });

    $(".buttons > a").removeClass("active").animate({
      //-- hide
      opacity: "1.0",
      top: "0px"
    }, {
      duration: 1000,
      specialEasing: {
        opacity: "easeInOutQuint",
        top: "easeInOutQuint"
      }
    });

    this.showMissionStatement();
    this.state = "home";
  };

  HomeNavigator.prototype.transitionTo = function (target_state) {
    if (target_state === "business-services" && this.state === "home") {
      this.homeToBusiness();
    } else if (target_state === "dev-teams" && this.state === "home") {
      this.homeToDev();
    } else if (target_state === "business-services" && this.state === "dev-teams") {
      this.businessToDev();
    } else if (target_state === "dev-teams" && this.state === "business-services") {
      this.devToBusiness();
    }
    this.state = target_state;
  };

  // Save our new object on the APP object
  window.APP.HomeNavigator = HomeNavigator;

})();