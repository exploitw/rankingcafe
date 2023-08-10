<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
홈 화면 출력됨zxc<br />
	<c:if test="${sessionEMAIL != null }">
	${sessionEMAIL } 로그인 중<br />
	${sessionnickName } 로그인 중<br />
	<!-- <a href="/rankingcafe/cafe/login.jsp"><button>로그아웃</button></a> -->
	<a href="cafe?action=logout"><button>로그아웃</button></a>
	</c:if>

</body>
</html>