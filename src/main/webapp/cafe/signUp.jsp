<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>

	<section id="register">
		<div id="hBox"><h2>Register</h2></div>
		<div id="registerWrap">
			<form id="registerForm" action="<c:url value="/cafe"/>?action=join" method="post">
				<p>
					<label class="hidden" for="name">이름</label>
					<input id="name" name="name" type="text" placeholder="이름" />
				</p>
				<p>
					<label class="hidden" for="email">이메일</label>
					<input id="email" name="email" type="email" placeholder="이메일" />
					<span class="emailCheck"></span>
				</p>
				<p>
					<label class="hidden" for="password">비밀번호</label>
					<input id="password" name="password" type="password" placeholder="비밀번호" />
					<span class="pwLCheck"></span>
				</p>
				<p>
					<label class="hidden" for="passwordCheck">비밀번호 확인</label>
					<input id="passwordCheck" type="password" placeholder="비밀번호 확인" />
					<span class="pwCheck"></span>
				</p>
				<p>
					<label class="hidden" for="nickName">닉네임</label>
					<input
						id="nickName"
						name="nickName"
						type="text"
						placeholder="닉네임"
					/>
				</p>
				<p>
					<label class="hidden" for="address">주소</label>
					<input id="address" name="address" type="text" placeholder="주소" />
				</p>
				<p>
					<label class="hidden" for="phone">휴대폰번호</label>
					<input id="phone" name="phone" type="text" placeholder="휴대폰번호" />
				</p>
				<p>
					<label class="hidden" for="admin">관리자</label>
					<input class="hidden" id="admin" name="admin" type="checkbox" value="false"/>
				</p>
				<p class="jcheck1">
					<label class="hidden" for="joincheck1">14세 이상이면 체크</label>
					<input id="joincheck1" type="checkbox" />
					<span>14세 이상입니다.(필수)</span>
					<i>
						*회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의
						개인정보 수집을 최소화하고 편리한 회원가입을 제공합니다.
					</i>
				</p>
				<p>
					<button id="btn_submit" type="submit">동의하고 가입완료</button>
				</p>
			</form>
		</div>
	</section>

  
  <jsp:include page="footer.jsp"/>