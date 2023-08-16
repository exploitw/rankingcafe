$(function () {
  $(window).load(function () {
    setTimeout(function () {
      $("header").addClass("active");
    }, 700); //timeout
  }); //load

  $(window).css("padding-bottom", "30px");
  calcMinHeight();
  function calcMinHeight() {
    let bodyH = $(window).outerHeight();
    let headerH = $("header").outerHeight();
    let frameH;
    if (win_ow > 1000) {
      frameH = 30;
    } else {
      frameH = 15;
    }
    $(
      "section#community, section#register, section#loginBox, section#myPage1, section#myPage3, section#edit"
    ).css("min-height", bodyH - headerH - 300 - 101 - frameH + "px");
  } // fn end clacminHeight

  let btn_menu = $(".btn_menu");
  let btn_close = $(".btn_close");

  btn_menu.on("click", function () {
    $(".btn").removeClass("active");
    $(".gnb").addClass("active");
    $(this).addClass("active");
  });

  btn_close.on("click", function () {
    $(".btn").removeClass("active");
    $(".gnb").removeClass("active");
    $(this).addClass("active");
  });

  $(".btn").on("click", function () {
    $(".gnb_sm").stop().fadeToggle();
  });

  $(window).resize(function () {
    calcMinHeight();
  }); //resize
}); // ready
