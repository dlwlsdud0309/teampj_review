<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{ font-family: Nanum Gothic;}
h3{ color: #2E2E2E; font-size: 30px; font-weight: 400; text-align: center; margin: 10px; padding: 10px;}
#more_list{
	width: 930px;
	border-collapse: collapse;
	border: 1px solid #E6E6E6;
	margin: 5px auto;
	font-size: 14px;
}
thead tr td{ text-align: center; border: 1px solid #E6E6E6;	color: #141414;	background-color: #FBFAFA;}
tbody tr td{ border-bottom: 1px solid #E6E6E6; color: #353535; margin: 0; padding: 2px 6px;}
.option{ color: #757575; font-size: 12px; margin: 2px 0;}
.right{ text-align: right; margin: 10px;}
.state{ text-align: center;}
button{	background-color: #FFF;	border: 1px solid #353535; border-radius: 3px; margin: 2px auto; text-align: center;}
.stateInfo{ padding: 1px; margin: 2px auto;	text-align: center;}
.logInOut-box,.page-more{ margin: 10px 20px 10px 700px;	width: 250px;}
</style>
<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
<main class="" id="main-collapse">

<div class="logInOut-box">
<c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   |  <a href="">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid }">
	 <div>
	 	<p>회원님의 현재 보유 캐시 : <fmt:formatNumber value="${myList.m_cash}" pattern="###,###"/>원</p>
	 </div>
 </c:if>
</div>
 
<h3>나의 주문내역</h3>
<form action="">
<input type="hidden" name="viewCount" id="viewCount" value="0" />
<input type="hidden" name="startCount" id="startCount" value="0" />
<table border="1" id="more_list">
	<thead>
		<tr>
			<td>주문일자</td>
			<td>주문번호</td>
			<td colspan="2">상품정보</td>
			<td>총액</td>
			<td colspan="2">주문상태</td>
		</tr>
	</thead>
	<tbody>
				<c:choose>
		<c:when test="${totRowcnt eq '0' }">
			<tr>
				<td colspan="8">
					<c:out value="주문내역이없습니다"></c:out>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${omdList }" var="mlist">
				<tr>
					<td style="text-align: center"><fmt:formatDate value="${mlist.om_date }" pattern="yyyy.MM.dd"/></td>
					<td>${mlist.om_num }</td>
					<td><img src="../resources/img/productimg/${mlist.productDto.p_filesrc }.jpg" width="50" alt="상품사진" /></td>
					<td>
						${mlist.productDto.p_name} <br />
						<div class="option">${mlist.productDto.p_color} / ${mlist.productDto.p_size}</div>
						${mlist.u_cnt}개
					</td>
					<td><div class="right"><fmt:formatNumber value="${mlist.p_price}" pattern="###,###"/>원</div></td>
					<td><div class="state">${mlist.om_state}</div></td>
					<td class="stateInfo">
					<c:choose>
						<c:when test="${mlist.om_cancle eq 'N' && mlist.om_state eq '결제완료'}">
							<button type="button" onclick="myOrder_btn('myOrderCancel','${mlist.om_cntnum}')">결제취소</button>
						</c:when>
						<c:when test="${mlist.om_state eq '주문확정' || mlist.om_state eq '배송중'}">
							<span>배송중</span>
						</c:when>
						<c:when test="${mlist.om_cancle eq 'Y'}">
							<span>취소요청</span>
						</c:when>
						<c:when test="${mlist.om_state eq '배송완료' && mlist.om_delcancle eq 'N'}">
							<button type="button" onclick="myOrder_btn('myDelivCancel','${mlist.om_cntnum}')">반품요청</button> <br />
							<button type="button" onclick="myOrder_btn('myOrderConfirm','${mlist.om_cntnum}')">구매확정</button>
						</c:when>
						<c:when test="${mlist.om_state eq '구매확정'}">
							<button type="button" onclick="location.href='../review/reviewMylistview'">리뷰쓰기</button>
						</c:when>
						<c:when test="${mlist.om_state eq '반품완료'}">
							<span>감사합니다.</span>
						</c:when>
						<c:otherwise>
							<span>처리중입니다.</span>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>
</form>
<br />
totCnt : ${totRowcnt } <br />
현재페이지/토탈페이지 : ${searchVO.page }/ ${searchVO.totPage } <br />

<c:if test="${searchVO.page>1 }">
	<a href="myOrderList?page=1">[처음]</a>
	<a href="myOrderList?page=${searchVO.page-1 }">[이전]</a>
</c:if>
<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
	<c:choose>
		<c:when test="${i eq searchVO.page }">
			<span style="color:red; font-weight: bold">
			${i }&nbsp;
			</span>
		</c:when>
		<c:otherwise>
			<a href="myOrderList?page=${i }" style="text-decoration: none">
			${i }&nbsp;
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${searchVO.page<searchVO.totPage }">
	<a href="myOrderList?page=${searchVO.page+1 }">[다음]</a>
	<a href="myOrderList?page=${searchVO.totPage }">[마지막]</a>
</c:if>
</main>


<script>
function myOrder_btn(type,omcntnum){
	var form = document.createElement('form'); // 폼객체 생성
	var objs;
	objs = document.createElement('input'); // 값이 들어있는 형식
	objs.setAttribute('type', 'hidden'); // 값이 들어있는 type
	objs.setAttribute('name', 'omcntnum'); // 객체이름
	objs.setAttribute('value', omcntnum); //객체값
	form.appendChild(objs);
	form.setAttribute('method', 'post'); //get,post 가능
	form.setAttribute('action', "../order/"+type); //보내는 url
	document.body.appendChild(form);
	form.submit();
}
</script>

<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>