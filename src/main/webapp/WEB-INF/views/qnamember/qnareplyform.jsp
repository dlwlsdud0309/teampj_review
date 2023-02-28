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
</script>
<h3>qnareplyform.jsp</h3>
<h1>문의글답변화면</h1>
<%-- <form action="qnareply">
<input type="hidden" name="q_mno" value="${qnadetail.q_mno }" />
<input type="hidden" name="q_mynn" value="${qnadetail.q_mynn }" />
<input type="hidden" name="q_mdate" value="${qnadetail.q_mdate }" />
<input type="hidden" name="q_mgroup" value="${qnadetail.q_mgroup }" />
<input type="hidden" name="q_mstep" value="${qnadetail.q_mstep }" />
<input type="hidden" name="q_mindent" value="${qnadetail.q_mindent }" /> --%>

<%-- <table>
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
		<td><input type="text" name="q_mid" value="${qnadetail.q_mid }" readonly /></td>
	</tr>
	<tr>
		<td class = "left">답변</td>
		<td><textarea name="q_mreply" ></textarea></td>
	</tr>
	<tr>
		<input class="btn1" type="submit" value="답변하기" /> &nbsp;&nbsp;
		<input class="btn2" type="button" value="관리자문의글목록" /> &nbsp;&nbsp;
		<!-- <a href="#">삭제</a> &nbsp;&nbsp;
		<a href="#">답변폼으로</a> &nbsp;&nbsp; -->
		</td>
	</tr>
</table>
</form> --%>
<form name="qwf" action="qnareply" >
<input type="hidden" name="q_mno" value="${qnadetail.q_mno }" />
<%-- <input type="hidden" name="q_mynn" value="${qnadetail.q_mynn }" /> --%>
<input type="hidden" name="q_mdate" value="${qnadetail.q_mdate }" />
<input type="hidden" name="q_mgroup" value="${qnadetail.q_mgroup }" />
<input type="hidden" name="q_mstep" value="${qnadetail.q_mstep }" />
<input type="hidden" name="q_mindent" value="${qnadetail.q_mindent }" />
		<input type="text" name="q_mtitle" value="${qnadetail.q_mtitle }" readonly style="width: 559px; height: 30px;"/>
		<input type="text" name="q_mid" value="${qnadetail.q_mid}" style="width: 559px; height: 30px; padding-top: 2px; padding-bottom: 0;" readonly />
		<br /><br />
		<textarea name="q_mcontent" placeholder="내용" readonly style="width: 1135px; height: 400px;">${qnadetail.q_mcontent }</textarea>
		<br /><br />
		<textarea name="q_mreply" style="width: 1135px; height: 400px;"></textarea>
		<br /><br />
		<input class="btn1" type="submit" value="답변하기" /> &nbsp;&nbsp;
		<input class="btn1" type="button" value="관리자문의글목록" onclick="location.href='adminqnalist'"/> &nbsp;&nbsp;
		<input class="btn1" type="button" value="취소" onclick="location.href='qnadetail?q_mno=${qnadetail.q_mno }'"/> &nbsp;&nbsp;

</form>
</body>
</html>