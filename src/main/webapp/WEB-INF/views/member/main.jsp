<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> <!-- 로그인된아이디 스트링으로가져오기 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
</head>
<body>
<script>

function logout(){
	$.ajax({
		type:'GET',
		url:'../member/logout',
		success:function(result){
			alert("로그아웃했습니다")
			location.reload();
			window.location.href="../member/main"
		}
	})
}
function mypage(){
	var loginid = '<%=session.getAttribute("loginid")%>';
	alert("로그인아이디확인용 : "+loginid)
	
	if(loginid==null){
		alert("로그인이필요한서비스입니다")
		window.location.href="../member/loginform"
	}else{
		window.location.href="../member/mypageform"
	}
}
</script>
<h3>main.jsp</h3>
<h1>메인화면</h1>
<%if(session.getAttribute("loginid")==null){ //로그인이 실패하면
%>
<font color="blue">비회원</font>님반가워요<br />
<input type="button" value="로그인화면" onclick="location.href='loginform'" /> <br />
<%
}else { //로그인이 성공하면 
%>
<hr />
프로필사진 확인용 : 
<img src="../resources/upload/${dto.m_filesrc}" style="border: 1px" width="150px" height="150px"/>
<hr />
<font color="blue"><%=session.getAttribute("loginid") %></font>
님 반가워요
<input type="button" value="로그아웃" onclick="logout()" /> <br />
<!-- <input type="button" value="마이페이지" onclick="location.href='mypageform'" /><br /> -->
<input type="button" value="마이페이지" onclick="mypage()" /><br />
<% 
if(loginid.equals("admintest")||loginid.equals("admintest2")){ //로그인아이디가 admintest라면 관리자페이지button이 보임
%>
<input type="button" value="관리자페이지" onclick="location.href='../qnamember/adminpage'"/>	<br />
<%
}
%>
<%
}
%>

<!-- 값 확인용 -->
로그인중인 아이디 확인용 : <%=session.getAttribute("loginid") %>


<hr />

<a href="../product/productChart">productChart</a> <br />
<a href="../product/productList">productlist</a>  <br />
<a href="../Cart/Cartlist">cart</a>

</body>
</html>