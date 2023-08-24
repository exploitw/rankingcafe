<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <jsp:include page="header.jsp" />
<%-- <!DOCTYPE html>
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
                
            </ul>
        </div>
 --%>
 <section id="cafeInfoUpdate">
        <div class="container">
            <label>카페 수정/삭제</label>
            <br />
            <br />
      
 	<form id="cafe_form" action="<c:url value="cafe"/>" method="post" data-id="${cafe.id}" enctype="multipart/form-data">
	<input type="hidden" name="action" id="cafe_form_action"/>
	<input type="hidden" name="id" value="${cafe.id}"  />
	 			
                <table>
				<tr>
					<td><input type="text" placeholder="도시" name="city" value="${cafe.city}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름" name="name" value="${cafe.name}"required style="height: 30px; width: 495px" id= "name"/></td>
				</tr>
				<tr>
					<td><label class="form-label">이미지</label>
					<input type="file" name="file" value="${cafe.img}" class="form-control">
					<img class="cafe-img" src="${cafe.img}" id="${cafe.img}"></td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="카페 주소" name="address" value="${cafe.address}" required style="height: 30px; width: 495px">
					</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="카페 번호" name="phone" value="${cafe.phone}" required style="height: 30px; width: 495px" /></td>
				</tr>
				
				<tr>
					<td><input type="text" placeholder="휴일" name="dayOff" value="${cafe.dayOff}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="개점시간" name="openingHours" value="${cafe.openingHours}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="주차" name="parking" value="${cafe.parking}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="홈페이지" name="website" value="${cafe.website}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="정보" name="info" value="${cafe.info}" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="카테고리" name="category" value="${cafe.category}" required style="height: 30px; width: 495px" /></td>
				</tr>
				
			</table>
                <div class="row">
                    <div class="cell-3"></div>
                    <div class="cell-3">
                        <button class="button" id="update_button">정보수정</button>
                        <button class="button" id="delete_button">삭제</button>
                    </div>
                    <div class="cell-3"></div>
                    <div class="cell-3"></div>
                </div>
         
            </form>
        </div>
        <script src="https://cdn.korzh.com/metroui/v4.5.1/js/metro.min.js"></script>
        <script src="<c:url value="/cafe/js/cafeUpdate.js"/>"></script>
</section>
<jsp:include page="footer.jsp" />
