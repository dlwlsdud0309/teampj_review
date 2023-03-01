<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<link rel="stylesheet" href="../resources/css/pdetailstyle.css?after" />
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />


<h3>상품</h3>

<div class="pdt">
	<c:forEach items="${product}" var="p" varStatus="status" begin="0" end="0">
	<div class="main-img">
		<img src="../resources/img/productimg/${p.p_filesrc}.jpg" alt="상품사진" />
	</div>
	</c:forEach>
	
	<div class="pdtdetailleft">
		<c:forEach items="${product}" var="p" varStatus="status" begin="0" end="0">
			<div class="main-name">
				<span>${p.p_name}</span>
				<span>${p.p_color}</span>
			</div>
		</c:forEach>
		<div class="pdtthumbnail">
			<c:forEach items="${productMain}" var="pm">
				<div class="pdtimgs">
					<input type="hidden" name="pname" value="${pm.p_name}" />
					<input type="hidden" name="pfilesrc" value="${pm.p_filesrc}" /> 
				<!-- 상품사진을 누를때마다 새로운 값을 보내서 아랫단의 ${product } 값을 지정하게됨 -->
					<a href="../product/productDetail?pname=${pm.p_name}&pfilesrc=${pm.p_filesrc}">
					<img src="../resources/img/productimg/${pm.p_filesrc}.jpg" width="150" class="product_img" alt="" />
					</a>
					<input type="hidden" name="pcolor" value="${pm.p_color}" />
				</div>		
			</c:forEach>
		</div>
		
		<br /> <br />
		<div class="productDetail">
			<c:forEach items="${product}" var="p" begin="0" end="0">
			
				<span><fmt:formatNumber value="${p.p_price}" pattern="###,###"/>원</span>
			
			</c:forEach>
			<div class="pdtsize">
				<c:forEach items="${product}" var="p">
				<div class="pdtsizeradio">				
					<c:if test="${p.p_cnt > 0}">
					<div>
						<input type="radio" id="sizeNo${p.p_no}" class="sizeNo" name="sizeNo" value="${p.p_no}" onclick="sizeNo('${p.p_no}','${p.p_color}','${p.p_size}',${p.p_cnt});"/>
						<label for="sizeNo${p.p_no}">${p.p_size}</label>
					</div>
					</c:if>
					<c:if test="${p.p_cnt eq 0}">
					<div style="color: #333; background-color: #ccc; border-radius: 10px;">
						<input type="radio"/>
						<label for="sizeNo${p.p_no}">${p.p_size}</label>		
					</div>
					</c:if>
				</div>
				</c:forEach>
			</div>
		</div>
	
	</div>


<!-- 상품을 선택하지 않은 경우-->
<div>
	<p class="print-message-no-opt" style="display: none; color: #CC0099;">옵션을 선택해 주세요.</p>
</div>

<form action="../order/orderPage" method="post" class="order_form">
	<!-- 선택시 목록쌓이는 곳 -->
	<div class="choicelist">
		<!-- name="u_cnt"
 			 name="p_no" value="pno" -->
	</div>

	<div class="btns">
		<input type="submit" id="order_form" value="바로구매" />
		<input type="button" value="장바구니추가" onclick="return addcart(this.form)" class="cart-btn"/>
	</div>

</form>
</div>
<script>
	function addcart(frm) {
		var userid='<%=(String)session.getAttribute("loginid")%>';
		if(userid=='null'){
			alert("로그인이 필요합니다.");
			return false;
		}
		if($('#choice_pno').val()==null ){
			$('.print-message-no-opt').css('display','block');
			return false;
		}else{
		frm.action='../Cart/insertCart';
		frm.submit();
		alert("상품이 카트에 담겼습니다.");
		return true;
		}
	}
	function Count(type,pno,totcnt) { /* ths [object HTMLButtonElement] */
		/* alert(type+"***"+pno+"***"+totcnt); */
		var cnt="#cnt_"+pno;
		var tCount = Number($(cnt).val());
		if (type == 'plus') {
			if (tCount < totcnt)
				$(cnt).val(Number(tCount) + 1);
		} else {
			if (tCount >=2)
				$(cnt).val(Number(tCount) - 1);
		}
	}
</script>
<script>
	function deletechoice(pno){
		var pnoid="choice_"+pno;
		$("#"+pnoid).remove();
	}
</script>
<script>
	/* 사이즈 선택시 */
	/* 해당 사이즈의 재고량 변화 */
	function sizeNo(pno,pcolor,psize,totcnt) {
		$('.print-message-no-opt').css('display','none');
	 	/* alert("초이스 확인창"); */
/* 중복클릭 if else 처리 필요함 */
	 	var elems= document.getElementsByName('choice');	 	
	 	/* alert(elems.length); */
	 	var html='<div class="choice" name="choice" id="choice_'+pno+'"><p>'+pcolor+'&nbsp;'+psize+'</p>&nbsp;&nbsp;'
	 	+'<span>수량</span>'
	 	+'<input type="hidden" class="cnttot" name="재고수량" value="'+totcnt+'" />'
	    +'<input type="text" class="choice_pno" id="cnt_'+pno+'" name="u_cnt" value="1" size="1" readonly="readonly" style="text-align: center;" />'
	 	+'<input type="hidden" name="p_no" id="choice_pno" value="'+pno+'" />'
	    +'<button type="button" onclick="Count(\'minus\',\''+pno+'\','+totcnt+');">-</button>'
	 	+'<button type="button" onclick="Count(\'plus\',\''+pno+'\','+totcnt+');">+</button>'
	 	+'&nbsp;&nbsp;&nbsp; <button type="button" onclick="deletechoice(\''+pno+'\');">x</button>'
	 	+'</div>';
	 	
	 	if (elems.length==0) {
			$('.choicelist').append(html);
		}
 		for (var i = 0; i < elems.length; i++) {
			var elem =elems[i].id;
			if (('choice_'+pno)==elem){
				html='';
			}
		}
	 	$('.choicelist').append(html);	
	};
</script>
<!-- 선택 null 일때 창 -->
<script>
$('#order_form').click(function(){
	var userid='<%=(String)session.getAttribute("loginid")%>';
	if(userid=='null'){
		alert("로그인이 필요합니다.");
		return false;
	}
	if($('#choice_pno').val()==null ){
		$('.print-message-no-opt').css('display','block');
		return false;
	}

});

</script>


<br />
<c:set var="pname" value="${param.pname }" scope="application"/> <br />
<c:set var="pfilesrc" value="${param.pfilesrc }" scope="application"/> <br />
<br />
<br />
<jsp:include page="/WEB-INF/views/review/reviewBoard.jsp" />

</body>
</html>