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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">

<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<link rel="stylesheet" href="../resources/css/footer.css" />
<script src="../resources/js/jquery-3.6.1.min.js"></script>
<script src="../resources/js/jquery.bpopup.min.js"></script>
<script src="../resources/js/scriptjsp.js"></script>
<script>
	
	/* r_content의 내용이 미리보기를 초과할 때 말줄임표로 줄이기 */
	$(document).ready(function() {
		$(".u_content").click(function() {
			$(this).toggleClass("u_content").toggleClass("u_contentGray");
		});
	});

	/* 별점 */
	function redeptlist(target) {
		$('#starInput[name=r_score]').attr('value', target.value);
	}
	function getvalue(target) {
		alert(target.value);
	}

	/* 리뷰작성 로그인 확인 */
	function fn_01(checked_id) {
		if (fn_02(checked_id) == false) {
			alert('로그인이 필요합니다.');
			$(location).attr('href', '../member/loginform');
		} else {
			$(location).attr('href', '../review/reviewMylistview')
		}
	}
	function fn_02(checked_id) {
		if (checked_id == '' || checked_id == null) {
			return false;
		} else {
			return true;
		}
	}

	/* admin-답글 */
	$(document).ready(function() {
		$('#reply_menu > div > a').off().on("click", function() {
			$(this).next($('.snd_menu')).slideToggle();
		});
	});

	/* 버튼을 누르면 해당 위치로 스크롤 이동 */
	$(document).ready(function() {
		$('#productinfoBtn').click(function() {
			var offset = $("#p_info").offset();
			$('html, body').animate({
				scrollTop : offset.top
			}, 400);
		});

		$('#reviewsizeBtn').click(function() {
			var offset = $("#reviewSize").offset();
			$('html, body').animate({
				scrollTop : offset.top
			}, 400);
		});

		$('#reviewBtn').click(function() {
			var offset = $("#reviewtitle_writebutton").offset();
			$('html, body').animate({
				scrollTop : offset.top
			}, 400);
		});

	});
</script>
</head>

<body>
<%-- <a href="../member/main">메인</a> <br />
<!-- 로그아웃 상태 -->
<c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   <a href="">join</a>
</c:if>
<!-- 로그인 상태 -->
<c:if test="${not empty sessionScope.loginid }">
   <a href="../member/logout">logout</a> 
   <!-- 로그인한 id가 admintest일 경우 관리자페이지로 접근 -->
   <c:choose>
      <c:when test="${sessionScope.loginid eq 'admintest' }">
         <a href="../review/reviewAdminpage">${sessionScope.loginid }님</a>
      </c:when>
      <c:otherwise>
         <a href="../review/reviewMylistview">${sessionScope.loginid }님</a>
      </c:otherwise>
   </c:choose>
<br />
</c:if> --%>


<!-- <a href="../review/reviewChart">별점순 top5</a> -->

<br />
<br /> 
<br />


<!--@@@ 평균별점(avgStarscore), 총 게시글 수(totalCount ) @@@-->
<div class="review_table">
		<div class="pinfo_review">
			<a href="#" id="productinfoBtn" style="font-size: 1.5em; font-weight: bolder;" onclick="return false;">상품설명</a>
			<a href="#" id="reviewsizeBtn" style="font-size: 1.5em; font-weight: bolder;" onclick="return false;">사이즈 정보</a>
			<a href="#" id="reviewBtn" style="font-size: 1.5em; font-weight: bolder;" onclick="return false;">리뷰</a>
		</div>
		<div class="p_info" id="p_info">
			<span style="font-size: 1.5em; font-weight: bolder;">상품설명</span> <br />
			<hr />
			<div class="p_info_div">
				<c:forEach items="${productinfo }" var="info">
					${info.p_info }
				</c:forEach>
			</div>
		</div>
		<div id="reviewSize">
			<span style="font-size: 1.5em; font-weight: bolder;">사이즈 정보</span> <br />
			<hr />
			<img src="../resources/img/NT7UP19A_NT7UP19A_size00_P.jpg" />
		</div>
		<div id="reviewtitle_writebutton">
			<span style="font-size: 1.5em; font-weight: bolder;">리뷰</span>
	   		<span><input style="float: right;" type="button" value="리뷰작성" onclick="fn_01('${sessionScope.loginid }');" /></span>
  		</div>
  		<hr />
   <div class="avgstar_totalcount">
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
               <b>&nbsp;&nbsp;&nbsp; ${avgStarscore } 총점</b>
            </div>
         </div>
         <div><b>${totalCount }개의 REVIEWS</b></div>
      </div>
   <br />
   <br />
   <br />
   </div>
<hr />   
</div>
<div class="clear" ></div>

<div class="review_table">
      <!--@@@ select, option, 검색 @@@-->
      <form action="../review/reviewBoard" method="get">
      
         <!--@@@ scope application으로 가져온 pname, pfilesrc 사용 @@@-->
         <input type="hidden" name="pname" value="${pname }" />
         <input type="hidden" name="pfilesrc" value="${pfilesrc }" />
         <div class="selectType_searchbox" style="text-align: right;">
            <span class="div_selectType">
            <!-- 검색기능 추가 -->
               <select name="selectType" >
                  <option ${param.selectType=="r_recently"?"selected":"" } value="r_group">최신순</option>
                  <option ${param.selectType=="r_score"?"selected":"" } value="r_score">별점순</option>
               </select>
            </span><!-- 검색기능 추가 -->
            <!-- 키워드 검색 -->
            <span class="div_searchbox">
               <span>
                  <input type="text" name="searchKeyword" placeholder="리뷰 키워드 검색" size="30" value="${resk }"/>
                  <input type="submit" value="검색" />
               </span>
            </span><!-- 키워드 검색 -->
         </div>
      </form><!-- select, option, 검색 -->
      
      
      <div id="contents">
         <div id="js-load" class="main">
            <!--@@@ avgStarscore가 0일 때 @@@-->
            <c:if test="${avgStarscore<1 }">
               <div style="text-align: center;">
                  <br />
                  <br />
						<div class="htag">
							<h4 style="font-weight: bold; color: #C0C0C0">리뷰가 없습니다.</h4>
							<h3 style="font-weight: bolder; color: #696969">리뷰를 작성해보세요!</h3>
							<br />
						</div>
					<br />
                  <br />
               </div>
            </c:if>
            
            <!--@@@ avgStarscore가 0이 아닐 때 @@@-->
            <ul class="lists">
               <c:forEach items="${review_list }" var="list">
                  <li class="lists__item js-load">
                     <div class="row">
                        <div class="cell col1">
                           <div class="review_total">
                              <div class="review_box">
                                 <div class="review_label">
                                 
                                    <!--@@@ 리뷰제목 @@@-->
                                    <div><strong>${list.r_title }</strong></div>
                                    
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
                                          <span>&nbsp;&nbsp;&nbsp;&nbsp;
                                             <c:out value="${fn:substring(list.memberDto.m_id,0,fn:length(list.memberDto.m_id)-2)}" />**
                                          </span>
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
                                    <div id="reply_menu">
                                       <div>
                                          <a class="${list.r_no }" href="#" onclick="return false;">
                                             댓글
                                             <!--@@@ r_ynn이 y이면 1 @@@-->
                                             <c:choose>
                                                <c:when test="${list.r_ynn eq 'y' }">1</c:when>
                                                <c:otherwise>0</c:otherwise>               
                                             </c:choose>
                                          </a>
                                          
                                          <!--@@@ 답글 제목, 내용 @@@-->
                                          <div class="snd_menu sub_menu">
                                             <div><strong>${list.r_retitle }</strong></div>
                                             <div>${list.r_recontent }</div>
                                          </div>
                                          
                                       </div>
                                    </div>
                                    
                  <c:if test="${sessionScope.loginid eq 'admintest' }">
                     
                     <!--@@@ r_ynn이 y이면 수정하기, n이면 답글 달기 @@@-->
                     <c:choose>
                        <c:when test="${list.r_ynn eq 'y' }">
                           <div id="reply_menu">
                               <div><a class="${list.r_no }" href="#" onclick="return false;">수정하기</a>
                                 <div class="snd_menu sub_menu">
                                 
                                    <!--@@@ 답글수정 form @@@@-->
                                    <form action="../review/reviewReply">
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
                                      
                                    <form action="../review/reviewReply">
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
                     
                     <!--@@@ 댓글삭제 @@@-->
                     <div id="reply_menu">
                        <div><a href="../review/reviewReplydelete?r_no=${list.r_no }">댓글삭제</a></div>
                     </div>
                  </c:if>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                        <div class="cell col2">
                           <div>
                              <span><fmt:formatDate value="${list.r_date }" pattern="yyyy.MM.dd"/></span>
                           </div>
                           <div class="img_box">
                              <c:if test="${list.r_filesrc ne null }">
                                 <div>
                                    <img src="../resources/reviewupload/${list.r_filesrc }" width="100" alt="" />
                                 </div>
                              </c:if>
                           </div>
                           <div>
                           
                              <!--@@@ 로그인한 아이디가 리뷰를 작성한 id와 일치하면 @@@-->
                              <c:if test="${sessionScope.loginid eq list.memberDto.m_id }">
                                          
                                          <!--@@@ 수정하기 @@@-->
                                          <script>
                                           	var openWidth=400;
                                      		var openheight=1000;
                                      		
                                      		var openWidthX=(window.screen.width/2)-(openWidth/2);
                                      		var openheightY=(window.screen.height/2)-(openheight/2);
                                          </script>
                                          <button onclick="window.open('../review/reviewModifyview?r_no=${list.r_no }','modifyview','width='+openWidth+',height='+openheight+',location=no,fullscreen=no,menubar=no,toolbar=no,status=no,scrollbars=no,left='+openWidthX+',top='+openheightY);">수정</button>
                                          
                                          <!--@@@ 답글이 달리지 않았다면(r_ynn이 n이라면) 삭제 가능 @@@-->
                                          <c:choose>
                                             <c:when test="${list.r_ynn eq 'n' }">
                                                <button type="button" onclick="location.href='../review/reviewDelete?r_no=${list.r_no }'">삭제</button>
                                             </c:when>
                                          </c:choose>
                              </c:if>
                              
                              <!--@@@ 관리자 계정이면 댓글이 삭제 가능하도록 구현 @@@-->
                              <c:if test="${sessionScope.loginid eq 'admintest' }">
                                          <a href="../review/reviewDelete?r_no=${list.r_no }">삭제</a>
                              </c:if>
                              
                           </div>
                        </div>
                     </div><!-- /row -->
                  </li>
               </c:forEach>
            </ul>
            
         <!--@@@ 더보기 @@@-->   
         <div id="js-btn-wrap" class="btn-wrap">
            <a href="javascript:;" class="button">리뷰 더보기 &nbsp;<img src="../resources/img/more_icon.png" /></a>
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
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />

<!--@@@ 더보기 script @@@-->
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