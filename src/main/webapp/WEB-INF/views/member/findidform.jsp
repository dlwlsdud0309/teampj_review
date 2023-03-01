<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<style>
.findidformbtn{
	color: white;
	background-color: black;
	border-color: black;
	transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	border-radius: 5px;
	border: 1px solid;
	width: 150px; 
	height: 30px;
}	
.findidformbtn:hover {
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
</style>
</head>
<body>
<script>
var code="";

function email(){ 
const eamil = $('#m_email').val()+$('#m_email2').val(); 
var m_namee = document.getElementById("m_name").value; 
console.log('완성된 이메일 : '+ eamil); 
console.log('아이디입력한거 : '+m_namee); 
		
	$.ajax({
		type:'GET',
		url:'../member/findid?email=' +eamil+ '&m_name=' + m_namee,
		success:function(result){
			/* alert("ajax응답완료확인 : "+result) */			
			if(result==""){
				alert("해당이메일로가입한아이디가없습니다")
			}else if(result!=""){
				/* alert("확인완료") */
				alert("찾은 아이디 : "+result)
			}else{
				alert("오류")
			}
		}
	})


	
}
</script>
<!-- <h3>findidform.jsp</h3>
<h1>아이디찾기화면</h1> -->
<!-- 이름 : <input type="text" name="m_name" id="m_name" /> <br /> -->
<!-- 이름 : <input type="text" name="m_name" id="m_name" />
이메일 : <input type="text" name="m_email" id="m_email" />
		<select name="m_email2" id="m_email2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
		</select>  -->
<!-- 		<input type="button" onclick="email()" value="아이디찾기"/> <br />
		<input type="button" value="로그인화면" onclick="location.href='loginform'" /> -->
		<div class="container" style="width: 500px; height: 350px; text-align: center">
         <!-- <img src="../resources/kthimg/THEMICKYFACE2.png"  width="300" height="250"> -->   
		 <h1>아이디찾기</h1>  
         <div>
            <input class="inputvalue" type="text" name="m_name" id="m_name" placeholder="이름 입력..." />

         </div>
         <br />
         <div>
            <input class="inputvalue" type="text" name="m_email" id="m_email" placeholder="abc@abc.com" />

         </div>
         <br />
         <br />
         <button class="findidformbtn" onclick="email()" >아이디찾기</button>
         <button class="findidformbtn" onclick="window.close()" >로그인화면</button> <br /> <br /> <br />

         </div>
</body>
</html>