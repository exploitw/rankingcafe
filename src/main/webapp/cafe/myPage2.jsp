<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
	
<section id="myPage2">
      <div id="hBox"><h2>My Page</h2></div>
      <ul>
        <li><a href="<c:url value="/cafe?action=myPage&id=${customerId}"/>">내가 쓴 글</a></li>
        <li class="active"><a href="<c:url value="/cafe?action=myPage2&id=${customerId}"/>">좋아요 한 카페</a></li>
        <li><a href="<c:url value="/cafe?action=myPage3&id=${customerId}"/>">내 정보 수정</a></li>
        <c:if test="${sessionEMAIL != null }">
			<c:forEach var="customer" items="${customerList}">
				<c:if test="${sessionEMAIL == customer.email}">
					<c:if test="${customer.admin == true}">
						<li><a href="<c:url value="/cafe"/>?action=adminPage1&id=${customerId}">관리자</a></li>
					</c:if>
				</c:if>
			</c:forEach>
		</c:if>
      </ul>
      <hr />
      <div id="myPage2Wrap">
        <ul class="container">
					<c:forEach var="like" items="${customerLikeList}" varStatus="status">
						<li>
							<div class="likeBox">
								<a href="<c:url value="/cafe?action=cafeInfo&id=${like[0]}"/>" class="thumb"><img src="${like[6]}" alt=""	/></a>
								<div class="contentBox">
									<div class="textbox">
										<h3>${like[1]}</h3>
										<button class="heartBtn heartBtn${like[0]}" data-id="${like[0]}">
											<span class="material-symbols-outlined icon">favorite</span>
										</button>
										<p class="tag">${like[3]}</p>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
        </ul>
      </div>
    </section>
    
    <script>
    
/*       $("section#myPage2 .heartBtn").on("click", function () {
        $(this).find(".icon").toggleClass("true");
      }); */
      $("section#myPage2 .heartBtn").each(function(){
  		let selectCafeId = $(this).attr("data-id");
  		let custId = 0;
  		if(${customerId} != null){
  			custId = ${customerId};
  		}
  	  $.ajax("/rankingcafe/cafe?action=findLike",
  			  {
  		  data:  "cafeId=" + selectCafeId + "&custId=" + custId,
  	    method: "GET",
  	    dataType: 'text',
  	    success: function(data){
  	    	if(parseInt(data) == 1){
  	    		$("section#myPage2 .heartBtn"+selectCafeId).find(".icon").addClass("true");
  	    	} else{
  	    	}
  	    }
  	  })
    })
      
      $("section#myPage2 .heartBtn").on("click", function (e) {
  		e.preventDefault();
  	    	  
  		if(${sessionEMAIL == null}){
  			alert("로그인을 해주세요.");
  		}else{
  			$(this).find(".icon").toggleClass("true");
  			let selectCafeId = $(this).attr("data-id");
  			let custId = 0;
  			if(${customerId} != null){
  				custId = ${customerId};
  			}

  			$.ajax({
  				url: '/rankingcafe/cafe?action=updateLike',
  				type: 'POST',
  				data:  "cafeId=" + selectCafeId + "&custId=" + custId,
  				success: function (data) {
  					$(this).find(".icon").toggleClass("true");
  					//location.reload();
  				}, error: function () {
  					console.log('로그인 후 이용해 주세요.')
  					//location.reload();
  				}
  			});
			}		
  	});
  			
    </script>
	
<jsp:include page="footer.jsp"/>