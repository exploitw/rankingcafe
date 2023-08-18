<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
	<section id="edit">
		<div id="hBox"><h2>My Post</h2></div>
		<ul>
			<li><a href="<c:url value="/cafe?action=myPage1"/>">내가 쓴 글</a></li>
			<li><a href="<c:url value="/cafe?action=myPage2"/>">좋아요 한 카페</a></li>
			<li class="active"><a href="<c:url value="/cafe?action=myPage3"/>">내 정보 수정</a></li>
		</ul>
		<hr />
		<div id="editWrap">
			<form id="editForm" action="">
				<p>
					<label class="hidden" for="name">이름</label>
					<input id="name" type="text" placeholder="이름" readonly />
				</p>
				<p>
					<label class="hidden" for="email">이메일</label>
					<input id="email" type="email" placeholder="이메일" readonly />
				</p>
				<p>
					<label class="hidden" for="password">현재 비밀번호</label>
					<input id="password" type="password" placeholder="현재 비밀번호" />
				</p>
				<p>
					<label class="hidden" for="passwordCheck">비밀번호</label>
					<input id="passwordCheck" type="password" placeholder="비밀번호" />
				</p>
				<p>
					<label class="hidden" for="username">닉네임</label>
					<input id="username" type="text" placeholder="닉네임" />
				</p>
        <p>
          <label class="hidden" for="address">주소</label>
          <input id="address" name="address" type="text" placeholder="주소" />
        </p>
				<p>
					<label class="hidden" for="phone">휴대폰번호</label>
					<input id="phone" type="text" placeholder="휴대폰번호" />
				</p>
				<p>
					<input type="submit" id="saveBtn" value="저장" />
				</p>
			</form>
		</div>
	</section>
	
<jsp:include page="footer.jsp"/>