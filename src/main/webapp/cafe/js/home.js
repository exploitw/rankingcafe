$(function () {
  let n = 1;
  let flag = 1;
  let intervalID;
  let timeoutID;

  intervalID = setInterval(function () {
    n++;
    if (n > 3) {
      n = 1;
    }
    change();
  }, 3000);

  function change() {
    $(".img_container").css("cursor", "none");
    $(".img_container").draggable("disable");
    $(".num1").html("0" + n);
    $(".img_container li").removeClass("active");
    $(".img_container .imgbox" + n).addClass("active");
    $(".img_container")
      .stop()
      .animate({ left: (n - 1) * -100 + "%" }, 1000, function () {
        $(".img_container").css("cursor", "grab");
        $(".img_container").draggable("enable");
        flag = 1;
      }); // animate end
  } // fn end change

  $(".imgbox1").addClass("active");
  $(".img_container").draggable({ axis: "x" });
  $(".img_container").mousedown(function (e) {
    down_x = e.clientX;
    clearInterval(intervalID);
    clearTimeout(timeoutID);
    timeoutID = setTimeout(function () {
      intervalID = setInterval(function () {
        n++;
        if (n > 3) {
          n = 1;
        }
        change();
      }, 3000); //interval
    }, 7000);
  }); // mousedown

  $(".img_container").mouseup(function (e) {
    if (flag == 1) {
      flag = 0;
    } else {
      return false;
    }
    up_x = e.clientX;
    if (down_x > up_x + 30) {
      n++;
    } else if (down_x < up_x - 30) {
      n--;
    }
    if (n > 3) {
      n = 3;
    }
    if (n < 1) {
      n = 1;
    }
    change();
  }); //mouseup

  homeVisualMotion();
  function homeVisualMotion() {
    $("#home_visual .wrap").css("transform", "translateY(" + scrt + "px)");
    if (win_ow >= 1000) {
      h = 120;
    } else {
      h = 60;
    }
  } //fn homeVisualMotion end

  homeMotion();
  function homeMotion() {
    $("#home_about > div").each(function () {
      t = $(this).offset().top;
      if (scrt >= t - winh * 0.8) {
        $(this).addClass("active");
      } else {
        $(this).removeClass("active");
      }
    }); //each

    $("#home_cafeCategory li").each(function () {
      t = $(this).offset().top;
      if (scrt >= t - winh * 0.8) {
        $(this).addClass("active");
      } else {
        $(this).removeClass("active");
      }
    }); //each
  }

  $(window).resize(function () {
    homeVisualMotion();
    homeMotion();
  }); //resize
  $(window).scroll(function () {
    homeVisualMotion();
    homeMotion();
  }); //scroll
}); // ready
