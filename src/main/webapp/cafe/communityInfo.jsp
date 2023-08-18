<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li> -->
				</ul>
				<!-- <form class="d-flex mt-3" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-success" type="submit">Search</button>
				</form> -->
			</div>
		</div>
	</div>
</nav>
<title>커뮤니티 상세페이지</title>
</head>
<body>
	<br />
	<br />
	<br />
	<c:if test="${sessionEMAIL != null }">
			${sessionEMAIL } 로그인 중<br />
			${sessionnickName } 로그인 중<br />
			${sessionCustomerId }로그인 중<br />
		<a href="<c:url value="/cafe"/>?action=logout"><button>로그아웃</button></a>
		<a href="<c:url value="/cafe"/>?action=login"><button>메인</button></a>
	</c:if>
	<footer class="footer mt-auto py-3 bg-light">
	<div class="container w-75 mt-5 mx-auto">
		<table style="table-layout: fixed; word-wrap: break-word; clear: both;">
			<thead>
				<tr>
					<c:forEach var="customer" items="${customerList}">
						<c:if test="${community.customerId == customer.id}">
							<td>${customer.nickName}</td>
						</c:if>
					</c:forEach>
					<td><fmt:formatDate value="${community.date}"
							pattern="yyyy-MM-dd HH:mm" /></td>
					<td>조회수, 추천수</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h2>${community.title}</h2></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td><img class="card-img-top" src="${community.img}">${community.content}</td>
				</tr>
			</tfoot>
		</table>
		<%-- <hr>
		<div class="card w-75 mx-auto">
			<img class="card-img-top" src="${news.img}">
			<div class="card-body">
				<h4 class="card-title">Date: ${news.date}</h4>
				<p class="card-text">Content: ${news.content}</p>
			</div>
		</div>
		<hr> --%>
		<a href="javascript:history.back()" class="btn btn-primary">Back</a>
		<a class="btn btn-primary" href="<c:url value="/cafe"/>?action=communityInfoUpdate&id=${community.id}" data-id="${community.id}">수정/삭제</a>
		</div>
	</footer>
</body>
</html>