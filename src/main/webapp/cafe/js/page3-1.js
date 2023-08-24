$(function () {
  let $pw = $("section#edit #password");
  let $pwCheck = $("section#edit #passwordCheck");
	let pattern_pw = /^(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
  pattern_pw = new RegExp(pattern_pw);

  $pwCheck.on("keyup", function (e) {
    if ($pwCheck.val().length < 8 || $pwCheck.val().length > 16) {
      $("section#edit .pwLCheck").removeClass("checkPass");
      $("section#edit .pwLCheck").removeClass("checkFalse");
      $("section#edit .pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $("section#edit .pwLCheck").addClass("checkFalse");
      $pwCheck.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $("section#edit .pwLCheck").text(
          "특수문자가 포함되어있지 않습니다."
        );
      } else {
        $("section#edit .pwLCheck").removeClass("checkPass");
        $("section#edit .pwLCheck").removeClass("checkFalse");
        $("section#edit .pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $("section#edit .pwLCheck").addClass("checkPass");
      }
    }
    if ($pwCheck.val() == "") {
      $("section#edit .pwLCheck").removeClass("checkPass");
      $("section#edit .pwLCheck").removeClass("checkFalse");
      $("section#edit .pwLCheck").text("");
      $pwCheck.removeClass("addLine");
    }
  });

  $pwCheck.on("change", function () {
    if ($pwCheck.val().length < 8 || $pwCheck.val().length > 16) {
      $("section#edit .pwLCheck").removeClass("checkPass");
      $("section#edit .pwLCheck").removeClass("checkFalse");
      $("section#edit .pwLCheck").text(
        "비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다."
      );
      $pwCheck.val("");
      $pwCheck.focus();
      $("section#edit .pwLCheck").addClass("checkFalse");
      $pwCheck.addClass("addLine");
    } else {
      if (pattern_pw.test($(this).val()) == false) {
        $("section#edit .pwLCheck").text(
          "특수문자가 포함되어있지 않습니다."
        );
        $pwCheck.val("");
        $pwCheck.focus();
      } else {
        $("section#edit .pwLCheck").removeClass("checkPass");
        $("section#edit .pwLCheck").removeClass("checkFalse");
        $("section#edit .pwLCheck").text("사용 가능한 비밀번호 입니다.");
        $("section#edit .pwLCheck").addClass("checkPass");
      }
    }
  });
  
  $("section#edit #saveBtn").on("click", function (e) {
	  e.preventDefault();
	  let nowPw = custEdit[0].password;
	  
	  if($pw.val() == ""){
		  if($pwCheck != ""){
			  alert("비밀번호가 일치하지 않습니다.");
			  return false;
		  }
		  $pwCheck.val(nowPw);
		  $("form#editForm").submit();
	  }else{
		   if($pw.val() != nowPw){
			  alert("비밀번호가 일치하지 않습니다.");
			  return false;
		   }else{
			   $("form#editForm").submit();
		   }
	  }
	  
  });
});
