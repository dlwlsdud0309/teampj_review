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
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
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
</script>
</head>
<body>
<%
String om_cntnum=request.getParameter("om_cntnum");
String p_no=request.getParameter("p_no");
%>
<%=om_cntnum %>
<%=p_no %><h3>reviewMylistview</h3>


<h1>상품리뷰</h1>
<p>리뷰 작성 시 적립 가능한 최대 마일리지</p>
<div>
	<p>
		리뷰 리워드 혜택 안내
		<br />
		주문 상품 수령 후 30일 내 리뷰 작성시 10일 후 마일리지를 적립해드립니다.
	</p>
	<ul>
		<li>일단 텍스트 리뷰 : 500M, 사진 첨부 리뷰 : 1,000M 적립</li>
		<li>리워드 적립 전 리뷰 삭제 시 적립 대상에서 제외됩니다.</li>
		<li>반품 접수 시에는 리뷰 작성이 불가합니다.</li>
		<li>리뷰 작성으로 적립된 마일리지 유효기간은 2년입니다.</li>
	</ul>
</div>
<h1>리뷰 작성하기</h1>
<div>
		<input type="button" value="리뷰작성" onclick="rWrite();" /> <br />
		<div id="styleID_ReviewWriteview" class="styleClassReviewWriteview">
			<div id="title_content">
				<form action="reviewWrite" method="post" enctype="multipart/form-data">
				<h3 class="popup_review_title">상품리뷰쓰기</h3>
				<div>
					<strong>리뷰 리워드 혜택 제공</strong> <br />
					텍스트 리뷰 : 500M | 사진 첨부 리뷰 : 1,000M 적립
				</div>
					<table>
						<tr id="data">
							<td class="star">
								★★★★★
								<span class="star2">★★★★★</span>
								<input type="range" onclick="redeptlist(this);" oninput="drawStar(this)" value="1" step="1" min="0" max="5"/>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input id="userid" type="hidden" name="m_id" value="${sessionScope.loginid }" />
								<input type="hidden" name="om_cntnum" value="<%=om_cntnum %>" />
								<input type="hidden" name="p_no" value="<%=p_no %>" />
							</td>
						</tr>
						<tr>
							<td class="left">제목</td>
							<td colspan="2"><input type="text" name="r_title" /></td>
						</tr>
						<tr>
							<td class="left">내용</td>
							<td colspan="2">
								<textarea name="r_content" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td class="left">파일첨부</td>
							<td colspan="2">
								<input type="file" name="r_filesrc" />
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input id="starInput" type="hidden" name="r_score" value="" size="10" />
								<input type="submit" value="작성하기" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
<script>
	function rWrite(){
		$(".styleClassReviewWriteview").bPopup();
	}
</script>
	<p>
		현재 상품평을 작성할 수 있는 상품이 없습니다.
		<br />
		구매하신 상품이 있다면 상품에 대한 이야기를 들려주세요
		<br />
		<a href="../order/myOrderList">주문내역보러가기</a>
	</p>
</div>
<hr />
	<div class="reviewListview_total">
		<div class="reviewListview_label">
		<c:forEach items="${review_orderlist }" var="myorderlist">
			<div class="row">
				<div class="cell col11">
					<div>주문번호 : ${myorderlist.om_num }</div>
					<div class="reviewListview_img_box">
						<a href="../product/productDetail?pname=${myorderlist.productDto.p_name }&pfilesrc=${myorderlist.productDto.p_filesrc }"><img src="../resources/img/productimg/${myorderlist.productDto.p_filesrc }.jpg" width="200" /></a>
					</div>
					<div>${myorderlist.productDto.p_name }</div>
					<div>${myorderlist.productDto.p_price }</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
<hr />
<h1>작성한 리뷰보기</h1>
	<ul>
		<li>리워드가 적립된 리뷰는 삭제가 불가하며, 삭제버튼이 노출되지 않습니다.</li>
		<li>리워드가 적립된 리뷰에 대한 삭제 요청은 고객센터로 문의해주세요.</li>
	</ul>
	<div class="clear" ></div>
	<hr />
	
	<div class="reviewListview_total">
		<div class="reviewListview_label">
		<c:forEach items="${review_mylist }" var="mylist">
			<div class="row">
				<div class="cell col11">
					<div class="reviewListview_img_box">
						<a href="../product/productDetail?pname=${mylist.productDto.p_name }&pfilesrc=${mylist.productDto.p_filesrc }"><img src="../resources/img/productimg/${mylist.productDto.p_filesrc }.jpg" width="200" /></a>
					</div>
					<div>
						<button type="button" onclick="location.href='reviewPopupcontentview?r_no=${mylist.r_no }'">수정</button>
						<button type="button" onclick="location.href='reviewDelete?r_no=${mylist.r_no }'">삭제</button>
					</div>
				</div>
				<div class="cell col22">
					<div>
						<div class="cell">
							<div>
								<strong><a href="../product/productDetail?pname=${mylist.productDto.p_name }&pfilesrc=${mylist.productDto.p_filesrc }">${mylist.productDto.p_name }</a></strong>
							</div>
						</div>
						<div class="cell">
							<div>
								<span>${mylist.m_id }</span>&nbsp;<span><fmt:formatDate value="${mylist.r_date }" pattern="yyyy.MM.dd"/></span>
							</div>
						</div>
						<div>
							<div>${mylist.r_title }</div>
							<div>${mylist.r_content }</div>
							<div><img src="../resources/reviewupload/${mylist.r_filesrc }" width="200" alt="" /></div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
</body>
</html>