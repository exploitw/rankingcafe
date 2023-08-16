<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>

  <section id="loginBox">
    <div id="hBox"><h2>Login</h2></div>
    <div id="login_wrap">
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
            <input type="submit" id="loginBtn" value="로그인" class="login"/>
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
    </div>
  </section>
  
<jsp:include page="footer.jsp"/>