<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<!-- <script>
	function user_content() {
		alert("ihi");
	}
</script> -->
<script>
	
	$(document).ready(function(){
		$(".u_content").click(function(){
			/* $(this).addClass("u_content"); */
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
			
		});
		/* $("a").click(function(){
			alert("왜");
		}); */
	});
	
	
	/* CSS는 나중에 하자 */
	/* $(document).ready(function(){ /* 써야함 */
		/* $("button").click(function(){
			$("a").show();
				alert("아오");
		});
	}); */
	
	
	
	
    
		
</script>
</head>

<body>
<h3>Reviewboard</h3>
<!-- 오류 -->
<%-- <a href="reviewMylistview?account=${review_mylist.m_id }" >마이페이지</a> --%>
<a href="reviewMylistview" >마이페이지</a>

<!-- 임시로 지정 -->
<!-- <a href="reviewListview">TEMP님</a> -->



<div class="review_table">


<!-- core태그 사용 -->
<c:forEach items="${review_list }" var="list">
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
						<p>${list.m_id }</p>
						<p>${list.r_title }</p>
						<p class="user_date">
							<span>★★★★★</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${list.m_id }</span>
						</p>
						<div class="product_option">
							<strong>구매옵션</strong>&nbsp;<span>색상</span>&nbsp;<span>사이즈</span>
						</div>
						<div class="user_content" onclick="user_content()"> <!-- commend -->
							<p class="u_content">${list.r_content }</p> 
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cell col2">
			<div>
				<%-- <span>${list.r_date }</span> --%>
				<span><fmt:formatDate value="${list.r_date }" pattern="yyyy.MM.dd"/></span>
			</div>
			<div class="img_box">
				<img src="../resources/img/NT7UN10J_NT7UN10J_primary.jpg" width="100" alt="그린 클리프 반팔 라운드티" />
			</div>
			<div >
				<!-- 수정/삭제 -->
				<a class="atag" href="#">수정</a>
				<a class="atag" href="reviewDelete?r_no=${list.r_no }">삭제</a>
			</div>
		</div>
	</div>
</c:forEach>

<!-- <a href="reviewWriteview">리뷰작성</a> -->
<button onclick="location.href='reviewWriteview'">리뷰작성</button>
>
</div>

</body>
</html>