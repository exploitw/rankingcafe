<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
<section id="myPage2">
      <div id="hBox"><h2>My Page</h2></div>
      <ul>
        <li><a href="<c:url value="/cafe?action=myPage&id=${customerId}"/>">내가 쓴 글</a></li>
        <li class="active"><a href="<c:url value="/cafe?action=myPage2&id=${customerId}"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">내 정보 수정</a></li>
      </ul>
      <hr />
      <div id="myPage2Wrap">
        <ul class="container">
					<%-- <c:forEach var="like" items="${likeList}" varStatus="status"> --%>
						<li>
							<div class="likeBox">
								<a href="<c:url value="/cafe/action=&id="/>" class="thumb"><img src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>" alt=""	/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>ad</h3>
										<button class="heartBtn">
											<span class="material-symbols-outlined icon">favorite</span>
										</button>
										<p class="tag">asd</p>
									</div>
								</div>
							</div>
						</li>
					<%-- </c:forEach> --%>
        </ul>
      </div>
    </section>
    
    <script>
      $("section#myPage2 .heartBtn").on("click", function () {
        $(this).find(".icon").toggleClass("true");
      });
    </script>
	
<jsp:include page="footer.jsp"/>