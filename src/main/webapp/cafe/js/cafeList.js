$(function () {
  $("div#cafeListWrap").addClass("active");

  $("section#cafeList li:eq(1)").addClass("mtop");
  item = "li";

  $(window).resize(() => {
    let $container = $("section#cafeList ul");
    $container.isotope({
      filter: item,
      transitionDuration: "0.8s",
      animationOptions: {
        duration: 750,
        easing: "linear",
        queue: false,
      },
    });
  }); //resize
}); // ready

$(window).on("load", () => {
  let $container = $("section#cafeList ul");
  $container.isotope({
    filter: item,
    transitionDuration: "0.8s",
    animationOptions: {
      duration: 750,
      easing: "linear",
      queue: false,
    },
  });

  $("aside#sideNav button").click(function () {
    $("aside#sideNav button").removeClass("active");
    $(this).addClass("active");

    item = $(this).attr("data-cate");
    $("section#cafeList li").removeClass("mtop");
    $("section#cafeList " + item + ":eq(1)").addClass("mtop");

    $container.isotope({
      filter: item,
      animationOptions: {
        duration: 750,
        easing: "linear",
        queue: false,
      },
    });
  }); //click
}); // load
