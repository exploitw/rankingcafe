<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>

	<section id="myPage1">
      <div id="hBox"><h2>Admin</h2></div>
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
				<th>이름</th>
				<th>이메일</th>
				<th>닉네임</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>관리자권한</th>
				<th></th>
              </tr>
            </thead>

			<tbody>
				<c:forEach var="customer" items="${customerList}" varStatus="status">
					<tr>
					<form id="editForm" action="<c:url value="/cafe?action=updateAdminCustomer"/>" method="post">
						<td>${customer.id}</td>
						<!-- 순차 번호 코드 -->
						<%-- <td>${status.index+1}</td> --%>
						<td>${customer.name}</td>
						<td>${customer.email}</td>
						<td>${customer.nickName}</td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
						<td>${customer.admin}</td>
						<td><a href="<c:url value="/cafe"/>?action=adminPage1_2&id=${customer.id}" data-id="${customer.id}">수정</a></td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
          </table>
        </div>
      </div>
    </section>
<script>
	let hasOrdering = ${hasOrdering};
</script>
	
<jsp:include page="footer.jsp"/>