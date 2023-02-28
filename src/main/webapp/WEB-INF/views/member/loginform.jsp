<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform2.jsp</title>
<link rel="stylesheet" href="../resources/css/loginform.min.css" />
<style>
html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  /* background-color: #f5f5f5; */
  background-color: #ffffff;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
  background-color: white;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
#loginform_input_pw{
	margin-bottom:10px;
}
/* .id_notok{
	color:red;
	display: none;
}
.pw_notok{
	color:red;
	display: none;
} */

</style>
<!-- <script src="../resources/js/loginform.bundle.min.js"></script> -->
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
			type:'GET',
			url:'../member/login?loginform_input_id=' + loginform_input_id + '&loginform_input_pw=' + loginform_input_pw, //membercontroller의 login()으로 input_id,input_pw를 보냄
			success:function(result){ //input_id,input_pw를 db에 select한 결과(int)
				alert("result확인 : "+result)
				if(result==0){ //아이디나비밀번호가 틀릴때
					alert("아이디비밀번호를확인하세요")
				}else if(result==1){ //아이디비밀번호가 맞을때
					alert("로그인성공")
					window.location.href="../member/main" //로그인성공시 메인페이지로이동
				}
			}
		})
	}
	
}
$(document).ready(function(){ //비밀번호표시 체크박스
	$('input[type=checkbox][name=showpassword]').change(function(){
		alert("비밀번호표시신호")
		if($(this).is(':checked')){
			$('#loginform_input_pw').prop("type","text");
		}else{
			$('#loginform_input_pw').prop("type","password");
		}
	})
})
</script>
</head>
<body class="text-center">

<div class="container">
   <main class="form-signin">
         <img class="mb-4" src="../resources/kthimg/logo.png" alt="" width="300" height="250">
         <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
         
         <div class="form-floating">
            <input type="text" class="form-control" name="loginform_input_id" id="loginform_input_id" placeholder="아이디 입력..." />
            <!-- <div class="id_notok">아이디를 입력하세요</div> -->
         </div>
         <br />
         <div class="form-floating">
            <input type="password" class="form-control" name="loginform_input_pw" id="loginform_input_pw" placeholder="Password" />
        	<!-- <div class="pw_notok">비밀번호를 입력하세요</div> -->
         </div>
         
         <div class="checkbox mb-3">
            <!-- <label>
               <input type="checkbox" value="remember-me" style="accent-color:black;"> 아이디 저장
            </label> -->
             <label>
            	&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="showpassword" style="accent-color:black;" /> 비밀번호표시
            </label>
         </div>
         <button class="w-100 btn btn-lg btn-primary" onclick="check_id_pw()">로그인</button> <br /> <br />
         <button class="w-100 btn btn-lg btn-primary" onclick="location.href='joinform'">회원가입</button> <br /> <br /> <br />
         <a href="findidform" style="font-weight: bold">아이디찾기</a>
         &nbsp;/&nbsp;
         <a href="findpwform" style="font-weight: bold">비밀번호찾기</a>
         <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
   </main>
</div>
</body>
</html>