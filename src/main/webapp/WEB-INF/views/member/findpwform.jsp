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
var m_idd = document.getElementById("m_id").value; 
console.log('완성된 이메일 : '+ eamil); 
console.log('아이디입력한거 : '+m_idd); 
		
	$.ajax({
		type:'GET',
		url:'/shop/member/findpw?email=' +eamil+ '&m_id=' + m_idd,
		success:function(result){
			/* alert(result)	 */		
			if(result==0){
				alert("해당이메일로가입한아이디가없습니다")
			}else if(result==1){
				/* alert("임시비밀번호 보낼이메일확인완료") */
				$.ajax({
					type : 'GET',
					url : '/shop/member/sendpwemail?email=' + eamil, 
					success : function(data){
						console.log("data : "+data); 
						code=data; 
						alert('임시비밀번호발송 및 해당아이디 비밀번호변경완료') 
						window.location.href="/shop/member/loginform"
					}
				})
			}else{
				alert("오류")
			}
		}
	})


	
}
</script>
<!-- <h3>findpwform.jsp</h3>
<h1>비밀번호찾기화면</h1>
이름 : <input type="text" name="m_name" id="m_name" /> <br />
아이디 : <input type="text" name="m_id" id="m_id" />
이메일 : <input type="text" name="m_email" id="m_email" />
		<select name="m_email2" id="m_email2">
		<option>@naver.com</option>
		<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
		<option>@yahoo.co.kr</option>
		</select> 
		<input type="button" onclick="email()" value="임시비밀번호발송"/> <br />
		<input type="button" value="로그인화면" onclick="location.href='loginform'" /> -->
		<div class="container" style="width: 500px; height: 350px; text-align: center">
         <!-- <img src="../resources/kthimg/THEMICKYFACE2.png"  width="300" height="250"> -->   
		 <h1>비밀번호찾기</h1>  
         <div>
            <input class="inputvalue" type="text" name="m_name" id="m_name" placeholder="이름 입력..." />
            <!-- <div class="id_notok">아이디를 입력하세요</div> -->
         </div>
         <br />
         <div>
            <input class="inputvalue" type="text" name="m_id" id="m_id" placeholder="아이디 입력..." />
            <!-- <div class="id_notok">아이디를 입력하세요</div> -->
         </div>
         <br />
         <div>
            <input class="inputvalue" type="text" name="m_email" id="m_email" placeholder="abc@abc.com" />
        	<!-- <div class="pw_notok">비밀번호를 입력하세요</div> -->
         </div>
         <br />
         <br />
         <button class="findidformbtn" onclick="email()" >아이디찾기</button>
         <button class="findidformbtn" onclick="window.close()" >로그인화면</button> <br /> <br /> <br />

         </div>
</body>
</html>