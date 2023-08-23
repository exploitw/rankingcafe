<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	<section id="register">
		<table border="1">
			<thead>
				<tr>
					<th>고객번호</th>
					<th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="customer" items="${customerList}">
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.email}</td>
						<td>${customer.nickName}</td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
						<td>${customer.admin}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</section>
 <jsp:include page="footer.jsp"/>