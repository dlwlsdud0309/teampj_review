<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Micky Sports Wear</title>
<!-- css 링크 -->
<link rel="stylesheet" href="resources/css/admin_header.css" />
<!-- 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- 반응형 setting -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
</style>
</head>

<body>
<header>
		<!-- 상단 메뉴 -->
   		<ul class="top_ul">
	   		<li class="top_li1"><a href="adminmain"><img class="home" src="resources/img/admin/admin_home_icon.png">home</a></li>
	   		<li class="top_li2"><a href="member/loginform"><img class="logout" src="resources/img/admin/admin_logout_icon.png">logout</a></li>
	   		<li class="top_li3"><a href="member/mypageform"><img class="my" src="resources/img/admin/admin_mypage_icon.png">My admin page</a></li>
   		</ul>
   		
   		<!-- 로고+헤드라인 -->
		<div class="header-wrap1">
		<h1 class="header-h1">Admin Home</h1>	
<!-- 		<img class="head-logo" 
 		src="resources/img/admin/admin_logo_icon.png"> -->
 		</div>
 		
 		<!-- 메인메뉴 -->	
    	<ul class="main_ul">
	      <li class="main_lior"><a href="admin_olist">주문관리</a></li>
	      <li class="main_lipr"><a href="admin_product">상품관리</a></li>
	      <li class="main_lime"><a href="qnamember/memberlist">회원관리</a></li>
		  <li class="main_liqn"><a href="qnamember/qnalist">관리자문의</a></li>
		  
	      <li class="main_lich"><a href="#">Chart</a>
	      		<!-- 차트 부메뉴 -->
 	      		<ul class="chartsub_ul">
					<li class="chart_subp"><a href="admin_cartchart">ProductChart</a></li>
					<li class="chart_subm"><a href="qnamember/memberchart">MemberChart</a></li>
					<li class="chart_subr"><a href="review/reviewAdminpage">ReviewChart</a></li>
				</ul>	
		  </li> 
		  
		  
    	</ul><!-- 메인메뉴 -->	
    	
</header>

</body>
</html>