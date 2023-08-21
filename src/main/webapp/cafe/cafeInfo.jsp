<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    

<jsp:include page="header.jsp"/>

	<section id="cafeInfo">
		<div id="hBox"><h2>CafeInfo</h2></div>
		<div id="cafeInfoWrap">
			<div class="imgContainer">
				<div style="background-image: url(${cafe.img});" class="imgbox"></div>
				<h3>CafeName</h3>
			</div>
			<div class="desc">
				<div class="desc1">
					<span>조회수 /</span>
					<span>댓글 수 /</span>
					<span>좋아요 수</span>
				</div>
				<div class="desc2">
					<button class="wr">
						<span class="material-symbols-outlined icon">edit</span>
						<span>리뷰쓰기</span>
					</button>
					<button>
						<span class="material-symbols-outlined icon">favorite</span>
						<span>좋아요</span>
					</button>
				</div>
			</div>
			<div class="infoContainer">
				<table>
					<tr>
						<td>주소</td>
						<td>${cafe.address}</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${cafe.phone}</td>
					</tr>
					<tr>
						<td>Category</td>
						<td># dessert</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>asdasd</td>
					</tr>
					<tr>
						<td>가격대</td>
						<td>? ~ ?</td>
					</tr>
					<tr>
						<td>휴무일</td>
						<td>${cafe.dayOff}</td>
					</tr>
					<tr>
						<td>웹 사이트</td>
						<td><a href="${cafe.website}">식당 홈페이지로 가기</a></td>
					</tr>
					<tr>
						<td>메뉴</td>
						<td>
							<ul>
								<li>
									<div>
										<span class="menuname">asd</span>
										<span class="price">1234won</span>
									</div>
								</li>
								<li>
									<div>
										<span class="menuname">asd</span>
										<span class="price">1234won</span>
									</div>
								</li>
								<li>
									<div>
										<span class="menuname">asd</span>
										<span class="price">1234won</span>
									</div>
								</li>
								<li>
									<div>
										<span class="menuname">asd</span>
										<span class="price">1234won</span>
									</div>
								</li>
								<li>
									<div>
										<span class="menuname">asd</span>
										<span class="price">1234won</span>
									</div>
								</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>about</td>
						<td>asdasdasdasdadasdascsdvrgdfrrgfdrgr</td>
					</tr>
				</table>
				<div class="cafeMap"></div>
			</div>
			<hr />
			<div class="comment">
				<p>
					<span>리뷰 ()</span>
				</p>
			</div>
			<div id="review">
				<ul>
					<c:forEach items="${reviewsList}" var="reviews">
						<li>
							<div class="imgbox">
								<img src="${reviews.img}" alt="" />
							</div>
							<div class="textbox">
								<p><span>작성자 : </span>${reviews.customerId}</p>
								<p><span>작성 날짜 : </span><fmt:formatDate value="${reviews.date}" pattern="yyyy-MM-dd" /></p>
								<p><span>댓글 내용 : </span>${reviews.content}</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<div class="modal">
				<div class="modalWrap">
					<form action="<c:url value="/cafe"/>?action=insertReview"  method="post" id="reviewWr">
					<input type="hidden" name="cafeId" value="${cafe.id}" />
					<input type="hidden" id="" name="customerId" value="${review.customerId}" />
						<table>
							<thead>
								<tr>
									<td><p>작성자</p></td>
									<td>
										<input
											type="text"
											name="username"
											required
											id="title"
											value="닉네임"
											readonly
										/>
									</td>
								</tr>
								<tr>
									<td><p>제목</p></td>
									<td>
										<input type="text" name="title" required id="title" />
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
										<textarea
											rows="12"
											cols="50"
											name="content"
											required
										></textarea>
									</td>
								</tr>
								<tr>
									<td><p>파일 첨부</p></td>
									<td>
										<label class="form-label hidden">이미지</label>
										<input
											type="file"
											name="file"
											class="form-control"
											multiple
										/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<div class="btn_container">
						<div class="btn1">
							<button>닫기</button>
						</div>
						<div class="btn2">
							<button type="submit">작성</button>
							<button type="reset">내용 초기화</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal -->
		</div>
	</section>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b671bd82ed62009fb1cdba553314a7f6&libraries=services"></script>
    <script>
    	var mapContainer = document.getElementsByClassName('cafeMap')[0];
	    var mapOption = { 
	          center: new kakao.maps.LatLng(37.530383673967731, 126.72254117738918),
	          level: 3
	      };
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	 // 장소 검색 객체를 생성합니다
	    var ps = new kakao.maps.services.Places(); 

	    // 키워드로 장소를 검색합니다
	    ps.keywordSearch('살롱드폼', placesSearchCB); 

	    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
	    function placesSearchCB (data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {

	            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	            // LatLngBounds 객체에 좌표를 추가합니다
	            var bounds = new kakao.maps.LatLngBounds();

	            for (var i=0; i<data.length; i++) {
	                displayMarker(data[i]);    
	                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	            }       

	            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	            map.setBounds(bounds);
	        } 
	    }

	    // 지도에 마커를 표시하는 함수입니다
	    function displayMarker(place) {
	        
	        // 마커를 생성하고 지도에 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: new kakao.maps.LatLng(place.y, place.x) 
	        });


	        // 마커에 클릭이벤트를 등록합니다
	        kakao.maps.event.addListener(marker, 'click', function() {
	            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	            infowindow.open(map, marker);
	        });
	    }
    </script>
<jsp:include page="footer.jsp"/>
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              </tbody>
            </table>
           	<a href="<c:url value="/cafe"/>?action=cafeInfoUpdate&id=${cafe.id}" data-id="${cafe.id}"><button>수정</button></a>
           
             <!-- 댓글 -->
<div id="review">
  <ol class="reviewList">
    <c:forEach items="${reviewsList}" var="reviews">
      <li >
      		
        <p>
        <img class="cafe-img" src="${reviews.img}"><br />
        작성자 : ${reviews.customerId}<br />
        작성 날짜 :  <fmt:formatDate value="${reviews.date}" pattern="yyyy-MM-dd" />
        </p>

        <p>${reviews.content}</p>
      </li>
    </c:forEach>   
  </ol>
</div>
<form action="<c:url value="/cafe"/>?action=insertReview"  method="post" enctype="multipart/form-data">
			<table>
				 <input type="hidden" id="cafeId" name="cafeId" value="${cafe.id}" />
				<div>
    <label for="${review.customerId}">댓글 작성자</label>
    <input type="hidden" id="${customerId}" name="customerId" />
    <br/>
    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
  </div>
				
				<tr>
					<label class="form-label">이미지</label>
					<input type="file" name="file" class="form-control">
					<td align="center"><input type="submit" value="작성" class="button"></td>
					<td align="center"><input type="reset" value="내용 초기화" class="button"></td>
				</tr>
			</table>
		</form>


</body>
</html>
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
