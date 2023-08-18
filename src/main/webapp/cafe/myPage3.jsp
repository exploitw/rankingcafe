<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
	<section id="myPage3">
		<div id="hBox"><h2>My Post</h2></div>
		<ul>
			<li><a href="<c:url value="/cafe?action=myPage1"/>">내가 쓴 글</a></li>
        <li><a href="<c:url value="/cafe?action=myPage2"/>">좋아요 한 카페</a></li>
        <li class="active"><a href="<c:url value="/cafe?action=myPage3"/>">내 정보 수정</a></li>
		</ul>
		<hr />
		<div id="myPage3Wrap">
			<form id="pwCheckForm" action="">
				<p>
					<label class="hidden" for="email">아이디 입력</label>
					<input id="email" name="email" type="hidden" placeholder="email" value="로그인 한 아이디" readonly/>
					<span>로그인 한 아이디</span>
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
					<input type="submit" class="pwCheck" value="확인" />
				</p>
		</div>
	</section>
	
<jsp:include page="footer.jsp"/>