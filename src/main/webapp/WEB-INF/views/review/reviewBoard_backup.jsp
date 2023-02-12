<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String loginid = (String)session.getAttribute("loginid"); %> <!-- 로그인된아이디 스트링으로가져오기 --> 
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
			
		/* member/loginfoem.jsp */
		function checkValue(){
			//inputForm = eval("document.logininfo");
			inputId = document.getElementById("m_id").value; //input id값
			inputPw = document.getElementById("m_pw").value; //input password값
			if(!inputId){ //id를 입력하지않으면
				alert("아이디입력없음");
				return false; //flase리턴, submit작동안함
			}
			if(!inputPw){ //pw를 입력하지않으면
				alert("비밀번호입력없음");
				return false; //flase리턴, submit작동안함
			}
		}
	
		
	});
	
	
	
</script>

<c:if test="${sessionScope.loginid eq null }">
	<script>
	function loginClick(){
		<%-- var loginid='<%=(String)session.getAttribute("loginid") %>'; --%>
		alert('로그인이 필요합니다.');
		history.go(0);
		
	}
	</script>
</c:if>

<!-- 로그인이 필요합니다 alert창 띄우기 ----- 구현됨 -->
<!-- 페이지 이동이 되지 않음, login창을 띄워야하나  ----- 구현진행중 -->
<%-- <c:if test="${sessionScope.loginid eq null }">

</c:if> --%>
<%-- <c:if test="${empty sessionScope.loginid }">
	<script>
	
	
	
	</script>
</c:if> --%>
</head>

<body>
<h3>Reviewboard</h3>
<!-- 오류 -->
<%-- <a href="reviewMylistview?account=${review_mylist.m_id }" >마이페이지</a> --%>
<c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   |  <a href="">join</a>

</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> <br />
	<a href="reviewMylistview?account=${sessionScope.loginid }">${sessionScope.loginid } 님</a>
</c:if>


<br />
로그인한 아이디 : <%=session.getAttribute("loginid") %>
<br />
<%String id=(String)session.getAttribute("loginid"); %>
<%=id %>

<br /> 

<a href="reviewMylistview" >마이페이지</a>


<!-- 리뷰작성 시 로그인이 안되어 있다면 ../member/login -->
<div id="styleID_ReviewBoard_loginform" class="styleClassReviewBoard_loginform">
	<form action="../member/login" method="post" name="logininfo" onsubmit="return checkValue()"> <!-- submit 실행 전에 먼저실행됨 -->
		아이디 : <input type="text" name="m_id" id="m_id" /> <br />
		비밀번호 : <input type="password" name="m_pw" id="m_pw" autocomplete="current-password"/> <br />
		<input type="submit" value="로그인" /> <!-- 입력한 id,pw를 MemberContorller/login()으로 보내기 -->
		<input type="button" value="회원가입" onclick="location.href='../member/joinform'" /> <br />
		<input type="button" value="메인화면" onclick="location.href='../member/main'" />
	</form>
</div>

	
<div class="review_table">
		<div class="selectandsearch_box">
			<div class="select_box">
				<h3>리뷰</h3>
			</div>
			<div>
				<a id="atag_reviewwrite" href="reviewWriteview" onclick="loginClick();">리뷰작성</a>
			</div>
			<br />
			<div class="avg_star">
				<div class="tablerow">
					<div class="tablecell">
					<span class="user_date">
						<span class="star">
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
							<input id="userid" type="hidden" value="${list.memberDto.m_id }" />
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
				<a class="atag" id="practice" href="reviewPopupcontentview?r_no=${list.r_no }">수정</a>
				<a class="atag" href="reviewDelete?r_no=${list.r_no }">삭제</a>

</c:if>
				
				<!-- function 사용한 답글창 열기 -->
				<%-- <a class="atag" href="reviewPopupReplycontentview?r_no=${list.r_no }">답글</a> --%>
<c:if test="${sessionScope.loginid eq 'admintest' }">
				<a class="atag" href="reviewDelete?r_no=${list.r_no }">삭제</a>
				<a class="atag" id="atag_reply" href="#">답글</a>
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