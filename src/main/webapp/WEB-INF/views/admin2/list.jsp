<%-- <%@page import="com.tech.sprj09.dto.BoardDto"%> --%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
// ArrayList<BoardDto> blist=null;
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.warning{
	color: red;
}

</style>


</head>
<body>
<h3>list</h3>
<script>
//button1을 클릭하면 alert
function changecolor(n) {
	alert(n);
	const element=document.getElementById('bname'+n);
	element.classList.add('warning');
}

</script>
<table width="500" border="1">
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>제목</td>
		<td>날자</td>
		<td>히트</td>
		<td>btn</td>
		
	</tr>
	<c:set value="0" var="n" />
	<c:forEach items="${list }" var="dto">
	<c:set value="${n+1 }" var="n" />
	<tr id="thistr">

		<td>${dto.bid }</td>
		<td id="bname${n }">${dto.bname }</td>
		<td>
			<c:set value="${dto.bindent }" var="endindent" />
			<c:forEach begin="1" end="${dto.bindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
					<img src="resources/img/icon_reply.gif" />[re]
				</c:if>
			</c:forEach>
			<a href="contentview?bid=${dto.bid }">${dto.btitle }</a>
		</td>
		<td>${dto.bdate }</td>
		<td>${dto.bhit }</td>
		<td><button  onclick="changecolor(${n });">btnn</button></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5"><a href="writeview">글쓰기</a></td>
	</tr>
</table>

</body>
</html>