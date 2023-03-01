<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<html lang="ko">

<head>
<link rel="stylesheet" href="./resources/css/pstyle.css" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<title>category</title>
</head>
<body>  
	<jsp:include page="/WEB-INF/views/header2.jsp" />
	
	<h3>카테고리</h3>
	
	<jsp:include page="/WEB-INF/views/aside.jsp" />
	
	<div class="productNormalPackage">
	${productlsit.size() }
	<ul class="productList">
	
	<c:forEach items="${productlsit}" var="plist">
		<li>
			<div class="pdtthumbnail" >
				<a href="product/productDetail?pname=${plist.p_name }&pfilesrc=${plist.p_filesrc}">
				<img src="./resources/img/productimg/${plist.p_filesrc}.jpg" alt="" />
				</a>
			</div>
			<div class="pdtname">
				<a href="product/productDetail?pname=${plist.p_name}&pfilesrc=${plist.p_filesrc}">
				${plist.p_name}
				</a>
			</div>
			<div class="pdtprice">
				<p><fmt:formatNumber value="${plist.p_price}" pattern="###,###"/>원</p>
			</div>
		</li>	
	</c:forEach>
	</ul>
	</div>
</body>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</html>
