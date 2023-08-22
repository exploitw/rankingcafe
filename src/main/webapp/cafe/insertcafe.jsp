<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>InsertCafe</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
.container {
	width: 500px;
	margin: 40px auto;
	line-height: 16px;
}

h5 {
	text-align: center;
}

h5 span {
	color: teal;
}

.n {
	font-size: 13px;
}

#insertcafe {
	background-color: rgb(255, 80, 90);
	color: white;
	border: 0;
	border-radius: 5px;
	padding: 10px 224px;
}

.bottom input {
	background-color: white;
	border: 0;
	color: teal;
	font-size: 16px;
}

i {
	color: lightgray;
}

#imail {
	position: absolute;
	top: 110px;
	margin: 0 470px;
}

#iperson1 {
	position: absolute;
	top: 160px;
	margin: 0 470px;
}

#iperson2 {
	position: absolute;
	top: 210px;
	margin: 0 470px;
}

#ipw {
	position: absolute;
	top: 260px;
	margin: 0 470px;
}

input {
	border: 1px solid lightgray;
	border-radius: 3px;
}
</style>

</head>

<body>
	<div class="container">
		<h5><span>카페등록</span> 페이지입니다.</h5>
		<hr />
		<br />
		<form action="<c:url value="/cafe"/>?action=insertCafe" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td><input type="text" placeholder="도시" name="city" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="이름" name="name" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><label class="form-label">이미지</label>
					<input type="file" name="file" class="form-control"></td>
				</tr>
				<tr>
					<td>
						<input type="text" placeholder="카페 주소" name="address" required style="height: 30px; width: 495px">
					</td>
				</tr>
				<tr>
					<td><input type="text" placeholder="카페 번호" name="phone" required style="height: 30px; width: 495px" /></td>
				</tr>
				
				<tr>
					<td><input type="text" placeholder="휴일" name="dayOff" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="개점시간" name="openingHours" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="주차" name="parking" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="홈페이지" name="website" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="정보" name="info" required style="height: 30px; width: 495px" /></td>
				</tr>
				<tr>
					<td><input type="text" placeholder="카테고리" name="category" required style="height: 30px; width: 495px" /></td>
				</tr>
				
			</table>
			<br>
			<p>
				<input type="submit" value="카페 등록" id="insertcafe" />
			</p>
		</form>
		<hr />
	</div>
</body>
</html>