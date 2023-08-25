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
            최고의 카페를 찾아보세요!<br />
          </h3>
          <p>
            여러분의 특별한 순간을 더욱 풍요롭게 만들어줄 카페를 찾고 계신가요? <br />
            그렇다면 지금 바로 "카페마스터"라는 인기 카페 순위 사이트를 소개해드릴게요. <br />
            "카페마스터"는 수많은 카페 중에서 가장 인기 있는 곳들을 선별하여 순위화하여 제공하는 플랫폼으로,
            당신의 다음 커피 탐방을 더욱 특별하게 만들어줄 것입니다.
          </p>
        </div>
      </div>
      <div class="container">
        <img src="<c:url value="cafe/img/872186_1619014820005463.jpg"/>" alt="" />
        <div class="textbox">
          <h3>
            리뷰와 평점
          </h3>
          <p>
            다른 카페 맛을 미리 체험해보고 싶다면, "카페마스터"의 리뷰와 평점을 확인해보세요. 다양한 방문자들의 생생한 의견을 통해 카페의 분위기와 맛을 미리 느껴볼 수 있습니다.
          </p>
        </div>
      </div>
      <div class="container">
        <img src="<c:url value="cafe/img/872186_1619014820005463.jpg"/>" alt="" />
        <div class="textbox">
          <h3>
            사용자 참여
          </h3>
          <p>
            당신의 카페 경험도 다른 이용자들과 공유해보세요. <br />
            리뷰를 작성하고 평점을 매기면, 더 많은 사람들에게 도움이 되는 정보를 제공하게 됩니다.
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
          <h3># City</h3>
          <p>
            Lorem Ipsum is simply dummy text of the printing and typesetting
            industry.
          </p>
          <button><a href="<c:url value="/cafe"/>?action=cafeList">visit</a></button>
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
          <button><a href="<c:url value="/cafe"/>?action=cafeList">visit</a></button>
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
          <button><a href="<c:url value="/cafe"/>?action=cafeList">visit</a></button>
        </li>
      </ul>
    </section>

		<section id="home_rankCafe">
      <div class="rankImgbox">
        <div class="dummyBg"></div>
        <img src="${popularityCafe[0][1]}" alt="" />
      </div>
      <div class="textbox">
        <h3>${popularityCafe[0][0]}</h3>
        <p class="tag"># ${popularityCafe[0][4]} # ${popularityCafe[0][3]}</p>
        <p class="desc">
          ${popularityCafe[0][2]}
        </p>
        <button>
          <a href="<c:url value="/cafe"/>?action=cafeInfo&id=${popularityCafe[0][6]}">자세히 보기 &gt;</a>
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