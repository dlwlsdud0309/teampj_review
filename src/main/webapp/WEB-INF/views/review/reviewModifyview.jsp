<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%String loginid = (String)session.getAttribute("loginid"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Nanum+Gothic:wght@400;800&family=Noto+Sans+KR:wght@100&family=Titillium+Web&display=swap" rel="stylesheet">

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
<h1>리뷰 수정하기</h1>
	<div id="title_content">
		<form action="reviewModify" method="post" enctype="multipart/form-data">
			<input type="hidden" name="r_no" value="${modifyview.r_no }" />
			<h3 class="popup_review_title">상품리뷰쓰기</h3>
			<div>
				<strong>리뷰 리워드 혜택 제공</strong> <br />
				텍스트 리뷰 : 500M | 사진 첨부 리뷰 : 1,000M 적립
			</div>
				<table>
					<tr id="data">
						<td class="star">
							★★★★★
							<span class="star2" style="width:${modifyview.r_score*20}%">★★★★★</span>
							<input type="range" onclick="redeptlist(this);" oninput="drawStar(this)" value="1" step="1" min="0" max="5"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="left">제목</td>
					</tr>
					<tr>
						<td colspan="3"><input type="text" name="r_title" size="45" value="${modifyview.r_title }"/></td>
					</tr>
					<tr>
						<td colspan="3" class="left">내용</td>
					</tr>
					<tr>
						<td colspan="3">
							<textarea name="r_content" rows="10" cols="47">${modifyview.r_content }</textarea>
						</td>
					</tr>
					<tr>
						<td class="left">파일첨부</td>
						<td colspan="2" class="image-container">
							<img style="width: 200px;" id="preview-image" src="../resources/reviewupload/${modifyview.r_filesrc }" alt="이미지를 넣어주세요">
			   				<input style="display: block;" type="file" name="r_filesrc" id="input-image">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input id="starInput" type="hidden" name="r_score" value="${modifyview.r_score }" size="10" />
							<input id="modifyBtn" type="submit" value="수정하기" onclick="modifyviewClose();"/>
						</td>
					</tr>
				</table>
		</form>
	</div>
</body>
<script>
$(function modifyviewClose(){
	$("#modifyBtn").click(function(){
		setTimeout(function(){
			opener.location.reload();
			window.close();
		},10);
	});	
});

function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader();
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image");
            previewImage.src = e.target.result;
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target);
})

/* 참고 주소 : http://yoonbumtae.com/?p=3304 */
</script>
</html>