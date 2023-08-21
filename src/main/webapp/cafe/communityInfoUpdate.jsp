<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />
<form id="community_form"
	action="<c:url value="/cafe"/>"
	method="post" data-id="${community.id}">
	<input type="hidden" name="action" id="community_form_action"  />
		
	
	<div class="container w-75 mt-5 mx-auto">
		<table
			style="table-layout: fixed; word-wrap: break-word; clear: both;">
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
					<td><h2>
							<input type="text" data-role="input" name="title"
								value="${community.title}" id="title" />
						</h2></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td><img class="card-img-top" src="${community.img}"
						name="img" id="img"> <input type="text" data-role="input"
						name="content" value="${community.content}" id="content" /></td>
				</tr>
			</tfoot>
		</table>
		<a href="javascript:history.back()" class="btn btn-primary"> Back
		</a>
		<button class="button" id="update_button">저장</button>
		<button class="button" id="delete_button">삭제</button>
	</div>
</form>

<jsp:include page="footer.jsp" />