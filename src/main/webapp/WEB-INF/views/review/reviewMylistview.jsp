<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String loginid = (String)session.getAttribute("loginid"); %>
<c:if test="${empty sessionScope.loginid }">
	<a href="../member/loginform">login</a> 
	<a href="">join</a>
</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> 
	<a href="reviewMylistview">${sessionScope.loginid }님</a>
<br />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/reviewstyle.css?after" />
<link rel="stylesheet" href="../resources/css/footer.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<script src="../resources/js/scriptjsp.js"></script>
<script>
	function redeptlist(target) {
		alert("target : "+target.value);
		$('#starInput[name=r_score]').attr('value',target.value);	
	}
	
	function getvalue(target) {
		alert(target.value);
	}
	
	/* 리뷰작성 시 window.open 사용하여 새창 띄우기 */
	function writeviewOpen(om_cntnum,p_no){
		var openWidth=400;
		var openheight=1000;
		
		var openWidthX=(window.screen.width/2)-(openWidth/2);
		var openheightY=(window.screen.height/2)-(openheight/2);
		
		var url="../review/reviewWriteview?om_cntnum="+om_cntnum+"&p_no="+p_no;
		window.open(url,'writeviewOpen','width=400,height=1000,location=no,fullscreen=no,menubar=no,toolbar=no,status=no,scrollbars=no,left='+openWidthX+',top='+openheightY);
	}

	function modifyviewOpen(r_no){
		var openWidth=400;
		var openheight=1000;
		
		var openWidthX=(window.screen.width/2)-(openWidth/2);
		var openheightY=(window.screen.height/2)-(openheight/2);
		
		var url="../review/reviewModifyview?r_no="+r_no;
		window.open(url,'modifyview','width=400,height=1000,location=no,fullscreen=no,menubar=no,toolbar=no,status=no,scrollbars=no,left='+openWidthX+',top='+openheightY);
	}
	
</script>
<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>

<body style="margin: 0px;">
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />

<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
<main class="" id="main-collapse">


<h1>상품리뷰</h1>
<div>

	<!--@@@ 캐시(마일리지) 안내 @@@-->
	<!--@@@ 작성가능한 리뷰 한 건당 최대 적립가능한 캐시로 출력 @@@-->
	<div class="mileage_box">
		<span>리뷰 작성 시 적립 가능한 최대 캐시</span><span class="mileage_span"><strong>${checkMileage }</strong> 캐시</span>
	</div>
	<div class="review_info">
		<p>
			리뷰 리워드 혜택 안내
			<br />
			주문 상품 수령 후 30일 내 리뷰 작성시 10일 후 캐시를 적립해드립니다.
		</p>
		<ul>
			<li>일단 텍스트 리뷰 : 500CASH, 사진 첨부 리뷰 : 1,000CASH 적립</li>
			<li>리워드 적립 전 리뷰 삭제 시 적립 대상에서 제외됩니다.</li>
			<li>반품 접수 시에는 리뷰 작성이 불가합니다.</li>
			<li>리뷰 작성으로 적립된 캐시 유효기간은 2년입니다.</li>
		</ul>
	</div>
	<br />
	<br />
	
	<h1>리뷰 작성하기</h1>
	<!--@@@ 구매확정된 구매내역이 없거나 전부 리뷰를 작성했을 때 @@@-->
	<c:if test="${empty review_orderlist }">
		<p>
			현재 상품평을 작성할 수 있는 상품이 없습니다.
			<br />
			구매하신 상품이 있다면 상품에 대한 이야기를 들려주세요
			<br />
			<a href="../order/myOrderList">주문내역보러가기</a>
		</p>
	</c:if>
	<hr />
	
	<!--@@@ 구매확정된 구매내역이 있을 때 @@@-->
	<c:if test="${not empty review_orderlist }">
		<div>
			<div class="class_review_orderlist">
				<c:forEach items="${review_orderlist }" var="myorderlist">
					<div class="hello" style="padding: 10px;">
						<div>
							<div class="reviewListview_img_box">
								<a href="../product/productDetail?pname=${myorderlist.productDto.p_name }&pfilesrc=${myorderlist.productDto.p_filesrc }">
									<img src="../resources/img/productimg/${myorderlist.productDto.p_filesrc }.jpg" width="230" />
								</a>
							</div>
							<div style="font-size: small;">
								<!--@@@ 상품명 @@@--><div style="font-weight: bold; font-size: 0.8em;">${myorderlist.productDto.p_name }</div>
								<!--@@@ 색상, 사이즈 @@@--><div style="font-size: 0.8em;">${myorderlist.productDto.p_color }/${myorderlist.productDto.p_size }</div>
								<!--@@@ 개수 @@@--><div style="font-size: 0.8em;">${myorderlist.u_cnt }개</div>
								<!--@@@ 가격 @@@--><div style="font-weight: bolder;">${myorderlist.productDto.p_price } 원</div>
							</div>
		
							<!--@@@ 작성하기 버튼 @@@-->
							<button onclick="writeviewOpen('${myorderlist.om_cntnum }','${myorderlist.p_no }');">리뷰작성</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	<hr />
	</c:if>


	<br />
	<h1>작성한 리뷰보기</h1>
		<div class="review_info">
			<ul>
				<li>리워드가 적립된 리뷰는 삭제가 불가하며, 삭제버튼이 노출되지 않습니다.</li>
				<li>리워드가 적립된 리뷰에 대한 삭제 요청은 고객센터로 문의해주세요.</li>
			</ul>
		</div>
		<br />
		<div class="clear" ></div>
		<hr />
		
		
	<!--@@@ 작성한 리뷰가 없을 때 @@@-->
	<c:if test="${empty review_mylist }">
		<br />
		<br />
		<br />
		<center><strong>작성한 리뷰가 없습니다.</strong></center>
		<br />
		<br />
		<br />
		<br />
	</c:if>
	
	
	<!--@@@ 작성한 리뷰가 있을 때 @@@-->
	<c:if test="${not empty review_mylist }">
		<div class="reviewListview_total">
			<div class="reviewListview_label">
			<c:forEach items="${review_mylist }" var="mylist">
				<div class="myreview">
					<div class="cell col11">
						<div class="reviewListview_img_box">
							<a href="../product/productDetail?pname=${mylist.productDto.p_name }&pfilesrc=${mylist.productDto.p_filesrc }">
								<img src="../resources/img/productimg/${mylist.productDto.p_filesrc }.jpg" width="200" />
							</a>
						</div>
						<div>
							<!-- 수정, 삭제 -->
							<button onclick="modifyviewOpen('${mylist.r_no }')">수정</button>
							
							<!-- 답글이 달리면 삭제할 수 없도록 '삭제'버튼을 제거 -->
							<c:choose>
								<c:when test="${mylist.r_ynn eq 'n' }">
									<button type="button" onclick="location.href='../review/reviewMylistDelete?r_no=${mylist.r_no }'">삭제</button>
								</c:when>
							</c:choose>
						</div>
					</div>
					
					<div class="cell col22">
						<div>
							<div class="cell">
								<div>
									<strong><a href="../product/productDetail?pname=${mylist.productDto.p_name }&pfilesrc=${mylist.productDto.p_filesrc }">${mylist.productDto.p_name }</a></strong>
								</div>
								<div class="small_gray">${mylist.productDto.p_no }</div>
								<div>
									<strong>구매옵션</strong>&nbsp;<span class="small_gray">${mylist.productDto.p_color }, ${mylist.productDto.p_size }</span>
								</div>
							</div>
							<div style="padding: 5px;">
								<hr />
								<br />
								<div><strong>${mylist.r_title }</strong></div>
								<br />
								<div>${mylist.r_content }</div>
								<br />
								<c:if test="${mylist.r_filesrc ne null }">
									<div>
										<img src="../resources/reviewupload/${mylist.r_filesrc }" width="200" alt="" />
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="cell col33">
						<div>
							<span>${mylist.m_id }</span>&nbsp;<span><fmt:formatDate value="${mylist.r_date }" pattern="yyyy.MM.dd"/></span>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>

	</c:if>
</div>

<div class="clear"></div>
<jsp:include page="/WEB-INF/views/footer.jsp" />


</main>

</body>
</html>