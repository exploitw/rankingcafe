<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<jsp:include page="header.jsp"/>

	<section id="home_visual">
		<div class="wrap">
			<ul class="img_container">
				<li class="imgbox1"></li>
				<li class="imgbox2"></li>
				<li class="imgbox3"></li>
			</ul>
			<p class="indicator">
				<span class="num1">01</span>
				<span>/</span>
				<span class="num2">03</span>
			</p>
		</div>
	</section>

	<section id="home_about">
      <div class="container">
        <img src="<c:url value="/cafe/img/872186_1619014820005463.jpg"/>" alt="" />
        <div class="textbox">
          <h3>
            Hello<br />
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.<br />
            Lorem Ipsum has been the industry's standard dummy text ever since
            the
          </h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. Lorem Ipsum has been the industry's standard dummy text
            ever since the 1500s, when an unknown printer took a galley of type
            and scrambled it to make a type specimen book.
          </p>
        </div>
      </div>
      <div class="container">
        <img src="<c:url value="cafe/img/872186_1619014820005463.jpg"/>" alt="" />
        <div class="textbox">
          <h3>
            Hello<br />
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.<br />
            Lorem Ipsum has been the industry's standard dummy text ever since
            the
          </h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry. Lorem Ipsum has been the industry's standard dummy text
            ever since the 1500s, when an unknown printer took a galley of type
            and scrambled it to make a type specimen book.
          </p>
        </div>
      </div>
    </section>

		<section id="home_cafeCategory">
      <ul>
        <li>
          <div class="img">
            <img src="<c:url value="cafe/img/cupcake-svgrepo-com.svg"/>" alt="" />
          </div>
          <h3># Dessert</h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.
          </p>
          <button><a href="#">visit</a></button>
        </li>
        <li>
          <div class="img">
            <img src="<c:url value="cafe/img/cloud-svgrepo-com.svg"/>" alt="" />
          </div>
          <h3># Mood</h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.
          </p>
          <button><a href="#">visit</a></button>
        </li>
        <li>
          <div class="img">
            <img src="<c:url value="cafe/img/heart-outline.svg"/>" alt="" />
          </div>
          <h3># Popularity</h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.
          </p>
          <button><a href="#">visit</a></button>
        </li>
      </ul>
    </section>

		<section id="home_rankCafe">
      <div class="rankImgbox">
        <div class="dummyBg"></div>
        <img src="<c:url value="cafe/img/872186_1619014820005463.jpg"/>" alt="" />
      </div>
      <div class="textbox">
        <h3>Cafe Name</h3>
        <p class="tag"># Dessert # Modern</p>
        <p class="desc">
          Lorem Ipsum is simply dummy text of the printing and typesetting
          industry.Lorem Ipsum is simply dummy text of the printing and
          typesetting industry.
        </p>
        <button>
          <a href="#">자세히 보기 &gt;</a>
        </button>
      </div>
    </section>

            <c:forEach var="customer" items="${customerList}">
				<c:if test="${sessionEMAIL == customer.email}">
					<c:if test="${customer.admin == true}">
						<a href="<c:url value="/cafe"/>?action=admin">ADMIN</a>
					</c:if>
				</c:if>
			</c:forEach>

	
<jsp:include page="footer.jsp"/>