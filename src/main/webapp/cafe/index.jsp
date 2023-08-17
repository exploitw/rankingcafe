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
홈 화면 출력됨<br />
	<c:if test="${sessionEMAIL != null }">
		${sessionEMAIL } 로그인 중<br />
		${sessionNickName } 로그인 중<br />
		${sessionCustomerId }로그인 중<br />
		<a href="<c:url value="/cafe"/>?action=logout"><button>로그아웃</button></a>
		<a href="<c:url value="/cafe"/>?action=community"><button>커뮤니티</button></a>
		<a href="<c:url value="/cafe"/>?action=mypage&id=${customerId}" data-id="${customerId}"><button>마이페이지</button></a>
		<a href="<c:url value="/cafe"/>/insertcafe.jsp"><button>카페등록</button></a>
		<a href="<c:url value="/cafe"/>?action=cafeList"><button>카페리스트</button></a>
		
	</c:if>
</body>
</html>