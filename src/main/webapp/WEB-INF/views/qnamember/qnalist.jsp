<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	.btn1{
		color: white;
		background-color: black;
		border-color: black;
	}
	.btn2{
		color: white;
		background-color: black;
		border-color: black;
	}
	.btn1:hover {
		color: black;
		background-color: white;
		border-color: white;
		cursor: pointer;
}
	.btn2:hover {
		color: black;
		background-color: white;
		border-color: white;
		cursor: pointer;
}
</style>
<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>
<body style="text-align: center">
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
<main class="" id="main-collapse">

<script>
var loginid2 = <%=session.getAttribute("loginid")%>;
$(document).ready(function(){
	alert(loginid2)
	if(loginid2==null){
		alert("로그인이필요한서비스입니다")
		window.location.href="../member/loginform"
	}
})
</script>
<div class="container">
<h1>1:1문의</h1>
<%-- 현재로그인된아이디 확인용 : <%=session.getAttribute("loginid") %> <br />
문의내역 확인하고싶은 아이디 확인용 : <%=session.getAttribute("loginid") %> --%>
<input class="btn1" type="button" value="문의하기" onclick="location.href='../qnamember/qnawriteform'" />
<input class="btn2" type="button" value="마이페이지" onclick="location.href='../member/mypageform'" />
<table class="table table-hover" width="1000" border="1" style="margin-left:auto;margin-right:auto;">
	<tr>
		<!-- <td>문의번호</td> -->
		<td style="width: 60%">문의제목</td>
		<!-- <td>문의내용확인용</td>
		<td>답변내용확인용</td>
		<td>문의한고객id</td> -->
		<td style="width: 10%">답변유무</td>
		<td style="width: 30%">문의날짜</td>
	<!-- 	<td>그룹확인용</td>
		<td>스텝확인용</td>
		<td>인덴트확인용</td> -->
	</tr>
<c:forEach items="${qnalist }" var="dto">  
	<tr>
		<%-- <td style="width: 60%">${dto.q_mno }</td> --%>
		<td style="width: 60%">
			<c:set value="${dto.q_mindent }" var="endindent" />
			<c:forEach begin="1" end="${dto.q_mindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
					<img src="../resources/img/icon_reply.gif" />[re]
				</c:if>
			</c:forEach>
		<a href="qnadetail?q_mno=${dto.q_mno }">${dto.q_mtitle }</a>
		</td> <!-- 문의제목 클릭하면 해당글의 고유번호값 MemberCotnroller / qnadetail()로 보내기 -->
		<%-- <td>${dto.q_mcontent }</td> --%>
		<%-- <td>${dto.q_mreply }</td> --%>
		<%-- <td>${dto.q_mid }</td> --%>
		<td style="width: 10%">${dto.q_mynn }</td>
		<td style="width: 30%">${dto.q_mdate }</td>
		<%-- <td>${dto.q_mgroup }</td>
		<td>${dto.q_mstep }</td>
		<td>${dto.q_mindent }</td> --%>
	</tr>
</c:forEach>	
</table>
totCnt : ${totRowcnt }
	<br /> 현재페이지/토탈페이지 : ${searchVo.page }/${searchVo.totPage }
	<br />
	<hr />
<c:if test="${searchVo.page>1 }">
   <a href="qnalist?page=1">[처음]</a>
   <a href="qnalist?page=${searchVo.page-1 }">[이전]</a>   
</c:if>

<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
   <c:choose>
      <c:when test="${i eq searchVo.page }">
         <span style="color:red; font-weight:bold">${i }&nbsp;</span>
      </c:when>
      <c:otherwise>
         <a href="qnalist?page=${i }" style="text-decoration:none">${i }&nbsp;</a>
      </c:otherwise>
   </c:choose>
</c:forEach>
<c:if test="${searchVo.page < searchVo.totPage }">
   <a href="qnalist?page=${searchVo.page+1 }">[다음]</a>   
   <a href="qnalist?page=${searchVo.totPage }">[마지막]</a>
</c:if>
</div>
</main><!-- 사이드 -->
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>