$(function () {
  let $pw = $("#password");
  let $pwCheck = $("#passwordCheck");
  let pattern_pw = /^(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
  pattern_pw = new RegExp(pattern_pw);

  $pw.on("keyup", function (e) {
    if ($pw.val().length < 8 || $pw.val().length > 16) {
      $(".pwLCheck").removeClass("checkPass");
      $(".pwLCheck").removeClass("checkFalse");
      $(".pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $(".pwLCheck").addClass("checkFalse");
      $pw.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $(".pwLCheck").text("특수문자가 포함되어있지 않습니다.");
      } else {
        $(".pwLCheck").removeClass("checkPass");
        $(".pwLCheck").removeClass("checkFalse");
        $(".pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $(".pwLCheck").addClass("checkPass");
      }
    }
    if ($pw.val() == "") {
      $(".pwLCheck").removeClass("checkPass");
      $(".pwLCheck  ").removeClass("checkFalse");
      $(".pwLCheck").text("");
      $pw.removeClass("addLine");
    }
  });

  $pw.on("change", function () {
    if ($pw.val().length < 8 || $pw.val().length > 16) {
      $(".pwLCheck").removeClass("checkPass");
      $(".pwLCheck").removeClass("checkFalse");
      $(".pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $pw.val("");
      $pw.focus();
      $(".pwLCheck").addClass("checkFalse");
      $pw.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $(".pwLCheck").text("특수문자가 포함되어있지 않습니다.");
        $pw.val("");
        $pw.focus();
      } else {
        $(".pwLCheck").removeClass("checkPass");
        $(".pwLCheck").removeClass("checkFalse");
        $(".pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $(".pwLCheck").addClass("checkPass");
      }
    }
  });

  $pwCheck.on("keyup", function (e) {
    if ($pw.val() === $pwCheck.val()) {
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

  $email.on("change", function () {
    let email = $(this).val();
    if (pattern_email.test(email) == false) {
      $email.val("");
      $email.focus();
    }
  });

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
      $(".emailCheck").text("사용 가능한 이메일 입니다.");
    }
  });

  $("#btn_submit").on("click", function () {
    event.preventDefault();
    let $formP = $("#registerForm p input");
    let flag = 0;
    console.log($formP[0].value);

    for (let i = 0; i < 7; i++) {
      if ($formP[i].value != "") {
        flag = 1;
      } else {
        flag = 0;
      }
    }
    if (flag == 1) {
      if ($("#joincheck1").is(":checked")) {
        $("#registerForm").submit();
      } else {
        alert("체크 항목을 확인해주세요.");
      }
    }
    if (flag == 0) {
      alert("모든 항목을 입력해주세요.");
    }
  });
}); // ready
