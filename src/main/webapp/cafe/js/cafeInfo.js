$(function () {
  reviewMotion();
  function reviewMotion() {
    $("div#review li").each(function () {
      t = $(this).offset().top;
      h = $(this).innerHeight();
      scale = 1 - Math.abs((scrt - (t - winh * 0.5 + h * 0.5)) * 0.0002);
      opacity = 1 - Math.abs((scrt - (t - winh * 0.5 + h * 0.5)) * 0.002);
      $(this).css("transform", "scale(" + scale + ")");
      $(this).css("opacity", opacity);
    });
  } // fn end reviewMotion

  $("section#cafeInfo #cafeInfoWrap .wr").on("click", function () {
    event.preventDefault();
    $(".modal").fadeIn();
  });

  $(
    "section#cafeInfo #cafeInfoWrap .btn_container .btn1 button:first-child()"
  ).click(function () {
    event.preventDefault();
    $(".modal").fadeOut();
    $("body").css("overflow", "auto");
  }); //click
  $(
    "section#cafeInfo #cafeInfoWrap .btn_container .btn2 button[type=submit]"
  ).click(function () {
    event.preventDefault();
    $("section#cafeInfo #cafeInfoWrap #reviewWr").submit();
  }); //click
  $(
    "section#cafeInfo #cafeInfoWrap .btn_container .btn2  button[type=reset]"
  ).on("click", () => {
    $(
      "section#cafeInfo #cafeInfoWrap input[name=title], section#cafeInfo #cafeInfoWrap textarea"
    ).val("");
  });
  

  $(window).resize(function () {
    reviewMotion();
  }); //resize
  $(window).scroll(function () {
    reviewMotion();
  }); //scroll
}); // ready
