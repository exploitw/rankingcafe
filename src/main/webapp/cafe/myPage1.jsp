<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp"/>
	
 	<section id="myPage1">
      <div id="hBox"><h2>My Page</h2></div>
      <ul>
        <li class="active"><a href="<c:url value="/cafe?action=myPage&id=${customerId}"/>">내가 쓴 글</a></li>
        <li><a href="<c:url value="/cafe?action=myPage2&id=${customerId}"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">내 정보 수정</a></li>
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
      <div id="myPage1Wrap">
        <div class="tbContainer">
          <table>
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>

            <tbody>
            	<c:forEach var="community" varStatus="status" items="${communityListByCust}">
	              <tr>
	                <td>${status.index+1}</td>
	                <td>
	                  <a href="<c:url value="/cafe"/>?action=myCommunityInfo&id=${community[0]}"	data-id="${community[0]}">${community[1]}</a>
	                </td>
	                <td>${community[2]}</td>
	                <td><fmt:formatDate value="${community[3]}"	pattern="yyyy-MM-dd HH:mm" /></td>
	                <td>${community[4]}</td>
	              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
<!--         <p>
          <button id="btn_write"><a href="#">글쓰기</a></button>
        </p> -->
      </div>
    </section>

	
<jsp:include page="footer.jsp"/>