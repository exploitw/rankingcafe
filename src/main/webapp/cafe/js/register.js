$(function () {
  let $pw = $("section#register #password");
  let $pwCheck = $("section#register #passwordCheck");
  let pattern_pw = /^(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
  pattern_pw = new RegExp(pattern_pw);

  $pw.on("keyup", function (e) {
    if ($pw.val().length < 8 || $pw.val().length > 16) {
      $("section#register .pwLCheck").removeClass("checkPass");
      $("section#register .pwLCheck").removeClass("checkFalse");
      $("section#register .pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $("section#register .pwLCheck").addClass("checkFalse");
      $pw.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $("section#register .pwLCheck").text(
          "특수문자가 포함되어있지 않습니다."
        );
      } else {
        $("section#register .pwLCheck").removeClass("checkPass");
        $("section#register .pwLCheck").removeClass("checkFalse");
        $("section#register .pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $("section#register .pwLCheck").addClass("checkPass");
      }
    }
    if ($pw.val() == "") {
      $("section#register .pwLCheck").removeClass("checkPass");
      $("section#register .pwLCheck  ").removeClass("checkFalse");
      $("section#register .pwLCheck").text("");
      $pw.removeClass("addLine");
    }
  });

  $pw.on("change", function () {
    if ($pw.val().length < 8 || $pw.val().length > 16) {
      $("section#register .pwLCheck").removeClass("checkPass");
      $("section#register .pwLCheck").removeClass("checkFalse");
      $("section#register .pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $pw.val("");
      $pw.focus();
      $("section#register .pwLCheck").addClass("checkFalse");
      $pw.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $("section#register .pwLCheck").text(
          "특수문자가 포함되어있지 않습니다."
        );
        $pw.val("");
        $pw.focus();
      } else {
        $("section#register .pwLCheck").removeClass("checkPass");
        $("section#register .pwLCheck").removeClass("checkFalse");
        $("section#register .pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $("section#register .pwLCheck").addClass("checkPass");
      }
    }
  });

  $pwCheck.on("keyup", function (e) {
    if ($pw.val() === $pwCheck.val()) {
      $("section#register .pwCheck").removeClass("checkPass");
      $("section#register .pwCheck").removeClass("checkFalse");
      $("section#register .pwCheck").text("비밀번호가 일치합니다.");
      $("section#register .pwCheck").addClass("checkPass");
    } else {
      $("section#register .pwCheck").removeClass("checkPass");
      $("section#register .pwCheck").removeClass("checkFalse");
      $("section#register .pwCheck").text("비밀번호가 불일치합니다.");
      $("section#register .pwCheck").addClass("checkFalse");
    }
    if ($pwCheck.val() == "") {
      $("section#register .pwCheck").removeClass("checkPass");
      $("section#register .pwCheck").removeClass("checkFalse");
      $("section#register .pwCheck").text("");
    }
  });

  let $email = $("section#register #email");
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
      $("section#register .emailCheck").removeClass("checkPass");
      $("section#register .emailCheck").removeClass("checkFalse");
      $("section#register .emailCheck").addClass("checkFalse");
      $("section#register .emailCheck").text(
        "올바른 이메일 형식을 입력해 주세요."
      );
    } else {
      $("section#register .emailCheck").removeClass("checkPass");
      $("section#register .emailCheck").removeClass("checkFalse");
      $("section#register .emailCheck").addClass("checkPass");
      $("section#register .emailCheck").text("사용 가능한 이메일 입니다.");
    }
  });

  $("section#register #btn_submit").on("click", function () {
    event.preventDefault();
    let $formP = $("section#register #registerForm p input");
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
      if ($("section#register #joincheck1").is(":checked")) {
        $("section#register #registerForm").submit();
      } else {
        alert("체크 항목을 확인해주세요.");
      }
    }
    if (flag == 0) {
      alert("모든 항목을 입력해주세요.");
    }
  });
}); // ready
