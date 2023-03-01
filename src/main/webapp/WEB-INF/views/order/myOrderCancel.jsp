<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<style>
.cancel-form{margin: 50px auto;}
h3{margin: 50px auto; text-align: center;}
table{border-collapse: collapse;margin: 30px auto;}
.thead{text-align: center;}
td{padding: 3px;margin: 3px;border:1px solid #ccc;}
.submit-btn-div{margin: 3px auto;text-align: center;}
.submit-btn{background-color: #FFF;	border: 1px solid #353535; border-radius: 3px; margin: 2px auto; text-align: center;}
.go-productList{margin: 3px auto;text-align: center;}
</style>
</head>
<body>
<h3>취소요청 상품 </h3>
<div class="cancel-form">
<form action="myOCancleOffer" method="post">
	<input type="hidden" name="calcleOfferomcntnum" id="calcleOfferomcntnum" value="${myOrderCancelOffer.om_cntnum }" />
	<table id="more_list">
			<tr class="thead">
				<td>주문일자</td>
				<td>주문번호</td>
				<td colspan="2">상품정보</td>
				<td>주문수량</td>
				<td>총액</td>
			</tr>
			<tr>
				<td><fmt:formatDate value="${myOrderCancelOffer.om_date }" pattern="yyyy.MM.dd"/></td>
				<td>${myOrderCancelOffer.om_num }</td>
				<td>
				<img src="../resources/img/productimg/${myOrderCancelOffer.productDto.p_filesrc }.jpg" width="50" alt="상품사진" /></td>
				<td>
					${myOrderCancelOffer.productDto.p_name } <br />
					${myOrderCancelOffer.productDto.p_color } <br />
					${myOrderCancelOffer.productDto.p_size }
				</td>
				<td>${myOrderCancelOffer.u_cnt }</td>
				<td><fmt:formatNumber value="${myOrderCancelOffer.p_price}" pattern="###,###"/>원</td>
			</tr>
			<tr>
				<td colspan="8">
					<div class="textLengthWrap">
						<span id="maxtext-display" style="display: none;">글자수는 100자까지 입력 가능합니다.</span>
						<p class="textCnt">0자</p>					
						<p class="textTot">/100자</p>					
					<textarea name="myOrderCancelReason" id="myOrderCancelReason" cols="100" rows="5" maxlength="100" placeholder="주문취소사유를 작성해주세요." style="resize: none;"></textarea>
					</div>
				</td>
			</tr>
	</table>
	<div class="submit-btn-div">
	<input type="submit" value="취소요청하기" class="submit-btn" />
	</div>
</form>

<br />
 <div>
	<p class="go-productList">
	<a href="../order/myOrderList" >이전으로</a>
	</p>
 </div>
 </div>
<script>
	$('#myOrderCancelReason').keyup(function (e) {
		let content = $(this).val();

	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCnt').text('0자');
	    } else {
	    	$('.textCnt').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 100) {
	    	// 100자 부터 제한
	        $(this).val($(this).val().substring(0, 100));
	        // 100자 넘으면 뜨도록
	        $('#maxtext-display').css("display","");
	    }else{
	    	//100자 안넘으면 다시 문구사라지기
	        $('#maxtext-display').css("display","none");	    	
	    }
	});
</script>

</body>
</html>