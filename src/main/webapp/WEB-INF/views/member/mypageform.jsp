<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %> <!-- 로그인된아이디 스트링으로가져오기 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->

<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>
<body>
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
<main class="" id="main-collapse">
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
<h3>mypageform.jsp</h3>
<h1>마이페이지</h1>

현재로그인된아이디 확인용: <%=session.getAttribute("loginid") %> <br /> <!-- 로그인아이디 확인용 -->
<%if(session.getAttribute("loginid")!="admintest" || session.getAttribute("loginid")==null){ %>
<input type="button" value="문의페이지" onclick="location.href='../qnamember/qnalist'" />
<!-- <input type="button" value="내정보수정" onclick="location.href='infoupdateform'" /> -->
<input type="button" value="내정보수정" onclick="window.open('membercheckform','','width=500,height=200')" />
<input type="button" value="회원탈퇴" onclick="window.open('memberdropcheckform','','width=500,height=200')" />
<%
}
%>
<input type="button" value="메인페이지" onclick="location.href='main'" />
</main> <!-- 사이드 -->
</body>
</html>