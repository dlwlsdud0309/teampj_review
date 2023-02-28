<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer{
	margin-top: 1700px;
}
#sub_menu{
	float: left;
	margin-left: 20px;
	margin-top: 0px;
}
#content{
	float: left;
	margin-left: 10px;
}	
</style>
</head>

<body>
<header id="header">
 <!-- header section -->
<%@include file="admin_header.jsp" %> 
</header>

<div id="sub_menu">
<!-- sub menu section -->
<%@include file="admin_sidebar.jsp" %>
</div> 
<h1></h1>
<div id="content">
<%@include file="adminmain_content.jsp" %>
</div> 

<footer>
<!-- footer section -->
<%@ include file="admin_footer.jsp" %> 
</footer>

</body>
</html>
