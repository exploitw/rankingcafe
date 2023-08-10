<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SignUp</title>
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

#signup {
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
<!-- <script>
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
</script> -->
<script type="text/javascript">
function emailOverlap() {
	console.log("emailOverlap 호출")
	console.log("이메일 입력 값 : "+joinForm.email.value)
	$.ajax({
		type :"post",/* 전송 방식 */
		url :"emailOverlap", /* 컨트롤러 사용할 때. 내가 보낼 데이터의 주소. */
		data : {"email" : joinForm.email.value},
		/* JSON형식 안에 JSON 형식으로 표현한 데이터. 
    	"파라미터 이름" : 폼태그에 적은 NAME 값.ID입력창의 NAME값.value 여러 개도 가능
		data :{	"id" : joinForm.id.value, 
		"id1" : joinForm.password.value}, 이렇게도 사용 가능.					
		*/
		dataType : "text",	/* text, xml, html, script, json, jsonp 가능 */
    	//정상적인 통신을 했다면 function은 백엔드 단에서 데이터를 처리.
		success : function(data){	
			if(data=="1"){
				alert("이 이메일은 사용 가능합니다.");
			}else{	//ajax가 제대로 안됐을 때 .
				alert("이 이메일은 사용  불가능합니다.");
			}
		},
		error : function(){
			alert("이메일 중복 확인 ajax 실행 실패");
		}
	});
}
function pass() {
	var password = document.getElementById('password').value;
	var SC = ["!","@","#","$","%"];
    var check_SC = 0;
    
    for(var i=0;i<SC.length;i++){
        if(password.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    
    if(password.length < 8 || password.length>16){
        window.alert('비밀번호는 8글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('password').value='';
        document.getElementById('password').focus();
    } else if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.');
        document.getElementById('password').value='';
        document.getElementById('password').focus();
    }
}
function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
	var password = document.getElementById('password').value;					//비밀번호 
	var passwordConfirm = document.getElementById('passwordConfirm').value;	//비밀번호 확인 값
	var confirmMsg = document.getElementById('confirmMsg');				//확인 메세지
	var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
	var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
	        
    if(password !='' && passwordConfirm !=''){
    	if(password == passwordConfirm){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
    		confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
    		confirmMsg.innerHTML ="비밀번호 일치";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
    	}else{
    		confirmMsg.style.color = wrongColor;
    		confirmMsg.innerHTML ="비밀번호 불일치";
    		document.getElementById('passwordConfirm').value='';
            document.getElementById('passwordConfirm').focus();
    	}
    }
}
</script>
</head>

<body>
	<div class="container">
		<h5><span>회원 가입</span> 페이지입니다.</h5>
		<hr />
		<br />
		<form action="<c:url value="/cafe"/>?action=join" method="post">
			<input type="text" placeholder="이름" name="name" required style="height: 30px; width: 495px" /><br /><br />
			<input type="email" placeholder="이메일 주소" name="email" required style="height: 30px; width: 495px" />
			<input type="button" onclick="emailOverlap()" value="중복확인"/><br /><br />
			<input type="password" placeholder="비밀번호" id="password" name="password" required style="height: 30px; width: 495px" onchange="pass()">
			<input type="password" placeholder="비밀번호 확인" id="passwordConfirm" name="passwordConfirm" required style="height: 30px; width: 495px" onchange="passConfirm()"/><span id ="confirmMsg"></span><!-- &nbsp;<span id="check"></span> --><br /><br /> 
			<input type="text" placeholder="닉네임" name="nickName" required style="height: 30px; width: 495px" /><br /><br />
			<input type="text" placeholder="주소" name="address" required style="height: 30px; width: 495px" /> <br /><br />
			<input type="text" placeholder="핸드폰번호" name="phone" required style="height: 30px; width: 495px" /><br /><br />
			<p>
				<input type="submit" value="가입하기" id="signup" /><br /> <br />
			</p>
		</form>
		<hr />
	</div>
</body>
</html>