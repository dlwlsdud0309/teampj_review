<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin_contentviewstyle.css" />
</head>

<body>
<!-- class="jumbotron text-center" -->
<div>
	<h1 class="content_h1" align="center">관리자 주문내역 상세</h1>
	<h3 class="content_h3" align="center">관리자 주문/결제 수정</h3>
</div>

<script>
//var selectValue = document.getElementById('1').value;
//var selectValue = document.getElementById('select').value = '1';
//document.querySelector('select').onchange();
//alert(selectValue);
/* $(document).ready(function(){
  $(#admin_cancle).on('click' , function(){
       $(#om_stateBox).val('주문취소').prop("selected", true);
      });
}); */

/* $(document).ready(function(){
  $(#om_stateBox).on('change' , function(){
       $(this).val('주문확정').prop("selected", true);
      });
}); */

/* $(document).ready(function(){
	  $(#admin_rest).on('click' , function(){
	       $(#om_stateBox).val('주문확정').prop("selected", true);
	      });
}); */

//select 옵션 선택시  alert
var selectValue = document.getElementById('om_stateBox').value;
alert(selectValue);

</script>


<form action="modify" method="post">
<input type="hidden" name="om_cntnum" value="${acontent_view.om_cntnum }" />
  <table border="1" style="margin-left: 640px;">
		 <tr bgcolor="#CCCCCC" style="height: 100px; font-size:x-large;">
		 	<th colspan="4">주문상세</th>
		 	
		 	
		 	
		 </tr>
		 <tr bgcolor="#e8e8e8" style="height: 40px;">
		 	<th>주문일자</th>
		 	<th>ID</th>
		 	<th colspan="2">주문번호</th>
		 </tr>
		 <tr style="height: 60px;">
		 	<td><fmt:formatDate value="${acontent_view.om_date }" pattern="yyyy-MM-dd"/></td>
		 	<td>${acontent_view.m_id }</td>
		 	<td colspan="2">${acontent_view.om_num }</td>
		 </tr>	
		 <tr bgcolor="#CCCCCC" style="height: 100px; font-size:x-large;">
		 	<th colspan="4">제품정보</th>
		 	
		 	
		 	
		 </tr>
		 <tr bgcolor="#e8e8e8" style="height: 40px;">
		    <th>상품주문번호</th>
		    <th>상품번호</th>
		    <th>총액</th>
		    <th>주문상태</th>
		 </tr>	 
		 <tr style="height: 60px;">
		     <td>${acontent_view.om_cntnum }</td>
		     <td>${acontent_view.p_no }</td>
		     <td><fmt:formatNumber type="currency" value="${acontent_view.p_price }" /></td>
		     <td>
		     <label>결제완료</label>							
		     <select id="om_stateBox" name="om_state"  onchange="alert(this.value)">
		       <option value="" selected>-- 결제완료 --</option>
		       <option id="0" value="주문취소">주문취소</option>	              
		       <option id="1" value="주문확정">주문확정</option>	                                                        
		       <option id="2" value="배송완료">배송완료</option>	                            
		       <option id="3" value="반품완료">반품완료</option>	                            
		       <option id="4" value="구매확정">구매확정</option>	
		     </select>
		       <input type="submit" id="admin_cancle" value="변경"/>                            
		    </td>
		 </tr>
		 <tr bgcolor="#e8e8e8" style="height: 40px;">
		 	 <th>주문취소일자</th> 
		 	<th>주문취소사유</th>
		 	<th colspan="1"></th>
		 	<th></th>
		 </tr>
		 <tr style="height: 50px;">
		    <td><fmt:formatDate value="${acontent_view.om_cdate }" pattern="yyyy-MM-dd"/></td>
		    <td>${acontent_view.c_reason }</td>
		 	<td colspan="1"></td>
		 	<td></td>
		 </tr>
	</table>
	<br /> <br /><br />

	 	
	<div class="a">
	<a href="admin_olist" class="returnolist">목록</a>
	</div>
	
</form>

</body>
</html>