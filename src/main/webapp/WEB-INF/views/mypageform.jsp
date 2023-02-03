<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>mypageform.jsp</h3>
<h1>마이페이지</h1>
현재로그인된아이디 확인용 표현1 : ${sessionScope.loginid} <br />
현재로그인된아이디 확인용 표현2 : <%=session.getAttribute("loginid") %> <br />
<input type="button" value="문의페이지" onclick="location.href='qnalist'" />
<input type="button" value="메인페이지" onclick="location.href='main'" />
</body>
</html>