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
					<a href="<c:url value="/cafe"/>?action=community">목록보기</a>
				</p>
			</div>
			<div class="right">
				<p>
					<a
						href="<c:url value="/cafe"/>?action=communityInfoUpdate&id=${community.id}">글
						수정 / 삭제</a>
				</p>
			</div>
		</div>
		<%-- <div class="commentControl">
			<div class="left">
				<span>댓글(114)</span> <span><a href="#">등록순</a></span> | <span><a href="#">최신순</a></span>
			</div>
			<div class="right">
				<span>새로고침</span>
			</div>
		</div>
		<div class="comment">
			<div class="left">
				<c:forEach var="comment" items="${commentList}">
					<c:if test="${comment.customerId == customer.id}">
						<span>${customer.nickName}</span>
					</c:if>
				</c:forEach>
			</div>
			<div class="right">
				<span><button>좋아요</button></span> <span><button>싫어요</button></span>
			</div>
		</div> --%>
	</div>
</section>

<jsp:include page="footer.jsp" />
