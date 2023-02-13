<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(document).ready(function(){
		$(".u_content").click(function(){
			/* $(this).addClass("u_content"); */
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
			
		});
		
		$('.atag_reviewwrite').click(function(){
			var userid='<%=(String)session.getAttribute("loginid")%>';
			if(userid=='null'){
				alert("로그인이 필요합니다.");
				return false;
			}
		
		<%-- $(".atag_reviewwrite").click(function(){
			var userid='<%=(String)session.getAttribute("loginid")%>';
			if(userid=='null'){
				alert("로그인이 필요합니다.");
				return false;
			}
		}); --%>
		/* 답글버튼 눌렀을 때 작동하도록 */
		/* $(".atag_reply").click(function () {
			alert("하이")
			$(this).hide(".reply_box");
		}) */
	});
		
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
<h3>Reviewboard</h3>
<c:if test="${empty sessionScope.loginid }">
	<a href="../member/loginform">login</a> 
	<a href="">join</a>
	<script>
		function 
	</script>
</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> 
	<a href="reviewMylistview?account=${sessionScope.loginid }">${sessionScope.loginid } 님</a>
	
<br />
</c:if>

<br />
<%-- 로그인한 아이디 : <%=session.getAttribute("loginid") %>
<br />
<%String id=(String)session.getAttribute("loginid"); %>
<%=id %> --%>
<!-- <a href="reviewMylistview" >마이페이지</a> -->
<br /> 

	
<div class="review_table">
		<div class="selectandsearch_box">
			<div class="select_box">
				<h3>리뷰</h3>
			</div>
			<div>
				<!-- <a class="atag_reviewwrite" href="reviewWriteview">리뷰작성</a> -->
				<!-- a태그가 아니라 form이 필요해보임 -->
				<script>
					function fn_01(vn_name){
						//alert('로그인이 필요합니다.');
						if(fn_02(vn_name)==false){
							alert('로그인이 필요합니다.');
							//location.href('https://www.naver.com');
							$(location).attr('href','../member/loginform');
						}else{
							alert('로그인 성공');
						}
					}
					function fn_02(vn_name){
						if(vn_name=='' || vn_name==null){
							return false;
						}else{
							return true;
						}
					}
				</script>
				
				
				<div class="clear"></div>
				<!-- <input type="button" value="리뷰작성" onclick="rWrite();" /> -->
				<input type="button" value="리뷰작성" onclick="fn_01('${sessionScope.loginid }');" />
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
					</td>
				</tr>
				<!-- <tr>
					reviewdao.xml에서 'TEMP'로 사용 중
				
					작성자는 session으로 받아올 것, 이후 작성자란은 삭제
					<td class="left">작성자</td>
					<td><input type="text" name="m_id" /></td>
				</tr> -->
				<tr>
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
<script>
	function rWrite(){
		$(".styleClassReviewWriteview").bPopup();
	}
</script>
				<div class="clear"></div>
				
				
				
				
				
				
			</div>
			<br />
			<div class="avg_star">
				<div class="tablerow">
					<div class="tablecell">
						<span class="user_date">
							<span class="reviewBoard_star">
								★★★★★
								<span id="star2" style="width:${avgScore*20}%">★★★★★</span>
							</span>
						</span>
					</div>
					<div class="tablerow">
						<b>&nbsp;&nbsp;&nbsp;&nbsp;총점</b>
					</div>
				</div>
				<div>
					<b>${totRowcnt }개의 REVIEWS</b>
				</div>
			</div>
			<br />
		</div>
	
	<hr />	
</div>
<div class="clear" ></div>
<div class="review_table">
		<form action="reviewBoard" method="post">
	<div class="row">
		<div class="cell col1">
		<!-- 검색기능 추가 -->
			<select name="selectType" >
				<option ${param.selectType=="r_recently"?"selected":"" } value="r_recently">최신순</option>
				<option ${param.selectType=="r_score"?"selected":"" } value="r_score">별점순</option>
			</select>
		</div>
		<div class="cell col2">
			<div class="search_box">
				<input type="text" name="searchKeyword" placeholder="리뷰 키워드 검색" size="10" value="${resk }"/>
				<input type="submit" value="검색" />
			</div>
		</div>
	</div>
		</form>
		
<c:set var="totalStar" value="0" />
<c:set var="avgStar" value="0" />
<c:forEach items="${review_list }" var="list">
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
						<p>
							${list.memberDto.m_id }
						</p>
						<p>${list.r_title }</p>
						<div class="tablerow">
							<div class="tablecell">
							<span class="user_date">
								<span class="star">
									★★★★★
									<span id="star2" style="width:${list.r_score*20}%">★★★★★</span>
									<c:set var="totalStar" value="${totalStar+list.r_score }"/>
								</span>
							</span>
							</div>
							<div class="tablerow">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;${list.memberDto.m_id }</span>
							</div>
						</div>
						
						<div class="product_option">
							<strong>구매옵션</strong>&nbsp;<span>색상</span>&nbsp;<span>사이즈</span>
						</div>
						<div class="user_content" onclick="user_content()"> <!-- commend -->
							<p class="u_content">${list.r_content }</p> 
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 답변창 만들기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div class="reply_box">
							왜 안되는거야
						</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						
						
					</div>
				</div>
			</div>
		</div>
		<div class="cell col2">
			<div>
				<span>
					<fmt:formatDate value="${list.r_date }" pattern="yyyy.MM.dd"/>
				</span>
			</div>
			<div class="img_box">
				<img src="../resources/reviewupload/${list.r_filesrc }" width="100" alt="" />
			</div>
			<div>
				<!-- 수정/삭제 -->
<c:if test="${sessionScope.loginid eq list.memberDto.m_id }">
				<a id="practice" href="reviewPopupcontentview?r_no=${list.r_no }">수정</a>
				<a href="reviewDelete?r_no=${list.r_no }">삭제</a>

</c:if>
				
				<!-- function 사용한 답글창 열기 -->
				<%-- <a class="atag" href="reviewPopupReplycontentview?r_no=${list.r_no }">답글</a> --%>
<c:if test="${sessionScope.loginid eq 'admintest' }">
				<a href="reviewDelete?r_no=${list.r_no }">삭제</a>
				<a id="atag_reply" href="#">답글</a>
</c:if>
			</div>
		</div>
	</div>
	
</c:forEach>
totalStar : <c:out value="${totalStar }"/>
avgStar : <c:out value="${avgStar+(totalStar/list_r_score.length) }"/>
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
					<span style="color:red; font-weight: bold;">${i }&nbsp;&nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="reviewBoard?page=${i }&rb_recently=${r_recently}&rb_score=${r_score}&searchKeyword=${resk}" style="text-decoration: none">${i }&nbsp;&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${searchVO.page<searchVO.totPage }">
			<a href="reviewBoard?page=${searchVO.page+1 }">></a>
			<a href="reviewBoard?page=${searchVO.totPage }">&nbsp;&nbsp;&nbsp;&nbsp;>></a>
		</c:if>
	</div>
</form>
	</div>
<br />
<br />
<br />
<br />
</body>
</html>