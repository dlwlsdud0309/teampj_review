<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String loginid = (String)session.getAttribute("loginid"); %> <!-- 로그인된아이디 스트링으로가져오기 --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" href="resources/css/admin_sidebar.css" />
<!-- 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- main.jsp -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<style>
</style>
</head>


<body>
	<h3>Admin</h3>
	<img class="person" src="resources/img/admin/admin_person_icon.png"> <br />
	<font class="font"><%=session.getAttribute("loginid") %></font>님 반가워요!
	<hr align="left" />

	
	<ul class="side_ul">
		<li class="side_lior"><a href="admin_olist">주문관리</a></li>
		<li class="side_lipr"><a href="admin_product">상품관리</a></li>
		<li class="side_lime"><a href="qnamember/memberlist">회원관리</a></li>
		<li class="side_liqn"><a href="qnamember/qnalist">관리자문의</a></li>
		<li class="side_limy"><a href="member/mypageform">My Pages</a></li>
		
		<li class="side_lich"><a href="#">Chart</a>
			<ul class="subside_ul">
				<li class="subside_lipr"><a href="admin_cartchart">Product Chart</a></li>
				<li class="subside_lime"><a href="qnamember/memberchart">Member Chart</a></li>
				<li class="subside_lire"><a href="review/reviewAdminpage">Review Chart</a></li>
			</ul> <!-- subside_ul -->
		</li>
		
	</ul> <!-- side_ul -->
</body>
</html>