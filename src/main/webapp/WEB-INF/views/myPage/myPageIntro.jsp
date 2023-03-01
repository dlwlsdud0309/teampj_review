<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />

<main class="" id="main-collapse">
	
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

<%if(session.getAttribute("loginid")==null){ //로그인이 실패하면
%>
<font color="blue">비회원</font>님반가워요<br />
<input type="button" value="로그인화면" onclick="location.href='loginform'" /> <br />
<%
}else { //로그인이 성공하면 
%>
<hr />
프로필사진 :
<img src="../resources/upload/${myList.m_filesrc}" style="border: 1px" width="150px" height="150px" alt="프로필사진"/>
<hr />

<font color="blue"><%=session.getAttribute("loginid") %></font>
님 반가워요
<% 
if(loginid.equals("admintest")||loginid.equals("admintest2")){ //로그인아이디가 admintest라면 관리자페이지button이 보임
%>
<input type="button" value="관리자페이지" onclick="location.href='../adminmain'"/>
<%
}
%>
<%
}
%>
<br />
<div>
<p>회원님의 현재 캐시</p> 
<span><fmt:formatNumber value="${myList.m_cash}" pattern="###,###"/>원 </span>
</div>
<hr />
<div>
	<table style="border: 1px solid #333; text-align: center; width: 300px; border-collapse: collapse; color:#fff; background-color: #171717;">
		<tr>
			<td>결제완료</td>
			<td>주문취소</td>
			<td>배송완료</td>
			<td>구매확정</td>
		</tr>
		<tr>
			<c:forEach items="${stateList}" var="stateList" begin="0" step="1" varStatus="status">
				<td>
				${stateList}
				</td>
			</c:forEach>
		</tr>
	</table>
</div>
</main>

<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>