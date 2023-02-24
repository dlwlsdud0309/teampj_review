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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
<link rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
<h3>reviewAdminpage</h3>
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<canvas id="myChartOne" width="400" height="400"></canvas>
		</div>
		<div class="col-md-6">
			<canvas id="myChartTwo" width="400" height="400"></canvas>
		</div>
		<div class="col-md-6">
			<canvas id="myChartThree" width="400" height="400"></canvas>
		</div>
	</div>
</div>
<script>
	const myChartOne=document.getElementById('myChartOne').getContext('2d');
	const myChartTwo=document.getElementById('myChartTwo').getContext('2d');
	const myChartThree=document.getElementById('myChartThree').getContext('2d');
	
	const barChartOne=new Chart(myChartOne,{
		/* 차트에서 사용할 수 있는 데이터의 형식과 구조로 설정 */
		type:'bar',
		data:{
			labels:['Red','Blue','Yellow','Green','Purple','Orange'],
			datasets:[{
				label:'제품 별점순',
				data:[12,19,3,50,2,3],
				backgroundColor:[
					'rgba(255,99,132,1.0)',
					'rgba(55,162,132,0.2)',
					'rgba(255,230,132,1.2)',
					'rgba(75,99,132,1.0)',
					'rgba(155,99,132,1.2)',
					'#0000ff'
				],
				borderColor:[
					'rgba(255,99,132,1)',
					'rgba(55,162,132,1)',
					'rgba(255,230,132,1)',
					'rgba(75,192,192,1)',
					'rgba(153,102,255,1)',
					'rgba(255,99,132,1)'
				],
				borderWidth:3
			}]
		},
		options:{
			title:{
				display:true,
				text:'제품 별점순'
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
	
	
	const barChartTwo=new Chart(myChartTwo,{
		/* 차트에서 사용할 수 있는 데이터의 형식과 구조로 설정 */
		type:'bar',
		data:{
			labels:['Red','Blue','Yellow','Green','Purple','Orange'],
			datasets:[{
				label:'# of Votes',
				data:[12,19,3,50,2,3],
				backgroundColor:[
					'rgba(255,99,132,1.0)',
					'rgba(55,162,132,0.2)',
					'rgba(255,230,132,1.2)',
					'rgba(75,99,132,1.0)',
					'rgba(155,99,132,1.2)',
					'#0000ff'
				],
				borderColor:[
					'rgba(255,99,132,1)',
					'rgba(55,162,132,1)',
					'rgba(255,230,132,1)',
					'rgba(75,192,192,1)',
					'rgba(153,102,255,1)',
					'rgba(255,99,132,1)'
				],
				borderWidth:3
			}]
		},
		options:{
			scales:{
				y:{
					beginAtZero:true
				}
			}
		}
	});
	
	
</script>
</body>
</html>