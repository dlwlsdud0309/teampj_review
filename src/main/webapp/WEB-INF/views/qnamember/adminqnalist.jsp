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
		.btn1:hover {
		color: black;
		background-color: white;
		border-color: white;
		cursor: pointer;
}
</style>
</head>
<body style="text-align: center">
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
<h1>관리자문의게시판</h1>
현재로그인된아이디 확인용 : <%=session.getAttribute("loginid") %> <br />
<input class="btn1" type="button" value="관리자페이지로" onclick="location.href='../qnamember/adminpage'"/>
<table class="table table-hover" width="1000" border="1" style="margin-left:auto;margin-right:auto;">
	<tr>
		<td>문의번호</td>
		<td>문의제목</td>
		<td>문의내용확인용</td>
		<td>답변내용확인용</td>
		<td>문의한고객id</td>
		<td>답변유무</td>
		<td>문의날짜</td>
		<td>그룹확인용</td>
		<td>스텝확인용</td>
		<td>인덴트확인용</td>
	</tr>
<c:forEach items="${adminqnalist }" var="dto">  
	<tr>
		<td>${dto.q_mno }</td>
		<td><a href="qnadetail?q_mno=${dto.q_mno }">${dto.q_mtitle }</a></td> <!-- 문의제목 클릭하면 해당글의 고유번호값 MemberCotnroller / qnadetail()로 보내기 -->
		<td>${dto.q_mcontent }</td>
		<td>${dto.q_mreply }</td>
		<td>${dto.q_mid }</td>
		<td>${dto.q_mynn }</td>
		<td>${dto.q_mdate }</td>
		<td>${dto.q_mgroup }</td>
		<td>${dto.q_mstep }</td>
		<td>${dto.q_mindent }</td>
	</tr>
</c:forEach>	
</table>
totCnt : ${totRowcnt }
	<br /> 현재페이지/토탈페이지 : ${searchVo.page }/${searchVo.totPage }
	<br />
	<hr />
	<form action="adminqnalist" method="post">
<c:if test="${searchVo.page>1 }">
   <a href="adminqnalist?page=1&searchType=${searchtype }&sk=${resk}">[처음]</a>
   <a href="adminqnalist?page=${searchVo.page-1 }&searchType=${searchtype }&sk=${resk}">[이전]</a>   
</c:if>

<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
   <c:choose>
      <c:when test="${i eq searchVo.page }">
         <span style="color:red; font-weight:bold">${i }&nbsp;</span>
      </c:when>
      <c:otherwise>
         <a href="adminqnalist?page=${i }" style="text-decoration:none">${i }&nbsp;</a>
      </c:otherwise>
   </c:choose>
</c:forEach>
<c:if test="${searchVo.page < searchVo.totPage }">
   <a href="adminqnalist?page=${searchVo.page+1 }&searchType=${searchtype }&sk=${resk}">[다음]</a>   
   <a href="adminqnalist?page=${searchVo.totPage }&searchType=${searchtype }&sk=${resk}">[마지막]</a>
</c:if>
<div>
	<select name="searchType" value="${searchtype }">
			<option ></option>
			<option >아이디</option>
			<option >날짜</option>
			<option >아이디+날짜</option>
	</select>
	<input type="text" name="sk" value="${resk }" />
	<input class="btn1" type="submit" value="검색" />
</div>
</form>
</div>
</body>
</html>