<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cafe</title>

    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&amp;display=swap"
      rel="stylesheet"
    />
    <!-- 나눔고딕 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Hind+Guntur:wght@300;400;500;600;700&amp;display=swap"
      rel="stylesheet"
    />
    <!-- Hind+Guntur -->
    <link
      href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;200;300;400;600;700;800;900&amp;display=swap"
      rel="stylesheet"
    />
    <!-- en -->
    <link href="<c:url value="/cafe/css/reset.css"/>" rel="stylesheet" />
    <link href="<c:url value="/cafe/css/login.css"/>" rel="stylesheet" />
    <!-- <script type="text/javascript">
    function loginConfirm() {
    	var email = document.getElementById('email').value;
    	var password = document.getElemnetByid('password').value;
    	
    	if(email.length < 12) {
    		window.alert('이메일 형식이 잘못됐습니다. 다시 적어주세요.');
    		document.getElementById('email').value='';
    		document.getElementById('email').focus();
    	} else {}
    }
    </script> -->
  </head>
  <body>
  <input type="submit" id="loginBtn" value="커뮤니티" class="community" />
            <a href="<c:url value="/cafe?action=community"/>" id="community">커뮤니티</a>
    <div id="login_wrap">
      <section id="loginBox">
        <h2>login</h2>
        <form id="loginForm" action="<c:url value="/cafe"/>?action=login"  method="post">
          <p>
            <label class="hidden" for="email">이메일 입력</label>
            <input id="email" name="email" type="email" placeholder="Email" />
          </p>
          <p>
            <label class="hidden" for="password">비밀번호 입력</label>
            <input
              id="password"
              name="password"
              type="password"
              placeholder="Password"
            />
          </p>
          <p>
            <input type="submit" id="loginBtn" value="로그인" class="login" onchange="loginConfirm()"/>
            <a href="<c:url value="/cafe?action=signup"/>" id="signup">회원가입</a>
          </p>
          <p>
            <label class="hidden" for="check1">아이디 저장시 체크</label>
            <input id="check1" type="checkbox" /><span>아이디 저장</span>
            <label class="hidden" for="check2">자동 로그인시 체크</label>
            <input id="check2" type="checkbox" /><span>자동 로그인</span>
            <label class="hidden" for="check3">보안 로그인시 체크</label>
            <input id="check3" type="checkbox" /><span>보안 로그인</span>
            <a href="#">아이디 / 비밀번호 찾기</a>
          </p>
          <p>
            <input type="submit" class="btn_kakao" value="카카오 로그인" />
            <input type="submit" class="btn_naver" value="네이버 로그인" />
            <input type="submit" class="btn_google" value="구글 로그인" />
          </p>
        </form>
      </section>
    </div>
  </body>
</html>
