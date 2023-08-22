<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />

<section id="communityInfo">
	<div id="hBox">
		<h2>Post</h2>
	</div>
	<hr />
	
	<form id="community_form" action="<c:url value="/cafe"/>" method="post" data-id="${community.id}" enctype="multipart/form-data">
		<input type="hidden" name="action" id="community_form_action" /> 
		<input type="hidden" name="id" value="${community.id}" />
		
		<div id="communityInfoWrap">
		<div class="contentTitle">
			<h2><input type="text" data-role="input" name="title" id="title" value="${community.title}" /></h2>
		</div>
		<div class="contentDetail">
			<p class="username">
				<span>작성자</span>
				<c:forEach var="customer" items="${customerList}">
					<c:if test="${community.customerId == customer.id}">
						<span>${customer.nickName}</span>
					</c:if>
				</c:forEach>
			</p>
			<p>
				<span>작성일</span>
				<span><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</p>
			<p>
				<span>조회수</span>
				<span>44</span>
			</p>
		</div>
		<div class="content">
			<p>
				<input type="file" class="form-control" name="file" id="img" value="${community.img}" multiple />
				<%-- <img src="${community.img}" alt=""> --%>
				<img class="cafe-img" src="${community.img}" id="${community.img}">
			</p>
			<p><textarea rows="20" cols="60" name="content" id="content" required >${community.content}</textarea></p>
		</div>
		<div class="like">
			<div><img src="<c:url value="/cafe/img/heart-outline.svg"/>" alt="" /></div>
			<span>44</span>
		</div>
		<div class="control">
			<div class="left">
				<p><a href="javascript:history.back()">취소</a></p>
			</div>
			<div class="right">
				<p>
					<button class="button" id="updateCommunity_button">저장</button>
					<button class="button" id="deleteCommunity_button">삭제</button>
				</p>
			</div>
		</div>
	</div>
		
		<%-- <div class="container w-75 mt-5 mx-auto">
			<table style="table-layout: fixed; word-wrap: break-word; clear: both;">
				<thead>
					<tr>
						<c:forEach var="customer" items="${customerList}">
							<c:if test="${community.customerId == customer.id}">
								<td>${customer.nickName}</td>
							</c:if>
						</c:forEach>
						<td><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>조회수, 추천수</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<h2><input type="text" data-role="input" name="title" id="title" value="${community.title}" /></h2>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<img class="card-img-top" src="${community.img}">
							<input type="file" class="form-control" name="file" id="img" value="${community.img}" multiple />
							<input type="text" data-role="input" name="content" id="content" value="${community.content}" />
						</td>
					</tr>
				</tfoot>
			</table>
			<a href="javascript:history.back()" class="btn btn-primary">취소</a>
			<button class="button" id="update_button">저장</button>
			<button class="button" id="delete_button">삭제</button>
		</div> --%>
	</form>

</section>

<jsp:include page="footer.jsp" />