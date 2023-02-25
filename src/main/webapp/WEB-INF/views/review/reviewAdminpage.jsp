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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<%
String sql="select p.p_name p_name,round(avg(r.r_score),1) avgscore"
		 +" from member m, review r, product p, order_member o"
		 +" where m.m_id=r.m_id"
		 +" and r.p_no=p.p_no"
		 +" and r.om_cntnum=o.om_cntnum"
		 +" and o.om_state='구매확정'"
		 +" and r.r_content is not null"
		 +" group by p.p_name"
		 +" order by avgscore desc, p.p_name desc";

Connection con=DBCon.getConnection();
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();

while(rs.next()){
	System.out.println(rs.getString("p_name")+" : "+rs.getString("avgscore"));
}

//데이터를 json처리
JSONArray arr=new JSONArray();
while(rs.next()){
	
	//HashMap<String, Object> hashmap=new HashMap<String, Object>();
	JSONObject obj=new JSONObject();
	String p_name=rs.getString("p_name");
	String avgScore=rs.getString("avgscore");
	
	//hashmap.put("p_name",p_name);
	//hashmap.put("avgScore",avgScore);	
	
	obj.put("p_name",p_name);
	obj.put("avgScore",avgScore);
	
	//if(obj!=null){
	//	arr.add(obj);
	//}
}
rs.close();
pstmt.close();
con.close();
%>


<link rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
<h3>reviewAdminpage</h3>
<a href="../member/main">메인</a>
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
	
	
	//jArray=JSON.parse(jArray);
	
	const barChartOne=new Chart(myChartOne,{
		/* 차트에서 사용할 수 있는 데이터의 형식과 구조로 설정 */
		type:'bar',
		data:{
			labels:[
				jArray[0].p_name,
				jArray[1].p_name,
				jArray[2].p_name,
				jArray[3].p_name,
				jArray[4].p_name,
				jArray[5].p_name,
				jArray[6].p_name,
				jArray[7].p_name
				],
			datasets:[{
				label:'제품 별점순',
				data:[
					jArray[0].avgScore,
					jArray[1].avgScore,
					jArray[2].avgScore,
					jArray[3].avgScore,
					jArray[4].avgScore,
					jArray[5].avgScore,
					jArray[6].avgScore,
					jArray[7].avgScore,
					],
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
<%-- 나오나연 : ${reviewChartScoreDesc }
<c:forEach items="${reviewChartScoreDesc }" var="score">
	${score.p_name }
</c:forEach> --%>
</body>
</html>