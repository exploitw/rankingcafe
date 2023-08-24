<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="header.jsp" />

<section id="community">
	<div id="hBox">
		<h2>Community</h2>
	</div>
	<div id="communityWrap">
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
					<c:forEach var="community" items="${communityList}" varStatus="status">
						<tr>
							<%-- <td>${community.id}</td> --%>
							<!-- 순차 번호 코드 -->
							<td>${fn:length(communityList) - status.index}</td>
							<td><a class="community_title" href="<c:url value="/cafe"/>?action=communityInfo&id=${community.id}" data-id="${community.id}">${community.title}</a></td>
							<c:forEach var="customer" items="${customerList}">
								<c:if test="${community.customerId == customer.id}">
									<td>${customer.nickName}</td>
								</c:if>
							</c:forEach>
							<td><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${community.view}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="btn_Wrtie">
			<form id="goto_form" action="<c:url value="/cafe"/>?action=writing" method="post">
				<input type="hidden" name="action" value="community" />
				<input type="hidden" name="id" value="-1" />
				<input type="submit" value="글쓰기" id="add_button" />
			</form>
		</div>
	</div>
</section>
<script>
	let hasOrdering = ${hasOrdering};
</script>

<jsp:include page="footer.jsp" />