// IIFE or Immediately-invoked function expression keeps all the variables we use here
// inside of here so they can't get messed up by anything else
(function () {
  // turns on strict mode which helps you catch mistakes early
  "use strict";

  // All dom manipulation or binding should happen after the dom has finished loading,
  // We call this function in the jquery document ready binding

  var HomeNavigator = function () {
    this.state = 'home';
    this.bindButtons();
    this.mobileView = $(window).width() < 767;
    this.missionStatementHeight = $(".mission_statement").height();

    $("#service_1_content").css("display", "none");
    $("#service_2_content").css("display", "none");
    $('#select_1').selectbox();
    $('#select_2').selectbox();
  };

  HomeNavigator.prototype.bindButtons = function () {
    var thisNavigator = this;
    $(".home").on('click', function () {
      thisNavigator.showHome();
    });

    $(".service_1").click(function () {
      thisNavigator.transitionTo("service_1");
    });

    $(".service_2").click(function () {
      thisNavigator.transitionTo("service_2");
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
    $(".service_1, .service_2").animate({
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
    $("#service_1_content").css({
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
        left: 260 - $(".service_1").width() + 28
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }

    $(".service_1").addClass("active");
    $(".service_2").removeClass("active");
    $(".service_1").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });

    $(".service_2").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#service_1_content").animate({
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
    $("#service_2_content").css({
      "display": "block",
      "position": "absolute",
      "marginLeft": "100%",
      "opacity": "0.0",
      "top": (this.mobileView ? "480px" : "400px")
    });

    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move left
        left: -(260 - ($(".service_2").width() / 2) - 28)
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }

    $(".service_2").addClass("active");
    $(".service_1").removeClass("active");
    $(".service_1").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });

    $(".service_2").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#service_2_content").animate({
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
    $("#service_1_content").css("display", "block");
    $("#service_1_content").css("position", "absolute");
    $("#service_1_content").css("top", "0px");
    $("#service_1_content").css("marginLeft", "-100%");
    $("#service_1_content").css("opacity", "1.0");
    //-- setp 2: animate .buttons
    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move right
        left: 260 - $(".service_1").width() + 28
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }
    $(".service_1").addClass("active");
    $(".service_2").removeClass("active");
    $(".service_1").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    $(".service_2").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#service_1_content").animate({
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
    $("#service_2_content").animate({
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
    //-- step 1: reset and position div.service_1_content
    $("#service_2_content").css("display", "block");
    $("#service_2_content").css("position", "absolute");
    $("#service_2_content").css("top", "0px");
    $("#service_2_content").css("marginLeft", "100%");
    $("#service_2_content").css("opacity", "1.0");
    //-- setp 2: animate .buttons
    if (!this.mobileView) {
      $(".buttons").animate({
        //-- move left
        left: -(260 - ($(".service_2").width() / 2) - 28)
      }, {
        duration: 650,
        specialEasing: {
          left: "easeInOutQuint"
        }
      });
    }
    $(".service_1").removeClass("active");
    $(".service_2").addClass("active");
    $(".service_1").animate({
      //-- hide
      opacity: "0.2"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    $(".service_2").animate({
      //-- hide
      opacity: "1.0"
    }, {
      duration: 750,
      specialEasing: {
        opacity: "easeInOutQuint"
      }
    });
    //-- setp 3: animate .divs
    $("#service_2_content").animate({
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
    $("#service_1_content").animate({
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
    $("#service_1_content, #service_2_content").slideUp("slow", function () {
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
    if (target_state === "service_1" && this.state === "home") {
      this.homeToBusiness();
    } else if (target_state === "service_2" && this.state === "home") {
      this.homeToDev();
    } else if (target_state === "service_1" && this.state === "service_2") {
      this.businessToDev();
    } else if (target_state === "service_2" && this.state === "service_1") {
      this.devToBusiness();
    }
    this.state = target_state;
  };

  // This is the same as $(document).on('ready')
  $(function () {
    window.home = new HomeNavigator();
  });

})();