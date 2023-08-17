<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 등록하기</title>
</head>
<body>
    <div class="navbar">
      <a href="#" id="logo">
        <img src="images/logo.png" width="149">
        </a>
        <ul id="menu">
          <li><a href="#">contact</a></li>
          <li><a href="#">shop</a></li>
          <li><a href="#">cart</a></li>
          <li><a href="#">login</a></li>
          <a href="<c:url value="/cafe"/>/index.jsp"><button>메인으로</button></a>
        </ul>
    </div>
    <div class="hero-header"></div>  
    	 <div class="products">
      <h3>CAFE</h3>
     <div class="cafe-list">
    <c:forEach var = "cafe" items="${cafeList}">
    	 <a href="<c:url value="/cafe"/>?action=cafeInfo&id=${cafe.id}" data-id="${cafe.id}" class="cafe">
       		<img class="cafe-img" src="${cafe.img}">
          <div class="cafe-name">
           ${cafe.name}
          </div>
          <div class="cafe-address">${cafe.address}</div>
        </a>
    </c:forEach>
   
     
       
        
    <div class="footer">
      <a href="http://facebook.com">
        <img src="images/facebook.png"height="20">
      </a>
      <a href="http://instagram.com">
        <img src="images/instagram.png"height="20">
      </a>
      <a href="http://twitter.com">
        <img src="images/twitter.png"height="20">
      </a>
    </div>
  </body>
</html>