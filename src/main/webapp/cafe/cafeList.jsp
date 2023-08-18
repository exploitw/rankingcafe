<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
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
							Popularity
						</button>
					</li>
				</ul>
			</nav>
		</aside>
		<article id="content">
			<section id="cafeList">
				<div id="hBox"><h2>Category</h2></div>
				<div id="ListContainer">
					<ul>
						<!--  -->
						<li class="dessert">
							<div class="listBox">
								<a href="#" class="thumb"
									><img
										src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>"
										alt=""
								/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>Cafe Name</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit,
											sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam,
										</p>
									</div>
								</div>
							</div>
						</li>
						<li class="dessert">
							<div class="listBox">
								<a href="#" class="thumb"
									><img
										src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>"
										alt=""
								/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>Cafe Name</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit,
											sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam,
										</p>
									</div>
								</div>
							</div>
						</li>
						<!--  -->
						<li class="mood">
							<div class="listBox">
								<a href="#" class="thumb"
									><img
										src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>"
										alt=""
								/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>Cafe Name</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit,
											sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam,
										</p>
									</div>
								</div>
							</div>
						</li>
						<li class="mood">
							<div class="listBox">
								<a href="#" class="thumb"
									><img
										src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>"
										alt=""
								/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>Cafe Name</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit,
											sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam,
										</p>
									</div>
								</div>
							</div>
						</li>
						<!--  -->
						<li class="popularity">
							<div class="listBox">
								<a href="#" class="thumb"
									><img
										src="<c:url value="/cafe/img/02c724e9e233bc0d9ff7a2f417d9a7a0.jpg"/>"
										alt=""
								/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>Cafe Name</h3>
										<p class="heart">
											<i class="fa-solid fa-heart"></i>
										</p>
										<p class="tag"># tag # tag</p>
										<p class="desc">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit,
											sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam,
										</p>
									</div>
								</div>
							</div>
						</li>
						<!--  -->
					</ul>
				</div>
			</section>
		</article>
	</div>
	
<jsp:include page="footer.jsp"/>