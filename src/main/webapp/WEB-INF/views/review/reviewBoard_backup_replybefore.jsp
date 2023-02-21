<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
		});
	});
	
	/* 별점 */		
	function redeptlist(target) {
		alert("target : "+target.value);
		$('#starInput[name=r_score]').attr('value',target.value);	
	}
	
	function getvalue(target) {
		alert(target.value);
	} 

	/* 리뷰작성 로그인 확인 */
	function fn_01(checked_id){
		if(fn_02(checked_id)==false){
			alert('로그인이 필요합니다.');
			$(location).attr('href','../member/loginform');
		}else{
			$(location).attr('href','reviewMylistview')
			/* $(".styleClassReviewWriteview").bPopup(); */
		}
	}
	function fn_02(checked_id){
		if(checked_id=='' || checked_id==null){
			return false;
		}else{
			return true;
		}
	}
	
	/* admin-답글 */
	$(document).ready(function(){
		  $('#reply_menu > div > a').off().on("click",function(){
		    $(this).next($('.snd_menu')).slideToggle();
		  });
		});
	
</script>
</head>

<body>
<h3>Reviewboard</h3>
<a href="../member/main">메인</a> <br />
<c:if test="${empty sessionScope.loginid }">
	<a href="../member/loginform">login</a> 
	<a href="">join</a>
</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> 
	<a href="reviewMylistview">${sessionScope.loginid }님</a>
<br />
</c:if>

<br />
<%-- 로그인한 아이디 : <%=session.getAttribute("loginid") %>
<br />
<%String id=(String)session.getAttribute("loginid"); %>
<%=id %> --%>
<!-- <a href="reviewMylistview" >마이페이지</a> -->
<%-- 상품명 : <%=pname %>
상품이미지 : <%=pfilesrc %>
<br />
<%String pname2=(String)session.getAttribute("pname"); %>
상품명2 : <%=pname2 %>
<br />
<c:forEach items="${productDetail_data }" var="p">
</c:forEach>
p : <c:out value="${p }"/>
<%String pnameGetReviewBoard=request.getParameter("pname"); %>
pnameGetReviewBoard : <%=pnameGetReviewBoard %> --%>


<%-- <%String pname=request.getParameter("pname"); %>
<%=pname %> --%>
<%-- <%pageContext.getAttribute("name","${param.pname }"); %>
<%=asd %> --%>
<%-- a: <c:out value="${param.pname }" />
<%String hell=request.getParameter("hell"); %>
<%=hell %> --%>
<%-- <c:out value="name" />
<c:set var="name" value="${applicationScope.pm.p_name}" scope="session"></c:set> --%>
<%-- <c:out value="${param.pname }"></c:out>

<input type="hidden" name="pname" value="${plist.p_name }" /> --%>

PRODUCT <br />
pname : ${pname } <br />
pfilesrc : ${pfilesrc } <br />
<br />

<%-- <c:choose>
	<c:when test="${not empty avgStarscore}">
		<fmt:formatNumber value="${avgStarscore }" pattern=".0" />
	</c:when>
	<c:otherwise>
		<c:set var="avgStarscore" value="0" />
	</c:otherwise>
</c:choose> --%>


<%-- <c:if test="${avgStarscore == 'NaN' }">
	<fmt:formatNumber value="${avgStarscore }" type="number"/>
	${avgStarscore }
</c:if> --%>

<%-- <c:forEach items="${getproductlist }" var="getData">
	${getData.p_name }
</c:forEach>
<br /> --%>

<%-- <c:choose>
	<c:when test="${avgStarscore !NaN }">
		<fmt:formatNumber value="${avgStarscore }" pattern=".0" />
	</c:when>
	<c:otherwise>
		<strong>0</strong>
	</c:otherwise>
</c:choose> --%>
<%-- <c:when test="${avgStarscore !=NaN }">
	<fmt:formatNumber value="${avgStarscore }" pattern=".0" />
</c:when> --%>
<%-- <c:otherwise>
	<c:set var="avgStarscore" value="0" />
	<c:out value="${avgStarscore }" />
</c:otherwise> --%>





<style>
  .js-load {
    display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 100%;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}
.lists__item {
    padding: 20px;
    /* background: #EEE; */
}
.lists__item:nth-child(2n) {
    /* background: #59b1eb;
    color: #fff; */
}
.btn-wrap {
    text-align: center;
}
  </style>

<div class="review_table">
		<div class="selectandsearch_box">
			<div class="select_box">
				<h3>리뷰</h3>
			</div>
			<div>
				<input type="button" value="리뷰작성" onclick="fn_01('${sessionScope.loginid }');" />
<br />
<br />
			<div class="avg_star">
				<div class="tablerow">
					<div class="tablecell">
						<span class="user_date">
							<span class="reviewBoard_star">
								★★★★★
								<span id="star2" style="width:${avgStarscore*20}%">★★★★★</span>
							</span>
						</span>
					</div>
					<div class="tablerow">
						<b>&nbsp;&nbsp;&nbsp;&nbsp;
							${avgStarscore } 총점
						</b>
					</div>
				</div>
				<div>
					<b>${totalCount }개의 REVIEWS</b>
				</div>
			</div>
			
			<br />
		</div>
	</div>
	
<hr />	
</div>
<div class="clear" ></div>
<div class="review_table">
		<!-- select, option, 검색 -->
		<form action="reviewBoard" method="get">
			<input type="hidden" name="pname" value="${pname }" />
			<input type="hidden" name="pfilesrc" value="${pfilesrc }" />
			<div class="selectType_searchbox" style="text-align: right;">
				<span class="div_selectType">
				<!-- 검색기능 추가 -->
					<select name="selectType" >
						<option ${param.selectType=="r_recently"?"selected":"" } value="r_group">최신순</option>
						<option ${param.selectType=="r_score"?"selected":"" } value="r_score">별점순</option>
					</select>
				</span>
				
				<!-- 키워드 검색 -->
				<span class="div_searchbox">
					<span>
						<input type="text" name="searchKeyword" placeholder="리뷰 키워드 검색" size="30" value="${resk }"/>
						<input type="submit" value="검색" />
					</span>
				</span>
			</div>
		</form>

<div id="contents">
	<div id="js-load" class="main">
	
							<!-- avgStarscore가 0일 때 -->
							<c:if test="${avgStarscore<1 }">
								<div style="text-align: center;">
									<br />
									<br />
									<h4 style="font-weight: bold; color: #C0C0C0">리뷰가 없습니다.</h4>
									<h3 style="font-weight: bolder; color: #696969">리뷰를 작성해보세요!</h3> <br />
									<br />
									<br />
								</div>
							</c:if>
			
		<!-- avgStarscore가 0이 아닐 때 -->
		<ul class="lists">
<c:forEach items="${review_list }" var="list">
			<li class="lists__item js-load">
			
	<div class="row">
		<div class="cell col1">
			<div class="review_total">
				<div class="review_box">
					<div class="review_label">
						<input type="hidden" value="${list.r_no }" />
						<%-- <span>${list.r_no }</span> --%>
						<p>
							${list.memberDto.m_id }
						</p>
						<%-- <p>${list.productDto.p_name }</p> --%>
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
							<strong>구매옵션</strong>&nbsp;<span>${list.productDto.p_color }</span>&nbsp;<span>${list.productDto.p_size }</span>
						</div>
						<div class="user_content" onclick="user_content()">
							<p class="u_content">${list.r_content }</p> 
						</div>
<style> /* css로 옮기면 적용되지 않음 */
	ul { padding: 0; }
	li {
	  list-style: none;
	  line-height: 34px;
	}
	.sub_menu { display: none; }
</style>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 답변창 만들기 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<div id="reply_menu">
							<div>
								<a class="${list.r_no }" href="#" onclick="return false;">
									댓글
									<c:choose>
										<c:when test="${list.r_ynn eq 'y' }">
											1
										</c:when>
										<c:otherwise>
											0
										</c:otherwise>					
									</c:choose>
								</a>
								<div class="snd_menu sub_menu">
									<div><strong>${list.r_retitle }</strong></div>
									<div>${list.r_recontent }</div>
								</div>
							</div>
						</div>
<c:if test="${sessionScope.loginid eq 'admintest' }">
	<c:choose>
		<c:when test="${list.r_ynn eq 'y' }">
			<div id="reply_menu">
	          <div><a class="${list.r_no }" href="#" onclick="return false;">수정하기</a>
	            <div class="snd_menu sub_menu">
	            	<form action="reviewReply">
	            		<input type="hidden" name="r_no" value="${list.r_no }" />
	            		<div><input type="hidden" name="r_id" value="${sessionScope.loginid }" />관리자</div>
	            		<div><input type="text" name="r_retitle" size="25" value="${list.r_retitle }" /></div>
		            	<div><textarea name="r_recontent" cols="100%" rows="3" placeholder="댓글을 입력하세요">${list.r_recontent }</textarea></div>
		            	<input type="submit" value="수정" />
	            	</form>
	            </div>
	          </div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="reply_menu">
	          <div><a class="${list.r_no }" href="#" onclick="return false;">댓글달기</a>
	            <div class="snd_menu sub_menu">
	            	<form action="reviewReply">
	            		<input type="hidden" name="r_no" value="${list.r_no }" />
	            		<div><input type="hidden" name="r_id" value="${sessionScope.loginid }" />관리자</div>
	            		<div><input type="text" name="r_retitle" size="25" value="믹키 스포츠웨어 온라인 스토어" /></div>
		            	<div><textarea name="r_recontent" cols="100%" rows="3" placeholder="댓글을 입력하세요"></textarea></div>
		            	<input type="submit" value="답글" />
	            	</form>
	            </div>
	          </div>
			</div>
		</c:otherwise>					
	</c:choose>
	
	<%-- <c:choose>
		<c:when test="${list.r_ynn eq 'y' }">
			<div id="reply_menu">
	          <div><a class="${list.r_no }" href="#" onclick="return false;">수정하기</a>
	            <div class="snd_menu sub_menu">
	            	<form action="reviewReply">
	            		<input type="hidden" name="r_no" value="${list.r_no }" />
	            		<div><input type="hidden" name="r_id" value="${sessionScope.loginid }" />관리자</div>
	            		<div><input type="text" name="r_retitle" size="25" value="${list.r_retitle }" /></div>
		            	<div><textarea name="r_recontent" cols="100%" rows="3" placeholder="댓글을 입력하세요">${list.r_recontent }</textarea></div>
		            	<input type="submit" value="수정" />
	            	</form>
	            </div>
	          </div>
			</div>
		</c:when>
		<c:otherwise>
		
		<script>
			function submit_reviewReply(reviewReply){
				reviewReply.action="reviewReply";
				reviewReply.submit();
			}
		</script>
		
		
			<div id="reply_menu">
	          <div><a class="${list.r_no }" href="#" onclick="return false;">댓글달기</a>
	            <div class="snd_menu sub_menu">
	            	<form action="reviewReply">
	            		<input type="hidden" name="r_no" value="${list.r_no }" />
	            		<div><input type="hidden" name="r_id" value="${sessionScope.loginid }" />관리자</div>
	            		<div><input type="text" name="r_retitle" size="25" value="믹키 스포츠웨어 온라인 스토어" /></div>
		            	<div><textarea name="r_recontent" cols="100%" rows="3" placeholder="댓글을 입력하세요">${list.r_recontent }</textarea></div>
		            	<input type="submit" value="답글" />
		            	<input type="button" value="답글수정" onclick="return submit_reviewReply(this.form);"/>
	            	</form>
	            </div>
	          </div>
			</div>
		</c:otherwise>					
	</c:choose> --%>
	
	
	
	<div id="reply_menu">
		<div><a href="reviewReplydelete?r_no=${list.r_no }">댓글삭제</a></div>
	</div>
</c:if>
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
				<!-- 답글이 달리면 삭제할 수 없도록 '삭제'버튼을 제거 -->
				<c:choose>
					<c:when test="${list.r_ynn eq 'n' }">
						<a href="reviewDelete?r_no=${list.r_no }">삭제</a>
					</c:when>
				</c:choose>
</c:if>
<c:if test="${sessionScope.loginid eq 'admintest' }">
				<a href="reviewDelete?r_no=${list.r_no }">삭제</a>
</c:if>
			</div>
		</div>
	</div>
			</li>
</c:forEach>
		</ul>
	<div id="js-btn-wrap" class="btn-wrap">
		<a href="javascript:;" class="button">더보기</a>
	</div>
</div>
</div>
<br />
	</div>
<br />
<br />
<br />
<br />

</body>
<!-- 더보기 -->
<script>
$(window).on('load', function () {
    load('#js-load', '10');
    $("#js-btn-wrap .button").on("click", function () {
        load('#js-load', '10', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var girls_list = id + " .js-load:not(.active)";
    var girls_length = $(girls_list).length;
    var girls_total_cnt;
    if (cnt < girls_length) {
        girls_total_cnt = cnt;
    } else {
        girls_total_cnt = girls_length;
        $('.button').hide()
    }
    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
}
</script>
</html>