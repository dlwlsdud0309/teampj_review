<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 링크 -->
<link rel="stylesheet" href="resources/css/adminmain_content.css" />
<!-- 폰트 링크 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>

</style>
</head>

<body>

<!-- today -->
		<div class="today">												
			<input class="todaymember" type="button"  value="today member :"/>  
			&nbsp;<label class="todaymember_l">0</label>  
			&nbsp;&nbsp;<input class="todaytotal" type="button" value="today total : " />
			<label class="todaytotal_l">0</label>
		</div>
	<hr class="c_hr">
<!-- 오늘의 할일 -->
<div class="job">
	<table class="job_table" border="1">
		<tr>
			<th class="job_th">&nbsp;오늘의 할일&nbsp;<input class="todayjob"type="button" value="0"/></th>
		</tr>
		<tr>
			<td>
				<br />
				&nbsp;<input type="button" value="신규주문">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소관리">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="반품관리">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="답변대기문의">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="문의">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="체크인">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<br /><br />
				&nbsp;<input type="button" value="체크아웃">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="입금대기">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="예약왼료">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소요청">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="취소처리">&nbsp;<label>0</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<br /><br />
			</td>
		</tr>
	</table>
</div>
<br />

			<div class="1" style=" display: flex; flex-direction: column; float: right; margin-right: 80px; ">
				<!-- 관리자 -->
				<table class="admintable_f">
					<tr>
						<td><img src="resources/img/admin/admin_person_icon.png"  /><br />
							<label style="color:white;">관리자  ▼</label><br />
							<label>admintest@micky.co.kr</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:60px;"><label style="margin-left:10px;">사용버전</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="Free" style="border-radius:15px;border:none;width:50px; height:25px;margin-left:10px;color:white; background-color:#97A6aF"/>
						<label style="color: red; float:right;">&nbsp;업그레이드</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:70px;"><label style="margin-left:10px;">PG</label>&nbsp;&nbsp;<label style="margin-left:10px;color:white;">미가입</label>
						<label style="color: #bcbcbc; float:right;margin-right:10px;">설정</label>
						</td>
					</tr>
					<tr>
						 <td style="height:60px;"><hr class="f_hr" style="color: #bcbcbc; width: 90%;" /></td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:50px;"><label style="margin-left:10px;">APP</label>&nbsp;&nbsp;
						<label style="margin-left:10px;color:white;">iOS미사용 / Android 미사용</label>
						<label style="color:red; float:right;margin-right:10px;">설정</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:50px;"><label style="margin-left:10px;">도메인</label>&nbsp;&nbsp;
						<label style="margin-left:10px;color:white;">기본 도메인 사용 중</label>
						<label style="color:red; float:right;margin-right:10px;">설정</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:50px;"><label style="margin-left:10px;">SSL</label>&nbsp;&nbsp;
						<label style="margin-left:10px;color:white;">사용(기본 도메인 자동 적용)</label>
						<label style="color:red; float:right;margin-right:10px;">연장</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:50px;"><label style="margin-left:10px;">SSM</label>&nbsp;&nbsp;
						<label style="margin-left:10px;color:white;">0건</label>
						<label style="color:red; float:right;margin-right:10px;">충전</label>
						</td>
					</tr>
					<tr style="text-align: left;">
						<td style="height:50px;"><label style="margin-left:10px;">입금확인⯑</label>&nbsp;&nbsp;
						<label style="margin-left:10px;color:white;">자동입금확인 미사용</label>
						<label style="color:red; float:right;margin-right:10px;">설정</label>
						</td>
					</tr>
				</table>
				
				<br />




				<div class="admin_me_se_ad"> 
				<!-- 관리자메모 -->
					<div class="admin_memo" style="background-color:#FFFFE0; width:500px; height:200px; font-family:'Noto Sans KR', sans-serif;">
						<img src="resources/img/admin/admin_person2_icon.png" style="float: left; margin-left:30px; margin-top:10px;"/>
						<label style="float:left; margin-top: 20px; margin-left: 10px;">관리자</label>
						<br />
						<textarea rows="1" cols="50" style="float:left;margin-top:30px; margin-left:20px;font-family:'Noto Sans KR', sans-serif;">관리자들과 공유할 메모를 남겨주세요.</textarea>
						<button style="float:left; margin-left:100px; margin-top:20px; background-color:white;border-radius:14px;border-color:white;">저장</button>
					</div>	
				<!-- 관리자 운영진-->  <!-- #bcbcbc #e8e8e8-->
					<div class="admin_setting" style="background-color:#e8e8e8; width:500px; height:150px;font-family:'Noto Sans KR', sans-serif;">
						<label style="float:left; margin-left:30px;margin-top:20px;">운영진 설정</label><label style="float:right; margin-top:20px;margin-right:10px; color:#bcbcbc">관리</label>
						<img src="resources/img/admin/admin_person2_icon.png" style="float:left;margin-right:120px; margin-top:60px;"/>
					</div>
				
				<!-- 광고배너2개 -->					
							<img class="i1" style="" src="resources/img/admin/admin_banner1.jpg" width="500px;" height="80px;" />
						<br />
							<img class="i2" src="resources/img/admin/admin_banner2.jpg" width="500px;" height="80px;"/>
						
				</div>  <!--admin_me_se_ad  관리자메모+운영진+광고배너2-->
		</div>









			
	
				
				
				
				
				
				
				
				
			
					
		<div class="project_table123">
		<!-- 완료된 프로젝트 목록 -->
			<table class="completeproject_table" border="1">
				<tr>
					<th>완료된 업무 및 프로젝트</th>
				</tr>
				<tr>
					<td><input type="range" id="r1"/><br /><label style="color: gray; font-weight: lighter;">5/5 진행완료</label></td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;로그 분석 및 신규 서비스 기획</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;패키지 디자인 편집</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;상반기 매출현황 보고서 작성</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;홈페이지 보안프로젝트</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;채용계획 보고서 작성</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		<!-- 진행중인 프로젝트 목록 -->
			<table class="goproject_table" border="1">
				<tr>
					<th>진행중인 업무 및 프로젝트</th>
				</tr>
				<tr>
					<td><input type="range" id="r1"/><br /><label style="color: gray;font-weight: lighter;">2/7 진행중</label></td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;상품 검색엔진 등록</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;방문자 분석</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;전자결제 신청</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;배송 및 상품 관련 회의</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;네이버 쇼핑 입점 관련</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;채팅상담 컴플레인</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;신규 고객 관리 전략</td>
				</tr>
			</table>
		<!-- 예정된 프로젝트 목록 -->
			<table class="fproject_table" border="1">
				<tr>
					<th>예정된 업무 및 프로젝트</th>
				</tr>
				<tr>
					<td><input type="range" id="r1"/><br /><label style="color: gray;font-weight: lighter;">0/5 진행중</label></td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;광고 콘텐츠 전략미팅</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;유저 로그 분석보고</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;회의록 작성 및 보고</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;할인행사 이벤트 기획</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;언론보도 작성</td>
				</tr>
				<tr>
					<td><input type="checkbox" />&nbsp;주간업무계획 작성</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div><!-- project_table123 -->
		<br /> 
			
				




		<!-- 알림테이블 -->
		<table class="altable" border="1">
			<tr>
				<td colspan="5" style="text-align: left; color: #919090;">&nbsp;최근발송알림</td>
				
				
				
				
			</tr>
			<tr style="color: #919090">
				<td style="text-align: left;">&nbsp;제목</td>
				<td>보낸사람</td>
				<td>받는사람</td>
				<td style="text-align: left;">발송일</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: left;">&nbsp;2023년 연휴 배송공지</td>
				<td>관리자</td>
				<td>전체회원</td>
				<td style="text-align: left;">방금</td>
				<td><img src="resources/img/admin/admin_more_icon.png"/></td>
			</tr>
			<tr>
				<td style="text-align: left;">&nbsp;2023년 연휴 운영공지</td>
				<td>관리자</td>
				<td>전체회원</td>
				<td style="text-align: left;">방금</td>
				<td><img src="resources/img/admin/admin_more_icon.png"/></td>
			</tr>
			<tr>
				<td style="text-align: left;">&nbsp;배송공지사항</td>
				<td>관리자</td>
				<td>전체회원</td>
				<td style="text-align: left;">방금</td>
				<td><img src="resources/img/admin/admin_more_icon.png"/></td>
			</tr>
			<tr >
				<td style="text-align: left;">&nbsp;관리자님이 새 일정 등록</td>
				<td>관리자</td>
				<td>관리자</td>
				<td style="text-align: left;">2023년 2월 6일</td>
				<td><img src="resources/img/admin/admin_more_icon.png"/></td>
			</tr>
			<tr>
				<td style="text-align: left;">&nbsp;관리자님이 새 일정 등록</td>
				<td>관리자</td>
				<td>관리자</td>
				<td style="text-align: left;">2023년 2월 7일</td>
				<td><img src="resources/img/admin/admin_more_icon.png"/></td>
			</tr>
		</table> 






























</body>
</html>