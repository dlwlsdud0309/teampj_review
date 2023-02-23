<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%String loginid = (String)session.getAttribute("loginid"); %>
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
		$('#starInput[name=r_score]').attr('value',target.value);	
	}
	
	function getvalue(target) {
		alert(target.value);
	}
</script>
</head>
<body>
<h1>리뷰 작성하기</h1>
<form action="reviewWrite" id="frm" method="post" enctype="multipart/form-data">
<h3 class="popup_review_title">상품리뷰쓰기</h3>
<div>
	<strong>리뷰 리워드 혜택 제공</strong> <br />
	<div>텍스트 리뷰 : 500M | 사진 첨부 리뷰 : 1,000M 적립</div>
</div>
	<table id="writeview">
		<tr>
            <td rowspan="4"><img src="../resources/img/productimg/${reviewWrite_orderlist.productDto.p_filesrc }.jpg" width="150" /></td>
            <td>주문번호 : ${reviewWrite_orderlist.om_cntnum }</td>            
        </tr>
        <tr>
            <td>${reviewWrite_orderlist.p_no }</td>            
        </tr>
        <tr>
            <td>${reviewWrite_orderlist.productDto.p_name }</td>            
        </tr>
        <tr>
            <td>${reviewWrite_orderlist.productDto.p_price } 원</td>            
        </tr>
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
				<input type="hidden" name="om_cntnum" value="${reviewWrite_orderlist.om_cntnum }" />
				<input type="hidden" name="p_no" value="${reviewWrite_orderlist.p_no }" />
			</td>
		</tr>
		<tr>
			<td colspan="3" class="left">제목</td>
		</tr>
		<tr>
			<td colspan="3"><input type="text" id="r_title" name="r_title" size="45" /></td>
		</tr>
		<tr>
			<td colspan="3" class="left">내용</td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea id="r_content" name="r_content" rows="10" cols="47"></textarea>
			</td>
		</tr>
		<tr>
			<td class="left">파일첨부</td>
			<td colspan="2">
				<input type="file" name="r_filesrc"/>
				<!-- <input type="file" name="r_filesrc" onchange="readURL(this);" /> -->
				<!-- <input type="file" id="file" name="r_filesrc" onchange="LoadImg(this);" multiple /> -->
				<!-- <input type="file" id="image" name="r_filesrc" accept="image/*" onchange="setThumbnail(event);" multiple/> -->
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<!-- <img id="preview" src="" width="200"/> -->
				<!-- <img id="loadImg" src="" width="200"/> -->
				<div id="image_container"></div>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input id="starInput" type="hidden" id="r_score" name="r_score" value="" size="10" />
				<input id="writeBtn" type="submit" value="작성하기" onclick="writeviewClose();"/>
			</td>
		</tr>
	</table>
</form>
</body>
<script>
$(function writeviewClose(){
	$("#writeBtn").click(function(){
		setTimeout(function(){
			opener.location.reload();
			window.close();
		},10);
	});	
});</script>
</html>