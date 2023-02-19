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
</script>
	
</head>
<body>
<h3>reviewWriteview</h3>
<h1>리뷰 작성하기</h1>
<%
String om_cntnum=request.getParameter("om_cntnum");
String p_no=request.getParameter("p_no");
%>
<%=om_cntnum %>
<%=p_no %>


<input type="button" value="리뷰작성" onclick="rWrite();" />

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
					<!-- <td class="left">작성자</td> -->
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
</body>
<script>
	function rWrite(){
		$(".styleClassReviewWriteview").bPopup();
	}
</script>
</html>