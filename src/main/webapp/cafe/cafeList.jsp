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
          <button class="catebtn2" data-cate=".dessert">City</button>
          <ul>
            <li><button class="catebtn2" data-cate=".용산구">용산구</button></li>
            <li><button class="catebtn2" data-cate=".강남구">강남구</button></li>
            <li><button class="catebtn2" data-cate=".성동구">성동구</button></li>
            <li><button class="catebtn2" data-cate=".마포구">마포구</button></li>
            <li><button class="catebtn2" data-cate=".종로구">종로구</button></li>
          </ul>
        </li>
        <li>
          <button class="catebtn3" data-cate=".mood">Mood</button>
          <ul>
            <li><button class="catebtn3" data-cate=".modern">Modern</button></li>
            <li><button class="catebtn3" data-cate=".classic">Classic</button></li>
            <li><button class="catebtn3" data-cate=".vintage">Vintage</button></li>
            <li><button class="catebtn3" data-cate=".trandy">Trandy</button></li>
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
										<h3 class="cafe-name">${cafe.name}</h3>
										
										<c:if test="${sessionEMAIL == null }">
											<button class="heartBtnNlonin" >
                    		<span class="material-symbols-outlined icon">favorite</span>
                  		</button>
										</c:if>
										<c:if test="${sessionEMAIL != null }">
											<button class="heartBtn heartBtn${cafe.id}" data-id="${cafe.id}">
                 				<span class="material-symbols-outlined icon">favorite</span>
               				</button>
										</c:if>
										<p class="tag"># ${cafe.city} # ${cafe.category}</p>
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
<a href="<c:url value="/cafe"/>/insertcafe.jsp"	>asd</a>

<form id="cafeListLikeSend">
	<input type="hidden" />
</form>

  <script>
  
  $("div#cafeListWrap .heartBtn").each(function(){
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
	    		$("div#cafeListWrap .heartBtn"+selectCafeId).find(".icon").addClass("true");
	    	} else{
	    	}
	    }
	  })
  })
  
  
  $("div#cafeListWrap .heartBtnNlonin").on("click", function (e) {e.preventDefault();});
  
  $("div#cafeListWrap .heartBtn").on("click", function (e) {
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
      
      $("div#cafeListWrap .heartBtnNlogin").on("click", function () {
          alert("로그인 후 이용해 주세요.");
      });
      
    </script> 
    
<jsp:include page="footer.jsp" />

