<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>

</head>
<body>
<h3>reviewPopupcontentview</h3>
<h1>리뷰 수정하기</h1>
<%-- <input type="hidden" name="r_no" value="${popup_list.r_no }" /> --%>
<input type="button" value="리뷰작성" onclick="rWrite();" />

<div id="styleID_ReviewWriteview" class="styleClassReviewWriteview">
	<div id="title_content">
		<form action="reviewPopupcontentupdate" method="post" enctype="multipart/form-data">
		<h3 class="popup_review_title">상품리뷰쓰기</h3>
		<div>
			<strong>리뷰 리워드 혜택 제공</strong> <br />
			텍스트 리뷰 : 500M | 사진 첨부 리뷰 : 1,000M 적립
		</div>
		<br />
		<br />
			<table>
				<tr>
					<td class="left">작성자</td>
					<td><input type="text" name="m_id" value="${popupview.m_id }" /></td>
				</tr>
				<!-- <tr>
					reviewdao.xml에서 'TEMP'로 사용 중
				
					작성자는 session으로 받아올 것, 이후 작성자란은 삭제
					<td class="left">작성자</td>
					<td><input type="text" name="m_id" /></td>
				</tr> -->
				<tr>
					<td class="left">제목</td>
					<td><input type="text" name="r_title" value="${popupview.r_title }" /></td>
				</tr>
				<tr>
					<td class="left">내용</td>
					<td>
						<textarea name="r_content" rows="10">${popupview.r_content }</textarea>
					</td>
				</tr>
				<tr>
					<td class="left">파일첨부</td>
					<td><input type="file" name="r_filesrc" />${popupview.r_filesrc }</td>
				</tr>
				<tr>
					<td colspan="2">
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