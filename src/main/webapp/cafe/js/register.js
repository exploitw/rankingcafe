$(function () {
  let $pwCheck = $("#passwordCheck");
  $pwCheck.on("keyup", function (e) {
    let $pw = $("#password").val();

    if ($pw === $pwCheck.val()) {
      $(".pwCheck").removeClass("checkPass");
      $(".pwCheck").removeClass("checkFalse");
      $(".pwCheck").text("비밀번호가 일치합니다.");
      $(".pwCheck").addClass("checkPass");
    } else {
      $(".pwCheck").removeClass("checkPass");
      $(".pwCheck").removeClass("checkFalse");
      $(".pwCheck").text("비밀번호가 불일치합니다.");
      $(".pwCheck").addClass("checkFalse");
    }
    if ($pwCheck.val() == "") {
      $(".pwCheck").removeClass("checkPass");
      $(".pwCheck").removeClass("checkFalse");
      $(".pwCheck").text("");
    }
  });

  let $email = $("#email");
  var pattern_email = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/;
  pattern_email = new RegExp(pattern_email);
  $email.on("keyup", function (e) {
    let email = $(this).val();
    if (pattern_email.test(email) == false) {
      $(".emailCheck").removeClass("checkPass");
      $(".emailCheck").removeClass("checkFalse");
      $(".emailCheck").addClass("checkFalse");
      $(".emailCheck").text("올바른 이메일 형식을 입력해 주세요.");
    } else {
      $(".emailCheck").removeClass("checkPass");
      $(".emailCheck").removeClass("checkFalse");
      $(".emailCheck").addClass("checkPass");
      $(".emailCheck").text("이메일 형식입니다.");
    }
    if (email == "") {
      $(".emailCheck").removeClass("checkPass");
      $(".emailCheck").removeClass("checkFalse");
      $(".emailCheck").text("");
    }
  });

  $("#btn_submit").on("click", function () {
    if ($("#joincheck1").is(":checked")) {
      $("#registerForm").submit();
    } else {
      alert("체크 항목을 확인해주세요.");
    }
  });
}); // ready
