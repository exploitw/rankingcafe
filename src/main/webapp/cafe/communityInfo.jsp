<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
				<span>작성일</span>
				<span><fmt:formatDate value="${community.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</p>
			<p>
				<span>조회수</span>
				<span>미구현</span>
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
			<span>미구현</span>
		</div>
		<div class="control">
			<div class="left">
				<p>
					<a href="<c:url value="/cafe"/>?action=community">목록보기</a>
				</p>
			</div>
			<div class="right">
				<p>
					<c:if test="${sessionEMAIL != null }">
						<c:forEach var="customer" items="${customerList}">
							<c:if test="${sessionEMAIL == customer.email}">
								<c:if test="${customer.id == community.customerId}">
									<a href="<c:url value="/cafe"/>?action=communityInfoUpdate&id=${community.id}">수정 / 삭제</a>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</p>
			</div>
		</div>
		<br>
		<hr />
		<div class="commentControl">
			<div class="left">
				<span>댓글(미구현)</span>
			</div>
			<div class="center">
				<span><a href="#">등록순(미구현)</a></span> | <span><a href="#">최신순(미구현)</a></span>
			</div>
			<div class="right">
				<span>새로고침(미구현)</span>
			</div>
		</div>
		<!-- 댓글 등록 -->
			<div id="comment">
				<ul>
					<c:forEach items="${commentList}" var="comment">
						<li>
							<div class="textbox">
								<c:forEach var="customer" items="${customerList}">
									<c:if test="${comment.customerId == customer.id}">
										<p><span>작성자 : </span>${customer.nickName}</p>
										<p><span>작성 날짜 : </span><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd" /></p>
										<p><span>댓글 내용 : </span>${comment.content}</p>
										<%-- <c:if test="${customerId == comment.customerId}">
											<a href="<c:url value="/cafe"/>?action=reviewInfoUpdate&id=${comment.id}" data-id="${comment.id}">수정 / 삭제</a>
										</c:if> --%>
										<c:if test="${sessionEMAIL != null}">
											<c:choose>
												<c:when test="${sessionEMAIL == customer.email}">
													<c:if test="${customer.id == comment.customerId || customer.admin == true}">
													   <!--  <td><button class="button" id="updateComment_button">댓글 수정</button></td> -->
														<button class="button deleteComment_button" data-comment-id="${comment.id}">삭제</button>
													</c:if>
												</c:when>
												<c:otherwise>
													<c:if test="${sessionEMAIL == customer.email}">
														<c:if test="${customer.admin == true}">
														   <!--  <td><button class="button" id="updateComment_button">댓글 수정</button></td> -->
															<button class="button deleteComment_button" data-comment-id="${comment.id}">삭제</button>
														</c:if>
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		<div class="commentInfo">
			<%-- <form action="<c:url value="/cafe"/>?action=addComment"  method="post">
				<div>
					<input type="hidden" id="communityId" name="communityId" value="${community.id}" />
					<label for="${comment.customerId}">댓글 작성자</label>
					<input type="hidden" id="${customerId}" name="customerId" />
					<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
					<input type="submit" value="등록" class="button">
				</div>
			</form> --%>
			<!-- 댓글 수정 -->
			<form id="comment_form" action="<c:url value="/cafe"/>?action=deleteComment" method="post" data-id="${comment.id}">
			
				<input type="hidden" name="action" id="comment_form_action" /> 
				<input type="hidden" name="id" value="" id="comment_value" />
		
				<table class="jb-th-1">
					<c:forEach var="comment" items="${commentList}" varStatus="status">
					
					<c:if test="${community.id==comment.communityId }">
					
						<thead>
							<tr>
								<th>${status.index+1}</th>
								
								<th></th>
								<th><span><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:if test="${comment.communityId==community.id}">
									<c:forEach var="customer" items="${customerList}">
										<c:if test="${comment.customerId == customer.id}">
											<td><span>${customer.nickName}</span></td>
										</c:if>
									</c:forEach>
								</c:if>
								<td>${comment.content}</td>
								<c:if test="${sessionEMAIL != null}">
									<c:forEach var="customer" items="${customerList}">
										<c:if test="${sessionEMAIL == customer.email}">
											<c:choose>
												<c:when test="${customer.id == comment.customerId}">
												   <!--  <td><button class="button" id="updateComment_button">댓글 수정</button></td> -->
												
													<td><button class="button deleteComment_button" data-comment-id="${comment.id}">삭제</button></td>
												</c:when>
												<c:otherwise>
													<td><button>답글(미구현)</button>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:if>
							</tr>
						</tbody>
					</c:if>
					</c:forEach>
				 </table>
				
			</form>
			<form action="<c:url value="/cafe"/>?action=addComment"  method="post">
				<div>
					<input type="hidden" id="communityId" name="communityId" value="${community.id}" />
					<c:if test="${sessionEMAIL != null }">
						<c:forEach var="customer" items="${customerList}">
							<c:if test="${sessionEMAIL == customer.email}">
								<span>${customer.nickName}</span>
							</c:if>
						</c:forEach>
					</c:if>
					<input type="hidden" id="${customerId}" name="customerId" />
					<textarea rows="5" cols="80" name="content" id="comment_content" placeholder="여러분의 소중한 댓글을 입력해주세요." required></textarea>
					<input type="submit" value="등록" class="button">
				</div>
			</form>
		</div>
		<br>
		<hr />
		<!-- 댓글 가져오는 코드 -->
		<%-- <div class="commentDetail">
			<p class="username">
				<span>작성자</span>
				<c:forEach var="comment" items="${commentList}">
					<c:if test="${comment.customerId == customer.id}">
						<span>${customer.nickName}</span>
					</c:if>
				</c:forEach>
			</p>
			<p>
				<span>작성일</span>
				<span><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</p>
		</div>
		<div class="content">
			<p>${comment.content}</p>
		</div>
		<div class="like">
			<div>
				<img src="<c:url value="/cafe/img/heart-outline.svg"/>" alt="" />
			</div>
			<span>미구현</span>
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
		</div> --%>
	</div>
</section>

<jsp:include page="footer.jsp" />
