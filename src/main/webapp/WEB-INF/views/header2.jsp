<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">

<style>
.main-header{
	color: black;
}
.main-header:hover{
	color: black;
	text-decoration: none;
}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    background-color: #acacac;
}
.dropdown-menu{
/* 	width: 1000px; */
/* 	 position: relative; */
/* 	 margin: auto; */
/* 	 background-color: red; */
}
b{
	font-size: 20px;
}
.title-link{
	float: right;	
}
.title-link a{
	color: black;
}
.title-link a:hover{
	color: #acacac;
	text-decoration: none;
}
.title{
	text-align:center; 
}

</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>header</title>
</head>
<body>  
	<div class="title">
		<div class="title-link">
		  	<c:if test="${empty sessionScope.loginid }">
			   <a href="./member/loginform">로그인</a> 
			   |  <a href="./member/joinform">회원가입</a> | 
			
			</c:if>
			 <c:if test="${not empty sessionScope.loginid }">
			    <a href="./member/logout">로그아웃</a> | 
					<a href="./myPage/myPageIntro">마이페이지</a> |
			 </c:if>
			<a href="./Cart/Cartlist">장바구니</a> &nbsp;
		</div>
		
			<div>
				<img src="./resources/micky.png" alt="img" width="100" height="100" class="img"/>
				<a href="./product/productChart" class="main-header"><b>MICKY SportsWear</b></a>
		
			</div>	
	</div>
<nav class="navbar navbar-inverse bg-dark">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Micky</a>
    </div>
	
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
<!--         <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
        <li class="dropdown"><a href="./category?c=outer">아우터</a>
        	<ul class="dropdown-menu ">
				<li><a href="./category?c=outer-parka">패딩</a></li>
				<li><a href="./category?c=outer-jacket">조끼</a></li>	
			</ul>  
        </li>
        <li class="dropdown"><a href="./category?c=tshirts">티&셔츠</a>    	
        	<ul class="dropdown-menu ">	
				<li><a href="./category?c=tshirts_hood">후디</a></li>
				<li><a href="./category?c=tshirts_crewneck">라운드티</a></li>
				<li><a href="./category?c=tshirts_shirts">셔츠</a></li>
			</ul>  
        </li>
        <li class="dropdown"><a href="./category?c=pants_training">바지</a>

        </li>
        <li class="dropdown"><a href="./category?c=backpack">가방</a>
        	<ul class="dropdown-menu ">
				<li><a href="./category?c=backpack_climbing">등산백팩</a></li>
				<li><a href="./category?c=backpack_casual">캐주얼백팩</a></li>
			</ul>  
        </li>
        <li class="dropdown"><a href="./category?c=other">기타용품</a>
        	<ul class="dropdown-menu ">
				<li><a href="./category?c=other_socks">양말</a></li>
				<li><a href="./category?c=other_mask">마스크</a></li>
			</ul>  
        </li>
        <li class="dropdown"><a href="./category?c=hat_cap">모자</a>

        </li>
       
      </ul>
      <form class="navbar-form navbar-right" role="search" action="./search">
        <div class="form-group">
          <input type="text" class="form-control" name="q" value="${search }" placeholder="상품검색">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
									

</body>
</html>
