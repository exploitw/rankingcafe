<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp" />

<div id="cafeListWrap">
	<aside id="sideNav">
		<nav>
			<ul>
				<li>
					<button class="catebtn1 active" data-cate="li">All</button>
				</li>
				<li>
					<button class="catebtn2" data-cate=".dessert">Dessert</button>
				</li>
				<li>
					<button class="catebtn3" data-cate=".mood">Mood</button>
				</li>
				<li>
					<button class="catebtn4" data-cate=".popularity">
						Popularity</button>
				</li>
			</ul>
		</nav>
	</aside>
	<article id="content">
		<section id="cafeList">
			<div id="hBox">
				<h2>Category</h2>
			</div>
			<div id="ListContainer">
				<ul>
					<c:forEach var="cafe" items="${cafeList}">
						<li class="dessert">
							<div class="listBox">
								<a href="<c:url value="/cafe"/>?action=cafeInfo&id=${cafe.id}"
									data-id="${cafe.id}" class="thumb"><img
									class="cafe-img" src="${cafe.img}" alt="" /></a>
								<div class="contentBox">
									<div class="textbox">
										<h3 class="cafe-name">${cafe.name}</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">Lorem ipsum dolor sit amet, consectetur
											adipiscing elit, sed do eiusmod tempor incididunt ut labore
											et dolore magna aliqua. Ut enim ad minim veniam,</p>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>
	</article>
</div>

<jsp:include page="footer.jsp" />
