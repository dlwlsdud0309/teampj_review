<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/pchartstyle.css" />
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />

<c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid }">
    <a href="../member/logout">logout</a> 
 <br />
 ${sessionScope.loginid } 님, 로그인상태입니다.
	 <div>
		<p class="go-myOrderList" style="color: #336666;">
		<a href="../member/mypageform">마이페이지로</a>
		</p>
	</div>
 </c:if>
 
 <!-- 로그인 상태라면 나의 주문내역보기 가능 -->

<h3>판매량 top5</h3>
<div class="productChartPackage">

<h4>현재시간 top5</h4>
<ul class="productChart">
<c:forEach items="${pdtTimeChart }" var="pTChart">
	<li>
		<div class="pdtthumbnail">
			<a href="productDetail?pname=${pTChart.p_name }&pfilesrc=${pTChart.p_filesrc }">
			<img src="../resources/img/productimg/${pTChart.p_filesrc }.jpg" alt="" />
			</a>
		</div>
		<div class="pdtdetail">
			<p class="pname">
			<a href="productDetail?pname=${pTChart.p_name }&pfilesrc=${pTChart.p_filesrc }">
			${pTChart.p_name}
			</a>
			</p>
			<p class="pcolor">
				<span>${pTChart.p_color}</span>
			</p>
			<p class="pprice">
				<span><fmt:formatNumber value="${pTChart.p_price}" pattern="###,###"/>원</span>
			</p>
		</div>
	</li>	
</c:forEach>
</ul>
<h4>전체상품 top5</h4>
<ul class="productChart">
<c:forEach items="${productChart }" var="pChart">
	<li>
		<div class="pdtthumbnail">
			<a href="productDetail?pname=${pChart.p_name }&pfilesrc=${pChart.p_filesrc }">
			<img src="../resources/img/productimg/${pChart.p_filesrc }.jpg" alt="" />
			</a>
		</div>
		<div class="pdtdetail">
			<p class="pname">
			<a href="productDetail?pname=${pChart.p_name }&pfilesrc=${pChart.p_filesrc }">
			${pChart.p_name}
			</a>
			</p>
			<p class="pcolor">
				<span>${pChart.p_color}</span>
			</p>
			<p class="pprice">
				<span>${pChart.p_price}</span>
			</p>
		</div>
	</li>	
</c:forEach>
</ul>

</div>
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
<h3>남성 인기 순위 top5</h3>
<div class="productChartPackage">
	<ul class="productChart">
	<c:forEach items="${maleScore_top5 }" var="malescoredesc">
		<li>
			<div class="pdtthumbnail">
				<a href="../product/productDetail?pname=${malescoredesc.p_name }&pfilesrc=${malescoredesc.p_filesrc }">
				<img src="../resources/img/productimg/${malescoredesc.p_filesrc }.jpg" alt="" />
				</a>
			</div>
			<div class="pdtdetail">
				<p class="pname">
				<a href="../product/productDetail?pname=${malescoredesc.p_name }&pfilesrc=${malescoredesc.p_filesrc }">
				${malescoredesc.p_name}
				</a>
				</p>
				<p class="ppcolor">
					<span>${malescoredesc.p_color}</span>
				</p>
				<p class="pprice">
					<span>${malescoredesc.p_price}</span>
				</p>
			</div>
		</li>	
	</c:forEach>
	</ul>
</div>
<h3>여성 인기 순위 top5</h3>
<div class="productChartPackage">
	<ul class="productChart">
	<c:forEach items="${femaleScore_top5 }" var="femalescoredesc">
		<li>
			<div class="pdtthumbnail">
				<a href="../product/productDetail?pname=${femalescoredesc.p_name }&pfilesrc=${scoredesc.p_filesrc }">
				<img src="../resources/img/productimg/${femalescoredesc.p_filesrc }.jpg" alt="" />
				</a>
			</div>
			<div class="pdtdetail">
				<p class="pname">
				<a href="../product/productDetail?pname=${femalescoredesc.p_name }&pfilesrc=${scoredesc.p_filesrc }">
				${femalescoredesc.p_name}
				</a>
				</p>
				<p class="ppcolor">
					<span>${femalescoredesc.p_color}</span>
				</p>
				<p class="pprice">
					<span>${femalescoredesc.p_price}</span>
				</p>
			</div>
		</li>	
	</c:forEach>
	</ul>
</div>

</body>
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</html>