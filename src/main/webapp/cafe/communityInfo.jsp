<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="header.jsp" />

<section id="communityInfo">
	<div id="hBox">
		<h2>Post</h2>
	</div>
	<hr />
	<div id="communityInfoWrap">
		<div class="contentTitle">
			<h2>${community.title}</h2>
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
				<span>작성일</span> <span> <fmt:formatDate
						value="${community.date}" pattern="yyyy-MM-dd HH:mm:ss" />
				</span>
			</p>
			<p>
				<span>조회수</span> <span>44</span>
			</p>
		</div>
		<div class="content">
			<p>
				<img src="${community.img}" alt="">
			</p>
			<p>${community.content}</p>
		</div>
		<div class="like">
			<div>
				<img src="<c:url value="/cafe/img/heart-outline.svg"/>" alt="" />
			</div>
			<span>44</span>
		</div>
		<div class="control">
			<div class="left">
				<p>
					<a href="javascript:history.back()">목록보기</a>
				</p>
			</div>
			<div class="right">
				<p>
					<a href="<c:url value="/cafe"/>?action=communityInfoUpdate&id=${community.id}">수정 / 삭제</a>
				</p>
			</div>
		</div>
		<div class="commentControl">
			<div class="left">
				<span>댓글(114)</span>
			</div>
			<div class="center">
				<span><a href="#">등록순</a></span> | <span><a href="#">최신순</a></span>
			</div>
			<div class="right">
				<span>새로고침</span>
			</div>
		</div>
		<!-- 댓글 적고 수정하는 부분 -->
		<div class="commentInfo">
			<form action="<c:url value="/cafe"/>?action=addComment"  method="post">
				<div>
						<input type="hidden" id="communityId" name="communityId" value="${community.id}" />
						<label for="${comment.customerId}">댓글 작성자</label>
						<input type="hidden" id="${customerId}" name="customerId" />
						<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
						<input type="submit" value="등록" class="button">
				</div>
			</form>
			<!-- 댓글 적고 수정하는 부분 -->
			<form id="comment_form" action="<c:url value="/cafe"/>" method="post" data-id="${comment.id}">
				<input type="hidden" name="action" id="comment_form_action" /> 
				<input type="hidden" name="id" value="${comment.id}" />
				<div>
					<table>
						<tr>
							<td><textarea rows="5" cols="80" name="content" id="comment_content" placeholder="여러분의 소중한 댓글을 입력해주세요." required>${comment.content}</textarea></td>
							<td><button id="insertComment_button">등록</button></td>
						</tr>
					</table>
				</div>
				<c:if test="${comment.communityId==community.id}">
					<c:forEach var="comment" items="${commentList}">
						<div class="left">
							<c:if test="${comment.customerId == customer.id}">
								<span>${customer.nickName}</span>
							</c:if>
							<c:forEach var="customer" items="${customerList}">
								<c:if test="${comment.customerId == customer.id}">
									<span>${customer.nickName}</span>
								</c:if>
							</c:forEach>
						</div>
						<div class="center">
							<p>${comment.content}</p>
						</div>
						<div class="right">
							<span><button>좋아요</button></span> | <span><button>싫어요</button></span>
							<button id="deleteComment_button">삭제</button>
						</div>
					</c:forEach>
				</c:if>
			</form>
		</div>
	</div>
</section>

<jsp:include page="footer.jsp" />
