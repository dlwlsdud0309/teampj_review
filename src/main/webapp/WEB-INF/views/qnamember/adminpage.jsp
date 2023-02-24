<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
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

</script>
<h3>adminpage.jsp</h3>
<h1>관리자페이지</h1>
<a href="../member/main">메인페이지로</a>
<input type="button" value="회원목록" onclick="location.href='memberlist'" />
<input type="button" value="회원주문목록" onclick="location.href='../admin_olist'" />
<input type="button" value="큐앤에이게시판" onclick="location.href='adminqnalist'" />
<input type="button" value="회원차트" onclick="location.href='memberchart'" />
</body>
</html>