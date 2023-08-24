<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
	<section id="edit">
		<div id="hBox"><h2>My Page</h2></div>
		<ul>
			<li><a href="<c:url value="/cafe?action=myPage&id=${customerId}"/>">내가 쓴 글</a></li>
      		<li><a href="<c:url value="/cafe?action=myPage2&id=${customerId}"/>">좋아요 한 카페</a></li>
      		<li class="active"><a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">내 정보 수정</a></li>
      		<c:if test="${sessionEMAIL != null }">
				<c:forEach var="customer" items="${customerList}">
					<c:if test="${sessionEMAIL == customer.email}">
						<c:if test="${customer.admin == true}">
							<li><a href="<c:url value="/cafe"/>?action=adminPage1&id=${customerId}">관리자</a></li>
						</c:if>
					</c:if>
				</c:forEach>
			</c:if>
		</ul>
		<hr />
		<div id="editWrap">
			<form id="editForm" action="<c:url value="/cafe?action=updateCustomer"/>" method="post">
				<input name="id" type="hidden" value="${customerId}"/>
				<p>
					<label class="hidden" for="name">이름</label>
					<input id="name" name="name" type="text" value="${customer.name}" placeholder="이름" readonly />
				</p>
				<p>
					<label class="hidden" for="email">이메일</label>
					<input id="email" name="email" type="email" value="${customer.email}" placeholder="이메일" readonly />
				</p>
				<p>
					<label class="hidden" for="password">현재 비밀번호</label>
					<input id="password" type="password" placeholder="현재 비밀번호" />
				</p>
				<p>
					<label class="hidden" for="passwordCheck">비밀번호</label>
					<input id="passwordCheck" name="password" type="password" placeholder="비밀번호" />
					<span class="pwLCheck"></span>
				</p>
				<p>
					<label class="hidden" for="username">닉네임</label>
					<input id="username" name="nickName" type="text" value="${customer.nickName}" placeholder="닉네임" />
				</p>
		        <p>
		          <label class="hidden" for="address">주소</label>
		          <input id="address" name="address" type="text" value="${customer.address}" placeholder="주소" />
		        </p>
				<p>
					<label class="hidden" for="phone">휴대폰번호</label>
					<input id="phone" name="phone" type="text" value="${customer.phone}" placeholder="휴대폰번호" />
				</p>
				<p>
					<label class="hidden" for="admin">관리자권한</label>
					<input id="admin" name="admin" type="hidden" value="${customer.admin}" />
				</p>
				<p>
					<a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">취소</a>
					<input type="submit" id="saveBtn" value="저장" />
					<input type="submit" id="delBtn" value="회원탈퇴" />
				</p>
			</form>
		</div>
	</section>
	
	<script>
		let custEdit = ${jsonArrayStringCustomer};
	</script>
	
<jsp:include page="footer.jsp"/>