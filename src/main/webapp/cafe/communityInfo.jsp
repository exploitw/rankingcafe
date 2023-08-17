<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 정보</title>
</head>
<body>
	<c:if test="${sessionEMAIL != null }">
		${sessionEMAIL } 로그인 중<br />
		${sessionnickName } 로그인 중<br />
		${sessionCustomerId }로그인 중<br />
		<a href="<c:url value="/cafe"/>?action=logout"><button>로그아웃</button></a>
		<a href="<c:url value="/cafe"/>?action=community"><button>커뮤니티</button></a>
	</c:if>

	<div class="container">
		<label>커뮤니티 수정</label> <br /> <br />
		<form id="community_form"
			action="<c:url value="/cafe"/>?action=community" method="post">
			<input type="hidden" name="action" id="community_form_action" />
			<div class="row">
				<table border="1">
					<thead>
						<tr>
							<th><input type="text" data-role="input" name="customerid"
								value="${community.customerId}" id="customerId" readonly /></th>
							<th><input type="text" data-role="input" name="date"
								<fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm"/>
								id="date" readonly /></th>
						</tr>
					</thead>
					<%-- <tbody>
						<input type="text" data-role="input" name="content" value="${community.content}" id=content />
						<input type="img" data-role="input" name="img" value="${community.img}" id="img" />
					</tbody> --%>
				</table>


				<%-- <label class="cell-2">번호</label>
				<div class="cell-10">
					<input type="number" data-role="input" name="id"
						value="${community.id}" id="id" readonly />
				</div>
			</div>
			<div class="row">
				<label class="cell-2">제목</label>
				<div class="cell-10">
					<input type="text" data-role="input" name="title"
						value="${community.title}" id="title" />
				</div>
			</div>
			<div class="row">
				<label class="cell-2">내용</label>
				<div class="cell-10">
					<input type="text" data-role="input" name="content"
						value="${community.content}" id="publisher" />
				</div>
			</div>
			<div class="row">
				<label class="cell-2">가격</label>
				<div class="cell-10">
					<input type="text" data-role="input" name="price"
						value="${community.price}" id="price" />
				</div>
			</div>
			<div class="row">
				<div class="cell-3"></div>
				<div class="cell-3">
					<button class="button" id="update_button">저장</button>
					<button class="button" id="delete_button">삭제</button>
				</div>
				<div class="cell-3"></div>
				<div class="cell-3"></div>
			</div> --%>
		</form>
	</div>
	<script src="communityInfo.js"></script>
</body>
</html>