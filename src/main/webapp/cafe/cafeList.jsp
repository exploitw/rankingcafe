<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
sj
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
sj
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 등록하기</title>
</head>
<body>
    <div class="navbar">
      <a href="#" id="logo">
        <img src="images/logo.png" width="149">
        </a>
        <ul id="menu">
          <li><a href="#">contact</a></li>
          <li><a href="#">shop</a></li>
          <li><a href="#">cart</a></li>
          <li><a href="#">login</a></li> 
          <a href="<c:url value="/cafe"/>/index.jsp"><button>메인으로</button></a>
        </ul>
    </div>
    <div class="hero-header"></div>  
    	 <div class="products">
      <h3>CAFE</h3>
     <div class="cafe-list">
    <c:forEach var = "cafe" items="${cafeList}">
    	 <a href="<c:url value="/cafe"/>?action=cafeInfo&id=${cafe.id}" data-id="${cafe.id}" class="cafe">
       		<img class="cafe-img" src="${cafe.img}">
          <div class="cafe-name">
           ${cafe.name}
          </div>
          <div class="cafe-address">${cafe.address}</div>
        </a>
    </c:forEach>
   
     
       
        
    <div class="footer">
      <a href="http://facebook.com">
        <img src="images/facebook.png"height="20">
      </a>
      <a href="http://instagram.com">
        <img src="images/instagram.png"height="20">
      </a>
      <a href="http://twitter.com">
        <img src="images/twitter.png"height="20">
      </a>
    </div>
  </body>
</html>
sh
