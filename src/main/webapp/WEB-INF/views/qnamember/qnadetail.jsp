<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String loginid = (String)session.getAttribute("loginid"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<style>
		.btn1{
			color: white;
			background-color: black;
			border-color: black;
			transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
			border-radius: 5px;
			border: 1px solid;
		}
		.btn1:hover {
			color: black;
			background-color: white;
			border-color: black;
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
function qna_delete(){
	q_mno = document.getElementById("q_mno").value;
	q_mynn = document.getElementById("q_mynn").value; 
	
	alert(q_mynn)
	
	if(q_mynn=='Y'){
		alert("답변달리면삭제불가")
	}else if(q_mynn=='A'){
		alert("답글삭제불가")
	}else if(q_mynn=='N'){
		alert("삭제가능")
		$.ajax({
			url:'../qnamember/qnadelete?q_mno='+q_mno,
			type:'GET',
			success:function(result){
				alert("삭제성공")
				window.location.href="../qnamember/qnalist"
			}
		})
	}
}
function admin_qna_delete(){
	q_mno = document.getElementById("q_mno").value;
	/* q_mynn = document.getElementById("q_mynn").value;  */
	
	alert("관리자가삭제하기신호")
	
/* 	if(q_mynn=='Y'){
		alert("답변달리면삭제불가")
	}else if(q_mynn=='A'){
		alert("답글삭제불가")
	}else if(q_mynn=='N'){
		alert("삭제가능") */
		$.ajax({
			url:'../qnamember/qnadelete?q_mno='+q_mno,
			type:'GET',
			success:function(result){
				alert("삭제성공")
				window.location.href="../qnamember/adminqnalist"
			}
		})
	}

</script>
<h3>qnadetail.jsp</h3>
<h1 style="text-align: center">문의글디테일</h1>
<%-- <form action="qnareplyform">
<input type="hidden" id="q_mno" name="q_mno" value="${qnadetail.q_mno }" />
<input type="text" id="q_mno" value="${qnadetail.q_mno }" />
<input type="hidden" id="q_mynn" name="q_mynn" value="${qnadetail.q_mynn }" />
<table>
	<tr>
		<td class = "left">제목</td>
		<td><input type="text" name="q_mtitle" value="${qnadetail.q_mtitle }" readonly/></td>
	</tr>
	<tr>
		<td class = "left">내용</td>
		<td><textarea name="q_mcontent" readonly>${qnadetail.q_mcontent }</textarea></td>
	</tr>
	<tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="<%=session.getAttribute("loginid") %>" readonly /></td>
	</tr>
	<tr>
		<td class = "left">아이디</td>
		<td><input type="text" name="q_mid" value="${qnadetail.q_mid}" readonly /></td>
	</tr>
 	<tr>
		<td class = "left">답변내용</td>
		<td><textarea name="q_mreply" readonly>${qnadetail.q_mreply}</textarea></td>
	</tr>
	<tr>
		<td colspan = "2">
		<%
		if(loginid.equals("admintest") || loginid.equals("admintest2")){
		%>
		<input type="submit" value="답변폼으로" /> &nbsp;&nbsp;
		<a href="adminqnalist">관리자게시판의 문의글목록</a> &nbsp;&nbsp;
		<%
		}else {
		%>
		<input type="button" value="문의글목록" onclick="location.href='qnalist'" /> &nbsp;&nbsp;
		<%
		}
		%>
		<input type="button" value="삭제하기" onclick="qna_delete()" />
		</td>
	</tr>
</table>
</form> --%>
<form name="qwf" action="qnareplyform" >	
<input type="hidden" id="q_mno" name="q_mno" value="${qnadetail.q_mno }" />
<input type="hidden" id="q_mynn" name="q_mynn" value="${qnadetail.q_mynn }" />
		<input type="text" name="q_mtitle" value="${qnadetail.q_mtitle }" readonly style="width: 559px; height: 30px;"/>
		<input type="text" name="q_mid" value="${qnadetail.q_mid}" style="width: 561px; height: 30px; padding-top: 2px; padding-bottom: 0;" readonly />
		<br /><br />
		<textarea name="q_mcontent" placeholder="내용" readonly style="width: 1135px; height: 400px;">${qnadetail.q_mcontent }</textarea>
		<br /><br />
		<textarea name="q_mreply" readonly style="width: 1135px; height: 400px;">${qnadetail.q_mreply}</textarea>
		<br /><br />
		<%
		if(loginid.equals("admintest") || loginid.equals("admintest2")){
		%>
		<input class="btn1" type="submit" value="답변폼으로" /> &nbsp;&nbsp;
		<input class="btn1" type="button" value="관리자문의글목록" onclick="location.href='adminqnalist'"/> &nbsp;&nbsp;
		<input class="btn1" type="button" value="관리자가삭제하기" onclick="admin_qna_delete()" />
		<%
		}else {
		%>
		<input class="btn1" type="button" value="문의글목록" onclick="location.href='qnalist'" /> &nbsp;&nbsp;
		<input class="btn1" type="button" value="삭제하기" onclick="qna_delete()" />
		<%
		}
		%>

</form>
</body>
</html>