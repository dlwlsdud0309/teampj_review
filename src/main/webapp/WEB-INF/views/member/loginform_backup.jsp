<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<script>
function check_id_pw(){
	loginform_input_id = document.getElementById("loginform_input_id").value; //input id값
	loginform_input_pw = document.getElementById("loginform_input_pw").value; //input password값
	if(!loginform_input_id){ //id를 입력하지않으면
		alert("아이디입력없음");
	}else if(!loginform_input_pw){ //pw를 입력하지않으면
		alert("비밀번호입력없음");
	}else{
		$.ajax({
			type:'GET',

			url:'../member/login?loginform_input_id=' + loginform_input_id + '&loginform_input_pw=' + loginform_input_pw, //membercontroller의 login()으로 input_id,input_pw를 보냄
			success:function(result){ //input_id,input_pw를 db에 select한 결과(int)
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

<h3>loginform.jsp</h3>
<h1>로그인화면</h1>

아이디 : <input type="text" name="loginform_input_id" id="loginform_input_id" /> <br /> 
비밀번호 : <input type="password" name="loginform_input_pw" id="loginform_input_pw" autocomplete="current-password"/>비밀번호표시<input type="checkbox" name="showpassword" /> <br />

<input type="button" value="로그인" onclick="check_id_pw()" /> <!-- function check_id_pw()실행 -->
<input type="button" value="회원가입" onclick="location.href='joinform'" /> 
<input type="button" value="메인화면" onclick="location.href='main'" /> <br /> <br />
<input type="button" value="아이디찾기" onclick="location.href='findidform'" />
<input type="button" value="비밀번호찾기" onclick="location.href='findpwform'"/>


</body>
</html>