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
				<li><input id="check-btn" type="checkbox" />
    				<label for="check-btn">City</label>
					<ul class="menubars1">
						<li><button class="catebtn2" data-cate=".용산구">용산구</button></li>
						<li><button class="catebtn2" data-cate=".강남구">강남구</button></li>
						<li><button class="catebtn2" data-cate=".성동구">성동구</button></li>
						<li><button class="catebtn2" data-cate=".마포구">마포구</button></li>
						<li><button class="catebtn2" data-cate=".종로구">종로구</button></li>
						
					</ul>
				</li>
				<li><input id="check-btn2" type="checkbox" />
    				<label for="check-btn2">Mood</label>
					<ul class="menubars2">
					<li><button class="catebtn3" data-cate=".modern">MODERN</button></li>
					<li><button class="catebtn3" data-cate=".classic">CLASSIC</button></li>
					<li><button class="catebtn3" data-cate=".vintage">VINTAGE</button></li>
					<li><button class="catebtn3" data-cate=".trandy">TRANDY</button></li>
					</ul>
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
						<li class="${cafe.city} ${cafe.category}">
							<div class="listBox">
								<a href="<c:url value="/cafe"/>?action=cafeInfo&id=${cafe.id}"
									data-id="${cafe.id}" class="thumb"><img
									class="cafe-img" src="${cafe.img}" alt="" /></a>
								<div class="contentBox">
									<div class="textbox">
										<a href="<c:url value="/cafe"/>?action=cafeInfo&id=${cafe.id}"
									data-id="${cafe.id}" class="thumb"><h3 class="cafe-name">${cafe.name}</h3></a>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">${cafe.info}</p>
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

<a href="<c:url value="/cafe"/>/insertcafe.jsp"	>카페 등록</a>
<jsp:include page="footer.jsp" />
