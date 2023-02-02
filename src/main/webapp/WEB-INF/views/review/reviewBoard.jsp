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
	
	
	/* CSS는 나중에 하자... */
	/* $(document).ready(function(){ /* 써야함 */
		$("button").click(function(){
			$("a").show();
			/* alert("아오"); */
		});
	}); */
	
	
	
	/* 리뷰작성하기 눌렀을 때 뜨는 팝업창 */
	/* $(document).ready(function(){
		$("button").bPopup();
	}); */
	/* function reviewWriteview() {
		window.open("reviewWriteview"); //새창이 열림
	}; */
	
	/* $(document).ready(function(){
		$("button").click({
			onOpen: function reviewWriteview() {
				alert('onOpen fired'); 
				}
		});
	}); */
	
	 // Semicolon (;) to ensure closing of earlier scripting
    // Encapsulation
    // $ is assigned to jQuery
    /* ;(function($) {
         // DOM Ready
        $(function() {
            // Binding a click event
            // From jQuery v.1.7.0 use .on() instead of .bind()
            $('#write').bind('click', function(e) {
                // Prevents the default action to be triggered. 
                e.preventDefault();
                // Triggering bPopup when click event is fired
                $('#element_to_pop_up').bPopup({
                	location.href="reviewWriteview";
                });
            });
        });
    })(jQuery); */
	
    
		
</script>
</head>

<body>
<h3>Reviewboard</h3>

<div class="review_table">

<!-- Button that triggers the popup
            <button id="write">리뷰작성</button>
            Element to pop up
            <div id="element_to_pop_up">Content of popup</div> -->

<!-- <input type="button" value="리뷰작성" onclick="goPopup();" />
<div id="popup" class="Pstyle">
asdasd
</div> -->

<button>왜..</button>

<!-- core태그 사용 -->
<c:forEach items="${review_list }" var="list">
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
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
				<a class="atag" href="#">수정</a>
				<a class="atag" href="#">삭제</a>
			</div>
		</div>
	</div>
</c:forEach>

<!-- <a href="reviewWriteview">리뷰작성</a> -->
<button onclick="location.href='reviewWriteview'">리뷰작성</button>
<!-- <button id="popup" onclick="javascript:openPopup('reviewWriteview')">리뷰작성</button> -->
<!-- <button onclick="reviewWriteview();">리뷰작성</button> -->
<!-- <input type="button" value="리뷰작성" onclick="reviewWriteview()" /> -->
</div>
<script>
	/* 리뷰작성하기 눌렀을 때 뜨는 팝업창 */
	/* $(document).ready(function(){
		$('.practice').bPopup();
	}); */
	/* function goPopup(){
    	$("#popup").bPopup();
    } */

</script>
</body>
</html>