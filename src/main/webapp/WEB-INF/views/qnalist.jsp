<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>qnalist.jsp</h3>
<h1>문의게시판</h1>
현재로그인된아이디 확인용 : <%=session.getAttribute("loginid") %> <br />
문의내역 확인하고싶은 아이디 확인용 : <%=session.getAttribute("loginid") %>
<table width="500" border="1">
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
<c:forEach items="${qnalist }" var="dto">  
	<tr>
		<td>${dto.q_mno }</td>
		<td>${dto.q_mtitle }</td>
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
</body>
</html>