<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<style>
		.btn1{
			color: white;
			background-color: black;
			border-color: black;
			transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
			border-radius: 5px;
			border: 1px solid;
		}
		.btn1:hover {
			color: black;
			background-color: white;
			border-color: black;
			cursor: pointer;
}
</style>
</head>
<body style="text-align: center">
<script>
var loginid2 = <%=session.getAttribute("loginid")%>;
$(document).ready(function(){
	alert(loginid2)
	if(loginid2==null){
		alert("로그인이필요한서비스입니다")
		window.location.href="../member/loginform"
	}
})
function checkValue(){
	var inputTitle = qwf.q_mtitle.value;
	var inputContent = qwf.q_mcontent.value;
	//alert(inputTitle)
	if(inputTitle==0 || inputTitle==null){
		alert("제목입력하세요")
		return false;
	}else if(inputContent==0 || inputContent==null){
		alert("내용입력하세요")
		return false;
	}
}
</script>
<h1>1:1문의</h1>

<form name="qwf" action="qnawrite" onsubmit="return checkValue()">	
		<input type="text" name="q_mtitle" placeholder="제목" style="width: 559px; height: 30px;"/>
		<input type="text" name="q_mid" value="<%=session.getAttribute("loginid") %>" style="width: 559px; height: 30px; padding-top: 2px; padding-bottom: 0;" readonly />
		<br /><br />
		<textarea name="q_mcontent" placeholder="내용" style="width: 1135px; height: 400px;"></textarea>
		<br /><br />
		<input class="btn1" type="submit" value="문의하기" /> &nbsp;&nbsp;
		<input class="btn1" type="button" value="목록으로" onclick="location.href='../qnamember/qnalist'"/> &nbsp;&nbsp;


</form>
</body>
</html>