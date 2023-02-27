<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/pchartstyle.css" />
</head>
<body>
<a href="../member/main">메인</a> <br />
<!-- 로그아웃 상태 -->
<c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   <a href="">join</a>
</c:if>
<!-- 로그인 상태 -->
<c:if test="${not empty sessionScope.loginid }">
   <a href="../member/logout">logout</a> 
   <!-- 로그인한 id가 admintest일 경우 관리자페이지로 접근 -->
   <c:choose>
      <c:when test="${sessionScope.loginid eq 'admintest' }">
         <a href="../review/reviewAdminpage">${sessionScope.loginid }님</a>
      </c:when>
      <c:otherwise>
         <a href="../review/reviewMylistview">${sessionScope.loginid }님</a>
      </c:otherwise>
   </c:choose>
<br />
</c:if>
<h3>별점순 top5</h3>
<div class="productChartPackage">

<ul class="productChart">
<c:forEach items="${chartScore_top5 }" var="scoredesc">
	<li>
		<div class="pdtthumbnail">
			<a href="../product/productDetail?pname=${scoredesc.productDto.p_name }&pfilesrc=${scoredesc.productDto.p_filesrc }">
			<img src="../resources/img/productimg/${scoredesc.productDto.p_filesrc }.jpg" alt="" />
			</a>
		</div>
		<div class="pdtdetail">
			<p class="pname">
			<a href="../product/productDetail?pname=${scoredesc.productDto.p_name }&pfilesrc=${scoredesc.productDto.p_filesrc }">
			${scoredesc.productDto.p_name}
			</a>
			</p>
			<p class="ppcolor">
				<span style="color: #ff7f00;">★</span><span>${scoredesc.productDto.avgscore}</span>
			</p>
			<p class="pprice">
				<span>${scoredesc.productDto.p_price}</span>
			</p>
		</div>
	</li>	
</c:forEach>
</ul>

</div>

</body>
</html>