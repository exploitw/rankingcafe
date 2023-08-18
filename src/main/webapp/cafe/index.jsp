<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />
	<a href="<c:url value="/cafe"/>?action=logout" class="btn btn-primary">로그아웃</a>
	<a href="<c:url value="/cafe"/>?action=community" class="btn btn-primary"><button>커뮤니티</button></a>
	<a href="<c:url value="/cafe"/>?action=mypage&id=${customerId}"
		data-id="${customerId}" class="btn btn-primary"><button>마이페이지</button></a>
	<a href="<c:url value="/cafe"/>/insertcafe.jsp" class="btn btn-primary"><button>카페등록</button></a>
	<a href="<c:url value="/cafe"/>?action=cafeList" class="btn btn-primary"><button>카페리스트</button></a>
<jsp:include page="footer.jsp" />