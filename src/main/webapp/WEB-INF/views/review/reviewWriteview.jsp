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
		alert("target : "+target.value);
		$('#starInput[name=r_score]').attr('value',target.value);	
	}
	
	function getvalue(target) {
		alert(target.value);
	}
	
	/* function writeviewClose(){
		window.opener.top.location.href="reviewMylistview"
		window.close()
	} */
	/* function reloadParent(){
		window.opener.location.reload();
		opener.parent.location="reviewMylistview";
		window.close()
	} */
	
	/* function writeSaveClose(){ */
		/* $.ajax({
			type:"post",
			cashe: false,
			url: "../review/reviewMylistview",
			data: $('#writeview').serialize(),
			success: function(){
				addressList(listType);
			}
		}); */
		//window.opener.document.location.href = window.opener.document.URL;
		//opener.parent.location="../review/reviewMylistview";
		//window.opener.location.reload();
		
		//document.formname_reviewWriteview.submit();
		//window.close();
		
		/* opener.parent.location.reload();
		window.close();
	} */
	
	/* function goSubmit(){
		window.opener.name="parentPage";
		document.formname_reviewWriteview.target="parentPage";
		document.formname_reviewWriteview.action="/review/reviewMylistview";
		document.formname_reviewWriteview.submit();
		self.close();
	} */
	
</script>
<script type="text/javascript">
	opener.document.location.reload();
	self.close();
</script>
</head>
<body>
<h3>reviewWriteview</h3>
<h1>리뷰 작성하기</h1>
<form action="reviewWrite" name="formname_reviewWriteview" method="post" enctype="multipart/form-data">
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
			<td colspan="3"><input type="text" name="r_title" size="45" /></td>
		</tr>
		<tr>
			<td colspan="3" class="left">내용</td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea name="r_content" rows="10" cols="47"></textarea>
			</td>
		</tr>
		<tr>
			<td class="left">파일첨부</td>
			<td colspan="2">
				<!-- <input type="file" name="r_filesrc" onchange="readURL(this);" /> -->
				<!-- <input type="file" id="file" name="r_filesrc" onchange="LoadImg(this);" multiple /> -->
				<input type="file" id="image" name="r_filesrc" accept="image/*" onchange="setThumbnail(event);" multiple/>
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
				<input id="starInput" type="hidden" name="r_score" value="" size="10" />
				<input onclick="goSubmit();" type="submit" value="작성하기"/>
<%-- 				<input type="submit" value="작성하기" onclick="writeviewClose('${sessionScope.loginid }','${reviewWrite_orderlist.om_cntnum }',
				'${reviewWrite_orderlist.p_no }',r_title,r_content,r_filesrc,r_score);"/> --%>
			</td>
		</tr>
	</table>
</form>
<!-- <script>
	function writeviewClose(loginId,om_cntnum,p_no,r_title,r_content,r_filesrc,r_score){
		var form=document.createElement('form');
		var obj;
		
		obj=document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','loginId');
		obj.setAttribute('value',loginId);
		form.appendChild(obj);
		form.setsetAttribute('method','post');
		form.setsetAttribute('action','reviewMylistview');
		document.body.appendChild(form);
		form.submit();
		
		window.close();
	}
</script> -->
</html>