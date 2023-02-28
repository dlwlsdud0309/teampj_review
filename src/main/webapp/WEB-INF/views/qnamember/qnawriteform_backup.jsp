<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
</head>
<body>
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
<h1 style="text-align: center">1:1문의</h1>
<hr />
<form name="qwf" action="qnawrite" onsubmit="return checkValue()">
<table>
	<tr>
		<td class = "left">제목</td>
		<td style="width: 500px"><input type="text" name="q_mtitle" style="width: " /></td>
	</tr>
	<tr>
		<td class = "left">내용</td>
		<td><textarea name="q_mcontent"></textarea></td>
	</tr>
	<tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="<%=session.getAttribute("loginid") %>" readonly /></td>
	</tr>
	<tr>
		<td colspan = "2">
		<input type="submit" value="문의하기" /> &nbsp;&nbsp;
		<a href="qnalist">목록</a> &nbsp;&nbsp;
		<a href="#">삭제</a> &nbsp;&nbsp;
		<a href="#">답변폼으로</a> &nbsp;&nbsp;
		</td>
	</tr>
</table>
</form>
</body>
</html>