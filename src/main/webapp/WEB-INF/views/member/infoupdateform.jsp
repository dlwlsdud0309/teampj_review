<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/nstyle.css" />
</head>
<body>
<h3>memberupdateform.jsp</h3>
<h1>회원정보수정화면</h1>
<form action="memberupdate" method = "post">
<input type="hidden" name="m_id" value="${infoupdateform.m_id }" />
<table>
	<tr>
		<td class = "left">아이디</td>
		<td>${infoupdateform.m_id }</td>
	</tr>
	<tr>
		<td class = "left">비밀번호</td>
		<td><input type="text" name="m_pw" value="${infoupdateform.m_pw }" /></td>
	</tr>
	<tr>
		<td class = "left">이름</td>
		<td>${infoupdateform.m_name }</td>
	</tr>
	<tr>
		<td class = "left">전화번호</td>
		<td><input type="text" name="m_tel" value="${infoupdateform.m_tel }" /></td>
	</tr>
	<tr>
		<td class = "left">닉네임</td>
		<td><input type="text" name="m_name2" value="${infoupdateform.m_name2 }" /></td>
	</tr>
	<tr>
		<td class = "left">이메일</td>
		<td><input type="text" name="m_email" value="${infoupdateform.m_email }" /></td>
	</tr>
	<tr>
		<td class = "left">등급</td>
		<td>${infoupdateform.m_grade }</td>
	</tr>
	<tr>
		<td class = "left">나이</td>
		<td>${infoupdateform.m_age }</td>
	</tr>
	<tr>
		<td class = "left">성별</td>
		<td>${infoupdateform.m_gender }</td>
	</tr>
	<tr>
		<td class = "left">현금</td>
		<td>${infoupdateform.m_cash }</td>
	</tr>
	<tr>
		<td class = "left">프로필사진</td>
		<td><input type="text" name="m_filesrc" value="${infoupdateform.m_filesrc }" /></td>
	</tr>
	<tr>
		<td colspan = "2">
		<input type="submit" value="수정완료" /> &nbsp;&nbsp;
		<a href="mypageform">마이페이지로</a> &nbsp;&nbsp;
		<%-- <a href="memberdelete?m_id=${memberupdate_id.m_id }">회원삭제하기</a> &nbsp;&nbsp; --%>
		</td> 
	</tr>
</table>
</form>
</body>
</html>