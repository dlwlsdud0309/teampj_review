<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
</head>
<body>
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
<h3>qnalist.jsp</h3>
<h1>문의게시판</h1>
현재로그인된아이디 확인용 : <%=session.getAttribute("loginid") %> <br />
문의내역 확인하고싶은 아이디 확인용 : <%=session.getAttribute("loginid") %>
<input type="button" value="문의하기" onclick="location.href='../qnamember/qnawriteform'" />
<input type="button" value="마이페이지" onclick="location.href='../member/mypageform'" />
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
		<td>
			<c:set value="${dto.q_mindent }" var="endindent" />
			<c:forEach begin="1" end="${dto.q_mindent }" var="cnt">
				&nbsp;
				<c:if test="${cnt eq endindent }">
					<img src="../resources/img/icon_reply.gif" />[re]
				</c:if>
			</c:forEach>
		<a href="qnadetail?q_mno=${dto.q_mno }">${dto.q_mtitle }</a>
		</td> <!-- 문의제목 클릭하면 해당글의 고유번호값 MemberCotnroller / qnadetail()로 보내기 -->
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
</body>
</html>