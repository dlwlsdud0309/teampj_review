<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" href="resources/css/search_oliststyle.css" />
<style>
</style>
<!-- header section -->
<%@include file="admin_header.jsp" %>
</head>

<body>
<h3 class="line-h3" align="center">관리자 주문현황 검색</h3>
<br />
<div class="a">
<a href="admin_olist" class="returnolist">돌아가기</a>
</div>
	<div align="center">
	<table border="1" >
		<tr bgcolor="#CCCCCC" style="height: 80px;">
			<th class="th1" width="9%">상품주문번호</th>
			<th class="th1" width="12%">주문번호</th>
			<th class="th1" width="6%">상품번호</th>
			<th class="th1" width="6%">주문수량</th>			
			<th class="th1" width="8%">아이디</th>
			<th class="th1" width="8%">주문일자</th>
			<th class="th1" width="6%">결제형태</th>
			<th class="th1" width="8%">총액</th>
			<th class="th1" width="8%">처리상태</th>
			<th class="th1" width="12%">주문취소요청여부</th>
			<th class="th1" width="9%">주문취소일자</th>
		</tr>

		<c:forEach items="${slist }" var="dto">
		<tr style="text-align: center;" height=" 50px;">
<!-- 상품주문번호 -->       <td width="10%"><a href="admin_contentview?om_cntnum=${dto.om_cntnum}"
								class="om_cntnum">
									${dto.om_cntnum }</a></td> 
<!-- 주문번호 -->		    <td>${dto.om_num }</td>
<!-- 상품번호 -->			<td>${dto.p_no }</td>
<!-- 주문수량 -->			<td>${dto.u_cnt }</td>			
<!-- 아이디 -->			<td>${dto.m_id }</td>
<!-- 주문일자 -->			<td><fmt:formatDate value="${dto.om_date }" pattern="yyyy-MM-dd"/></td>
<!-- 결제형태 -->			<td>${dto.om_pay }</td>
<!-- 총액 -->			    <td><fmt:formatNumber type="currency" value="${dto.p_price }" /></td>
<!-- 처리상태 -->			<td>${dto.om_state }</td>
<!-- 주문취소요청여부 -->		<td>${dto.om_cancle }</td>
<!-- 주문취소일자 -->		<td><fmt:formatDate value="${dto.om_cdate }" pattern="yyyy-MM-dd"/></td>


		</tr>	
		</c:forEach>
	</table>	
  </div>
  

	
</body>
<br /><br /><br /><br />
</html>

<!-- footer section -->
<%@ include file="admin_footer.jsp" %>
