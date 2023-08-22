<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="metro4:locale" content="ko-KR" />
        <meta name="metro4:init" content="false" />

        <title>customerInfoUpdate</title>

        <link rel="stylesheet" href="https://cdn.korzh.com/metroui/v4.5.1/css/metro-all.min.css" />
    </head>
<body>
 	<div data-role="appbar">
            <ul class="app-bar-menu">
               <li><a href="<c:url value="/cafe/index.jsp"/>">메인</a></li>
                <li><a href="<c:url value="madang?action=customers"/>">고객</a></li>
                <li><a href="<c:url value="madang?action=books"/>">도서</a></li>
            </ul>
        </div>

        <br />
        <br />
        <br />
        <div class="container">
            <label>고객 추가/수정/삭제 하기</label>
            <br />
            <br />
      
 	<form id="review_form" action="<c:url value="cafe"/>" method="post" data-id="${review.id}" enctype="multipart/form-data">
	<input type="hidden" name="action" id="review_form_action"/>
	<input type="hidden" name="id" value="${review.id}"  />
	 			
                <table>
				
				<tr>
					<td><label class="form-label">이미지</label>
					<input type="file" name="file" value="${review.img}" class="form-control">
					<img class="review-img" src="${review.img}" id="${review.img}" ></td>
				</tr>
				
				<tr>
					<td><input type="text" placeholder="이름" name="content" value="${review.content}"required style="height: 30px; width: 495px" id= "name"/></td>
				</tr>
				
				
			</table>
                <div class="row">
                    <div class="cell-3"></div>
                    <div class="cell-3">
                        <button class="button" id="update_button">리뷰 수정</button>
                        <button class="button" id="delete_button">리뷰 삭제</button>
                    </div>
                    <div class="cell-3"></div>
                    <div class="cell-3"></div>
                </div>
         
            </form>
        </div>
        <script src="https://cdn.korzh.com/metroui/v4.5.1/js/metro.min.js"></script>
        <script src="<c:url value="/cafe/js/reviewUpdate.js"/>"></script>
</body>
</html>