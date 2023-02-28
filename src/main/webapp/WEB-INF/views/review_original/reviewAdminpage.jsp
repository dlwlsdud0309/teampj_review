<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="micky.sports.shop.db.DBCon"%>
<%@page import="java.sql.Connection"%>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>


<link rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
<h3>reviewAdminpage</h3>
<a href="../member/main">메인</a>
<c:if test="${empty sessionScope.loginid }">
	<a href="../member/loginform">login</a> 
	<a href="">join</a>
</c:if>
<c:if test="${not empty sessionScope.loginid }">
	<a href="../member/logout">logout</a> 
	<a href="reviewMylistview">${sessionScope.loginid }님</a>
<br />
</c:if>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<canvas id="myChartOne" width="400" height="400"></canvas>
		</div>
	</div>
</div>
<script>
	const myChartOne=document.getElementById('myChartOne').getContext('2d');
	

	const barChartOne=new Chart(myChartOne,{
		/* 차트에서 사용할 수 있는 데이터의 형식과 구조로 설정 */
		type:'line',
		data:{
			labels:[<c:forEach items="${reviewAdmin_ScoreDesc }" var="admin_scoredesc">
					"${admin_scoredesc.productDto.p_name }", 
					</c:forEach>],
			datasets:[{
				label:'제품별 평균별점',
				data:[<c:forEach items="${reviewAdmin_ScoreDesc }" var="admin_scoredesc">
						"${admin_scoredesc.productDto.avgscore }", 
						</c:forEach>],
				backgroundColor:[
					'red',
					'blue',
					'green',
					'yellow'
				],
				borderColor:[
					'rgba(255,99,132,1)',
					'rgba(55,162,132,1)',
					'rgba(255,230,132,1)',
					'rgba(75,192,192,1)',
					'rgba(153,102,255,1)',
					'rgba(255,99,132,1)'
				],
			}]
		},
		options:{
			title:{
				display:true,
				text:'제품별 평균별점'
			},
			legend:{
				display:true,
				position:'top'
			},
			layout:{
				enabled:false
			},
			layout:{
				padding:{
					left:10,
					right:10,
					top:10,
					bottom:10
				}
			}
			/* scales:{
				y:{
					beginAtZero:true
				}
			} */
		}
	});
</script>
</body>
</html>