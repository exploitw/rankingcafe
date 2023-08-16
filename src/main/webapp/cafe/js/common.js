$(function () {
  win_info();
  function win_info() {
    winw = $(window).width();
    winh = $(window).height();
    win_iw = $(window).innerWidth();
    win_ih = $(window).innerHeight();
    win_ow = $(window).outerWidth();
    win_oh = $(window).outerHeight();
    scrt = $(window).scrollTop();
    scrl = $(window).scrollLeft();
  } //fn end

  $(window).resize(function () {
    win_info();
  }); //resize
  $(window).scroll(function () {
    win_info();
  }); //scroll
}); //ready
