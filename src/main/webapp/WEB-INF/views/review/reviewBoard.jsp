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
						<p>${list.memberDto.m_id }</p>
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
				<%-- <img src="../resources/reviewupload/${list.r_filesrc }" width="100" alt="그린 클리프 반팔 라운드티" /> --%>
				<img src="../resources/reviewupload/${list.r_filesrc }" width="100" alt="" />
			</div>
			<div >
				<!-- 수정/삭제 -->
				<a class="atag" href="reviewPopupcontentview?r_no=${list.r_no }">수정</a>
				<a class="atag" href="reviewDelete?r_no=${list.r_no }">삭제</a>
				<a class="atag" href="replyview?r_no=${list.r_no }">답글</a>
			</div>
		</div>
	</div>
</c:forEach>
<!-- <a href="reviewWriteview">리뷰작성</a> -->
<button type="button" onclick="location.href='reviewWriteview'">리뷰작성</button>
<br />

<!-- 페이징 처리 -->
총 게시글 : ${totRowcnt }건 <br />
현재페이지/전체페이지 : ${searchVO.page }/${searchVO.totPage } <br />
<hr />
<form action="reviewBoard" method="post">
	<div class="paging">
		<c:if test="${searchVO.page>1 }">
			<a href="reviewBoard?page=1">&lt;&lt;</a>
			<a href="reviewBoard?page=${searchVO.page-1 }">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</a>
		</c:if>
		<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVO.page }">
					<span style="color:red; font-weight: bold">${i }&nbsp;&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="reviewBoard?page=${i }" style="text-decoration: none">${i }&nbsp;&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${searchVO.page<searchVO.totPage }">
			<a href="reviewBoard?page=${searchVO.page+1 }">></a>
			<a href="reviewBoard?page=${searchVO.totPage }">&nbsp;&nbsp;&nbsp;&nbsp;>></a>
		</c:if>
	</div>
	
	<!-- 검색기능 추가 -->
	<div class="search">
		<!-- 추천순, 최신순, 별점순 -->
		<!-- 별점순 -->
		<!-- <input type="checkbox" name="searchType" value="r_score" /> -->
		<select name="selectType">
			<option value="r_score">별점순</option>
		</select>
		<input type="text" name="searchKeyword" placeholder="리뷰 키워드 검색"/>
		<input type="submit" value="검색" />
	</div>	
</form>
	</div>



</body>
</html>