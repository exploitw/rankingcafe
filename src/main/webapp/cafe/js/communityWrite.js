$(function () {
  $(".btn_container button[type=submit]").on("click", () => {
    $("#communityWriteForm").submit();
  });
  $(".btn_container button[type=reset]").on("click", () => {
    $("#communityWriteForm input").val("");
  });
}); // ready
