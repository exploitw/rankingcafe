<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
	<section id="myPage3">
		<div id="hBox"><h2>My Page</h2></div>
		<ul>
        <li><a href="<c:url value="/cafe?action=myPage&id=${customerId}"/>">내가 쓴 글</a></li>
        <li><a href="<c:url value="/cafe?action=myPage2&id=${customerId}"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">내 정보 수정</a></li>
        <c:if test="${sessionEMAIL != null }">
			<c:forEach var="customer" items="${customerList}">
				<c:if test="${sessionEMAIL == customer.email}">
					<c:if test="${customer.admin == true}">
						<li class="active"><a href="<c:url value="/cafe"/>?action=adminPage1&id=${customerId}">관리자</a></li>
					</c:if>
				</c:if>
			</c:forEach>
		</c:if>
		</ul>
		<hr />
		<div id="myPage3Wrap">
			<form id="pwCheckForm" action="<c:url value="/cafe"/>?action=adminPage1_1&id=${customerId}" method="post">
				<p>
					<label class="hidden" for="email">아이디 입력</label>
					<input id="email" name="email" type="hidden" placeholder="email" value="${customer.email}" readonly/>
					<span>${customer.email}</span>
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
	<script>
		let custJson = ${jsonArrayStringCustomer};
		$("section#myPage3 input[type=submit]").on("click", function(e){
			e.preventDefault();
			let myPw = $("section#myPage3 #password").val();
			if(custJson[0].password === myPw){
				$("section#myPage3 #pwCheckForm").submit();
			}else{
				alert("비밀번호가 틀렸습니다.");
			}
		})
	</script>
	
<jsp:include page="footer.jsp"/>