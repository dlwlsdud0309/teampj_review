<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" href="../resources/css/admin_header.css" />
<!-- 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- 반응형 setting -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<!-- header section -->
</head>
<body style="text-align: center">
<div class="container">
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
<h1>회원목록</h1>
<input class="btn1" type="button" value="관리자페이지로" onclick="location.href='../qnamember/adminpage'"/>
<table class="table table-hover" width="1000" border="1" style="margin-left:auto;margin-right:auto;">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>등급</td>
		<td>나이</td>
		<td>성별</td>
		<td>현금</td>
		<!-- <td>프로필사진</td> -->
	</tr>
<c:forEach items="${member }" var="dto">  
	<tr>
		<td><a href="memberupdateform?m_id=${dto.m_id }">${dto.m_id }</a></td>
		<td>${dto.m_pw }</td>
		<td>${dto.m_name }</td>
		<td>${dto.m_tel }</td>
		<td>${dto.m_name2 }</td>
		<td>${dto.m_email }</td>
		<td>${dto.m_grade }</td>
		<td>${dto.m_age }</td>
		<td>${dto.m_gender }</td>
		<td>${dto.m_cash }</td>
		<%-- <td>${dto.m_filesrc }</td> --%>
	</tr>
</c:forEach>	
</table>
totCnt : ${totRowcnt }
	<br /> 현재페이지/토탈페이지 : ${searchVo.page }/${searchVo.totPage }
	<br />
	<hr />
	<form action="memberlist" method="post">
<c:if test="${searchVo.page>1 }">
   <a href="memberlist?page=1&searchType=${searchtype }&sk=${resk }">[처음]</a>
   <a href="memberlist?page=${searchVo.page-1 }&searchType=${searchtype }&sk=${resk }">[이전]</a>   
</c:if>

<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
   <c:choose>
      <c:when test="${i eq searchVo.page }">
         <span style="color:red; font-weight:bold">${i }&nbsp;</span>
      </c:when>
      <c:otherwise>
         <a href="memberlist?page=${i }" style="text-decoration:none">${i }&nbsp;</a>
      </c:otherwise>
   </c:choose>
</c:forEach>
<c:if test="${searchVo.page < searchVo.totPage }">
   <a href="memberlist?page=${searchVo.page+1 }&searchType=${searchtype }&sk=${resk }">[다음]</a>   
   <a href="memberlist?page=${searchVo.totPage }&searchType=${searchtype }&sk=${resk }">[마지막]</a>
</c:if>
<div>
		<%-- <c:choose>
			<c:when test="${dto.m_id }">
				<input type="checkbox" name="searchType" value="mid" checked /> 	
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="mid"/>
			</c:otherwise>		
		</c:choose>
		아이디
		<c:choose>
			<c:when test="${dto.m_email }">
				<input type="checkbox" name="searchType" value="memail" checked /> 이메일
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="memail"/> 이메일
			</c:otherwise>		
		</c:choose> --%>
		<select name="searchType" value="${searchtype }">
			<option ></option>
			<option >아이디</option>
			<option >이메일</option>
			<option >아이디+이메일</option>
		</select>
		<!-- <input type="checkbox" name="searchType" value="btitle"/> 제목 -->
		<!-- <input type="checkbox" name="searchType" value="bcontent"/> 내용 -->
		<input type="text" name="sk" value="${resk }" />
		<input class="btn1" type="submit" value="검색" />
	</div>
	</form>
</div>
</body>
</html>