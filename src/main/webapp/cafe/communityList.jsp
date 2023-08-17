<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<!-- 상단바 -->
<nav class="navbar navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<a class="navbar-brand" href="<c:url value="/cafe"/>?action=community">COMMUNITY</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
			aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
			id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">COMMUNITY</h5>
				<button type="button" class="btn-close btn-close-white"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="<c:url value="/cafe"/>?action=login">HOME</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/cafe"/>?action=community">COMMUNITY</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<title>Community</title>
</head>

<body>
	<br />
	<br />
	<br />
	<footer class="footer mt-auto py-3 bg-light">
		<div class="container">

			<c:if test="${sessionEMAIL != null }">
			${sessionEMAIL } 로그인 중<br />
			${sessionnickName } 로그인 중<br />
			${sessionCustomerId }로그인 중<br />
				<a href="<c:url value="/cafe"/>?action=logout"><button>로그아웃</button></a>
				<a href="<c:url value="/cafe"/>?action=login"><button>메인</button></a>
			</c:if>
			<table class="table" data-role="table" data-rows="-1"
				data-show-pagination="false" data-show-search="false"
				data-show-rows-steps="false" data-show-table-info="false">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody id="community">
					<c:forEach var="community" items="${communityList}">
						<tr>
							<td>${community.id}</td>
							<td><a class="community_title"
								href="<c:url value="/cafe"/>?action=communityInfo&id=${community.id}"
								data-id="${community.id}">${community.title}</a></td>
							<c:forEach var="customer" items="${customerList}">
								<c:if test="${community.customerId == customer.id}">
									<td>${customer.nickName}</td>
								</c:if>
							</c:forEach>
							<td><fmt:formatDate value="${community.date}"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container">
				<form id="goto_form" action="<c:url value="/cafe"/>?action=writing"
					method="post">
					<input type="hidden" name="action" value="community" /> <input
						type="hidden" name="id" value="-1" /> <input type="submit"
						value="추가" id="add_button" />
				</form>
			</div>
			<span class="text-muted">Place sticky footer content here.</span>
		</div>
	</footer>
</body>
</html>