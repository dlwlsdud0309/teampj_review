<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform2.jsp</title>
<style>
.loginformbtn{
	color: white;
	background-color: black;
	border-color: black;
	transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	border-radius: 5px;
	border: 1px solid;
	width: 150px; 
	height: 30px;
}	
.loginformbtn:hover {
	color: black;
	background-color: white;
	border-color: black;
	cursor: pointer;
}
.inputvalue{
	width: 300px;
	height: 30px;
	border: 1px solid #c4c4c4;
	background-color: #ffffff;
}
.findidpw{
	
}
.findidpwform{
	font-weight: bold;
	color: black;
	text-decoration: underline;
}
.findidpwform:hover {
	color: red;
}
.findidpwform:hover {
	cursor: pointer;
}
.showpwbox{
	accent-color:black;
}
</style>
<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
function check_id_pw(){
	loginform_input_id = document.getElementById("loginform_input_id").value; //input id값
	loginform_input_pw = document.getElementById("loginform_input_pw").value; //input password값
	if(!loginform_input_id){ //id를 입력하지않으면
		alert("아이디를입력하세요")
	}else if(!loginform_input_pw){ //pw를 입력하지않으면
		alert("비밀번호를입력하세요")
	}else {
		$.ajax({
			 type:'POST',
			/*  url:'../member/login?loginform_input_id=' + loginform_input_id + '&loginform_input_pw=' + loginform_input_pw, */  //membercontroller의 login()으로 input_id,input_pw를 보냄
			 url:'../member/login',
			 data:"loginform_input_id="+loginform_input_id+"&loginform_input_pw="+loginform_input_pw,
			 dataType:'text',
					success:function(result){ //input_id,input_pw를 db에 select한 결과(int)
				/* alert("result확인 : "+result) */
				if(result==0){ //아이디나비밀번호가 틀릴때
					alert("아이디비밀번호를확인하세요")
				}else if(result==1){ //아이디비밀번호가 맞을때

					alert("로그인성공");
					window.location.href="../product/productChart" //로그인성공시 메인페이지로이동

				}
			}
		})
	}
	
}
$(document).ready(function(){ //비밀번호표시 체크박스
	$('input[type=checkbox][name=showpassword]').change(function(){
		/* alert("비밀번호표시신호") */
		if($(this).is(':checked')){
			$('#loginform_input_pw').prop("type","text");
		}else{
			$('#loginform_input_pw').prop("type","password");
		}
	})
})
</script>
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
		<div class="container" style="border: solid 1px; width: 500px; height: 350px; text-align: center">
         <!-- <img src="../resources/kthimg/THEMICKYFACE2.png"  width="300" height="250"> -->   
		 <h1>로그인</h1>  
         <div>
            <input class="inputvalue" type="text" name="loginform_input_id" id="loginform_input_id" placeholder="아이디 입력..." />
            <!-- <div class="id_notok">아이디를 입력하세요</div> -->
         </div>
         <br />
         <div>
            <input class="inputvalue" type="password" name="loginform_input_pw" id="loginform_input_pw" placeholder="Password" />
        	<!-- <div class="pw_notok">비밀번호를 입력하세요</div> -->
         </div>
         <input class="showpwbox" type="checkbox" name="showpassword" /> 비밀번호표시
         <br />
         <br />
         <button class="loginformbtn" onclick="check_id_pw()" >로그인</button>
         <button class="loginformbtn" onclick="location.href='joinform'" >회원가입</button> <br /> <br /> <br />
         <div class="findidpw">
         <a href="#" onclick="window.open('findidform','','width=525, height=370');" class="findidpwform" >아이디찾기</a>
         &nbsp;/&nbsp;
         <a href="#" onclick="window.open('findpwform','','width=525, height=370');" class="findidpwform" >비밀번호찾기</a>
         </div>
         </div>
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>