<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Babylonica&family=Nanum+Gothic:wght@400;800&family=Noto+Sans+KR:wght@100&family=Titillium+Web&display=swap" rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->

<style>

        body{

            display: flex;
            flex-direction: column;
            
            /* justify-content: center;
            align-items: center; */

            padding: 0;
            margin: 0;
            /* background-color: blue; */
        }

        /* 헤더 박스 (로고, 로그인) */
        header{
            height: 60px;
            padding: 8px;
            display: flex;
            justify-content: space-between;
            flex-grow : 0;
            border-bottom: 1px solid gainsboro;
        }

        /* 헤더의 버튼들 */
        header > button {
            border: transparent;
            background-color: transparent;
            font-size: larger;
        }

        /*  로그인 전체 박스 중앙정렬 */
        .container{
            /* background-color: aqua; */
            min-height: 600px;
            height: 100%;
            /* width: 400px; */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 24px;
            margin-bottom: 48px;
            /* background-color: aquamarine; */
        }

        /* 약관동의, 회원정보를 입력해주세요 글씨 */
        .container > p{

            font-size: x-large;
        }

        /* <!-- terms and conditions --> */
        .TandC{

            border: 1px solid gray;
            padding:16px;

        }

        /* 약관 동의서들  */
        .TandC > div{

            padding:4px;
            display: flex;
            justify-content: space-between;
        }

        /* 약관 간단 설명에서 (필수)  */
        .TandC strong{

            color:red;
            
        }

        /* 약관 상세보기 버튼  */
        .TandC button{

            background-color: transparent;
            border: transparent;
            text-decoration : underline;
        }

        /* 약관 상세보기 버튼 hover */
        .TandC button:hover{
            cursor: pointer;
        }

        /* 회원 정보 박스 */
        .MemberInfo_box{
            display: flex;
            flex-direction: column;
            width: 400px;
        }

        /* 입력창 */
        .MemberInfo_box input {
            width: 100%;
            /* height: 60px; */
            font-size: large;
            padding:8px;
            box-sizing : border-box;
        }
  
        /* 회원정보 각 요소 박스(입력창+텍스트) */
        .MemberInfo_box > div{

            margin-top:8px;
            margin-bottom:8px;
        
        }

        /* 회원정보 글씨 */
        .MemberInfo_box p{
            margin:0;
            padding:0;
            display: none;
        }
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
	input[type=file]::file-selector-button{
		color: white;
			background-color: black;
			border-color: black;
			transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
			border-radius: 5px;
			border: 1px solid;
	}
	input[type=file]::file-selector-button:hover{
			color: black;
			background-color: white;
			border-color: black;
			transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
			border-radius: 5px;
			cursor: pointer;
	}
    </style>
<!-- 사이드 -->
<link href="../resources/css/checkIndex.css" rel="stylesheet">
</head>
<body style="font-family: 'Noto Sans Korean'; text-align: center">
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />
<!-- 사이드 -->
<jsp:include page="/WEB-INF/views/myPage/checkIndex.jsp" />
<main class="" id="main-collapse">

<script>
var code = ""; //이메일전송 인증번호 저장을 위한 코드

/* function checkid(){
	var overlapcheck_id = jf.m_id.value; //input id의 value
	let valcheck_id = /^[a-z]+[a-z0-9]{5,19}$/g; //아이디 정규식
	
	if(overlapcheck_id.length==0 || overlapcheck_id==""){ //input id를 타이핑하지않으면
		//alert("중복검사할아이디를입력하세요")
		$('.idnull').css("display","inline-block");
		$('.idcheck1').css("display","none");
		$('.idcheck0').css("display","none");
		$('.idcheck').css("display","none");
		jf.m_id.focus();
	}else if(!valcheck_id.test(overlapcheck_id)||overlapcheck_id.length<6){ //input id가 정규식에 벗어나면
		//alert("아이디정규표현식XXXX신호")
		$('.idcheck').css("display","inline-block");
		$('.idcheck1').css("display","none");
		$('.idcheck0').css("display","none");
		$('.idnull').css("display","none");
		jf.m_id.focus();
	}else { //제대로된 input id가 타이핑되면
		//window.location.href="/micky_SportsWear/member/joinidcheck?overlapcheck_id=" + overlapcheck_id;
		$.ajax({
			url: '../member/joinidcheck?overlapcheck=' + overlapcheck_id, //input id를 controller의 joinidcheck()으로
			type: 'GET',
			success: function( result ) { 
				
				if( result==0) { //아이디가 중복하지않을때
					//alert(result);
					//alert("사용가능한아이디입니다 : "+result)
					$('.idcheck0').css("display","inline-block");
					$('.idcheck1').css("display","none");
					$('.idnull').css("display","none");
					$('.idcheck').css("display","none");
					$("input[name=checkid_YESorNO]").val('YES'); //아이디중복확인진행 유무(기본값은 NO)
				} else if( result==1 ) { //아이디가 중복일때
					$('.idcheck1').css("display","inline-block");
					$('.idcheck0').css("display","none");
					$('.idnull').css("display","none");
					$('.idcheck').css("display","none");
					//alert(result);
					//alert("이미있는아이디입니다 : "+result)
				}
			},
			error: function() {
				console.log( "joinForm의 ajax 에러" )
			}
		})
	
	
}
} */
function checknickname(){ //닉네임중복확인
	var overlapcheck_nickname = jf.m_name2.value; //input nickname 값
	
	if(overlapcheck_nickname==0 || overlapcheck_nickname==""){ //input nickname을 타이핑하지않았을때
		//alert("중복검사할닉네임을입력하세요")
		$('.name2null').css("display","inline-block");
		$('.name2check1').css("display","none");
		$('.name2check0').css("display","none");
		jf.m_name2.focus();
		return false;
	}else{
		$('.name2null').css("display","none");
		$.ajax({
			url: '../member/joinnicknamecheck?overlapcheck=' + overlapcheck_nickname, //input nickname을 controller joinnicknamecheck()으로
			type: 'GET',
			success: function( result ) {
				
				if( result==0) { //닉네임이 중복하지않을때
					//alert(result);
					//alert("사용가능한닉네임입니다 : "+result)
					$('.name2check0').css("display","inline-block");
					$('.name2null').css("display","none");
					$('.name2check1').css("display","none");
					$("input[name=checkname2_YESorNO]").val('YES'); //닉네임중복확인진행 유무(기본값은 NO)
				} else if( result==1 ) { //닉네임이 중복할때
					//alert(result);
					//alert("이미있는닉네임입니다 : "+result)
					$('.name2check1').css("display","inline-block");
					$('.name2check0').css("display","none");
					$('.name2null').css("display","none");
				}
			},
			error: function() {
				console.log( "joinForm의 ajax 에러" )
			}
		})
	}
}
function checkpw(){ //비밀번호확인
	var input_pw = jf.m_pw.value; //비밀번호
	var input_checkpw = jf.check_mpw.value; //비밀번호확인
	let valcheck_pw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/; //pw 정규식
	//alert("비밀번호 : "+input_pw+"비밀번호확인 : "+input_checkpw); //확인용
	
	if(input_pw==input_checkpw && input_pw!="" && valcheck_pw.test(input_pw) && input_pw.length<=8){
		$("input[name=checkpassword_YESorNO]").val('YES');
		//alert("비밀번호일치")
		$('.pwcheck1').css("display","inline-block");
		$('.pwcheck0').css("display","none");
		$('.pwnull').css("display","none");
		$('.pwcheck').css("display","none");
	}else if(input_pw==""){
		//alert("비밀번호를 입력하세요")
		$('.pwnull').css("display","inline-block");
		$('.pwcheck0').css("display","none");
		$('.pwcheck1').css("display","none");
		$('.pwcheck').css("display","none");
	}else if(!valcheck_pw.test(input_pw)||input_pw.length<8){
		//alert("비번정규표현식XXXX신호")
		$('.pwcheck').css("display","inline-block");
		$('.pwcheck0').css("display","none");
		$('.pwcheck1').css("display","none");
		$('.pwnull').css("display","none");
	}else{
		//alert("비밀번호가다릅니다")
		$('.pwcheck0').css("display","inline-block");
		$('.pwcheck1').css("display","none");
		$('.pwnull').css("display","none");
		$('.pwcheck').css("display","none");
	}
}
function checktel(){
	var m_tel1 = jf.m_tel.value;
	//alert(m_tel1)
	if(m_tel="" || m_tel==0){
		$('.telnull').css("display","inline-block");
	}else{
		$('.telnull').css("display","none");
		$("checktel_YESorNO").val('YES');
	}
}
  function checkemail2(){
	let valcheck_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var m_email = $("#m_email").val(); //input email값
	if(!valcheck_email.test(m_email)){
		//alert("메일정규표현식XXXX신호")
		$('.emailcheck').css("display","inline-block");
		$('.emailcheck0').css("display","none");
		$('.emailcheck1').css("display","none");
	}else{
		$('.emailcheck').css("display","none");
	}
}  
 function checkemail(){
// 	var m_email = jf.m_email.value; //input email값
	let valcheck_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var m_email = $("#m_email").val(); //input email값
	//alert(m_email+"dd")
	console.log('완성된 이메일 : '+ m_email); //확인용 (f12콘솔창 확인가능)
	const checkinput = $('.email_check_input') //인증번호입력란 (기본값 비활성화)
	
	if(!valcheck_email.test(m_email)){
		//alert("메일정규표현식XXXX신호")
		$('.emailcheck').css("display","inline-block");
		$('.emailcheck0').css("display","none");
		$('.emailcheck1').css("display","none");
	}else {
				$.ajax({
					type:'GET',
					url:'../member/emailoverlapcheck?email=' +m_email,
					success:function(result){
						alert(result)
						if(result==1){
							//alert("이미사용중인이메일입니다")
							$('.emailcheck1').css("display","inline-block");
							$('.emailcheck0').css("display","none");
							$('.emailcheck').css("display","none");
						}else if(result==0){
							//alert("사용가능한이메일입니다")
							$('.emailcheck0').css("display","inline-block");
							$('.emailcheck1').css("display","none");
							$('.emailcheck').css("display","none");
							$.ajax({
								type : 'GET',
								url : '../member/emailcheck?email=' + m_email, //email주소를 controller emailcheck()으로
								success : function(data){
									console.log("data : "+data); //인증번호확인용 (f12콘솔창 확인가능)
									checkinput.attr('disabled',false); //인증번호입력란 활성화
									code=data; //인증번호를 code에 저장
									//alert('ajax신호신호이메일신호') //확인용
								}
							})
							
						}else{
							alert("오류")
						}
					}
				})

	}
}
function emailinputcheck(){ //이메일인증번호확인
	var input_code = $(".email_check_input").val(); //input 인증번호
	//alert("이메일인증번호확인 테스트") //확인용
	if(input_code == code){ //input 인증번호가 발급인증번호랑 일치하면 `` 
		$("input[name=email_check_input_result]").val('YES'); //이메일인증진행 유무 YES로 값을 변경
		//alert("인증번호OO")
		$('.emailchecknumber1').css("display","inline-block");
		$('.emailchecknumber0').css("display","none");
	}else{
		$("input[name=email_check_input_result]").val('NO'); //아니면 NO
		//alert("인증번호XX")
		$('.emailchecknumber0').css("display","inline-block");
		$('.emailchecknumber1').css("display","none");
	}
}
/* function agecheck(){
	var m_age = $("#m_age").val();
	let valcheck_age = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/; //age 정규식
	
	if(m_age==0 || m_age==""){
		//alert("생년월일을입력하세요")
		$('.agenull').css("display","inline-block");
		$('.agecheck').css("display","none");
	}else if(!valcheck_age.test(m_age) || m_age.length<8){
		//alert("생년월일확인하세요")
		$('.agecheck').css("display","inline-block");
		$('.agenull').css("display","none");
	}else{
		$('.agenull').css("display","none");
		$('.agecheck').css("display","none");
		$("checkage_YESorNO").val('YES');
	}
} */
function readURL(input) { //프로필사진 업로드 (아직잘모름)
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
function checkinfovalue(){
	alert("회원가입onsubmit신호")
	/* var m_age = $("#m_age").val();
	var m_name = $("#m_name").val(); */
	
	var m_tel =  jf.m_tel.value;
	var m_gender = jf.m_gender.value;
	alert("m_tel확인 : "+m_tel)
	alert("m_gender확인 : "+m_gender)
	
	var checkname2_YESorNO = jf.checkname2_YESorNO.value; //nickname중복확인진행 유무(기본값은 NO)
	var checkemail_YESorNO = jf.email_check_input_result.value; //email인증진행 유무(기본값은 NO)
	var checkpassword_YESorNO = jf.checkpassword_YESorNO.value; //비밀번호확인 진행 유무
	

	if(m_tel==0 || m_tel=="" || m_gender==0 || m_gender=="" || checkname2_YESorNO=="NO" || checkemail_YESorNO=="NO" || checkpassword_YESorNO=="NO"){
		alert("입력다시")
		return false;
	}else{
		alert("수정완료")
		return true;
	}
	 
}
</script>
<%-- window.onload = function(){
	var defaultemail = jf.defaultemail.value;
	if(defaultemail=="@daum.net"){
		$("#m_email2 option:eq(0)").prop("selected",true);
	}else if(defaultemail=="@naver.com"){
		$("#m_email2 option:eq(1)").prop("selected",true);
	}else if(defaultemail=="@gmail.com"){
		$("#m_email2 option:eq(2)").prop("selected",true);
	}else if(defaultemail=="@hanmail.com"){
		$("#m_email2 option:eq(3)").prop("selected",true);
	}else if(defaultemail=="@yahoo.co.kr"){
		$("#m_email2 option:eq(4)").prop("selected",true);
	}
	
	
}



function checkValue(){
	//var defaultemail = jf.defaultemail.value;
	//alert(defaultemail)

	inputPw = document.getElementById("m_pw").value; //input password값
	inputTel1 = document.getElementById("m_tel1").value;
	inputTel2 = document.getElementById("m_tel2").value;
	inputTel3 = document.getElementById("m_tel3").value;
	inputNickName = document.getElementById("m_name2").value;
	inputEmail = document.getElementById("m_email").value;
	//inputEmail2 = documnet.getElementById("m_email2").value;

	let valcheck_pw = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/; //pw 정규식
	//let valcheck_tel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; //tel 정규식
	
	var checkname2_YESorNO = jf.checkname2_YESorNO.value; //nickname중복확인진행 유무(기본값은 NO)
	var checkemail_YESorNO = jf.email_check_input_result.value; //email인증진행 유무(기본값은 NO)
	var checkpassword_YESorNO = jf.checkpassword_YESorNO.value; //비밀번호확인 진행 유무

	if(!inputPw){
		alert("비번입력하세요")
		return false;
	}else if(checkpassword_YESorNO=="NO"){
		alert("비밀번호확인진행하세요")
		jf.m_pw.focus();
		return false;
	}else if(!inputTel1 || !inputTel2 || !inputTel3){
		alert("전번입력하세요")
		return false;
	}else if(!inputNickName){
		alert("닉네임입력하세요")
		return false;
	}else if(checkname2_YESorNO=="NO"){
		alert("닉네임중복확인하세요")
		return false;
	}else if(!inputEmail){
		alert("이메일입력하세요")
		return false;
	}else if(checkemail_YESorNO=="NO"){
		alert("이메일인증하세요")
		return false;
	}else if(!valcheck_pw.test(inputPw)||inputPw.length<8){
		alert("비번정규표현식XXXX신호")
		return false;
	}/* else if(!valcheck_tel.test(inputTel)){
		alert("전번정규표현식XXXX신호")
		return false;
	} */
}
function checknickname(){ //닉네임중복확인
	var overlapcheck_nickname = jf.m_name2.value; //input nickname 값
	
	if(overlapcheck_nickname==0 || overlapcheck_nickname==""){ //input nickname을 타이핑하지않았을때
		alert("중복검사할닉네임을입력하세요")
		jf.m_name2.focus();
		return false;
	}else{
		$.ajax({
			url: '../member/joinnicknamecheck?overlapcheck=' + overlapcheck_nickname, //input nickname을 controller joinnicknamecheck()으로
			type: 'GET',
			success: function( result ) {
				
				if( result==0) { //닉네임이 중복하지않을때
					//alert(result);
					alert("사용가능한닉네임입니다 : "+result)
					$("input[name=checkname2_YESorNO]").val('YES'); //닉네임중복확인진행 유무(기본값은 NO)
				} else if( result==1 ) { //닉네임이 중복할때
					//alert(result);
					alert("이미있는닉네임입니다 : "+result)
				}
			},
			error: function() {
				console.log( "joinForm의 ajax 에러" )
			}
		})
	}
}
function emailcheck(){ //이메일인증번호발송
	const eamil = $('#m_email').val()+$('#m_email2').val(); //input email + select(option 메일주소)
	console.log('완성된 이메일 : '+ eamil); //확인용 (f12콘솔창 확인가능)
	const checkinput = $('.email_check_input') //인증번호입력란 (기본값 비활성화)
		
	
	 	$.ajax({
		type:'GET',
		url:'../member/emailoverlapcheck?email=' +eamil,
		success:function(result){
			alert(result)
			if(result==1){
				alert("이미사용중인이메일입니다")
			}else if(result==0){
				alert("사용가능한이메일입니다")
				
				$.ajax({
					type : 'GET',
					url : '../member/emailcheck?email=' + eamil, //email주소를 controller emailcheck()으로
					success : function(data){
						console.log("data : "+data); //인증번호확인용 (f12콘솔창 확인가능)
						checkinput.attr('disabled',false); //인증번호입력란 활성화
						code=data; //인증번호를 code에 저장
						alert('ajax신호신호이메일신호') //확인용
					}
				})
				
			}else{
				alert("오류")
			}
		}
	})
}
function emailinputcheck(){ //이메일인증번호확인
	var input_code = $(".email_check_input").val(); //input 인증번호
	alert("이메일인증번호확인 테스트") //확인용
	if(input_code == code){ //input 인증번호가 발급인증번호랑 일치하면
		$("input[name=email_check_input_result]").val('YES'); //이메일인증진행 유무 YES로 값을 변경
		alert("인증번호OO")
	}else{
		$("input[name=email_check_input_result]").val('NO'); //아니면 NO
		alert("인증번호XX")
	}
}
function readURL(input) { //프로필사진 업로드 (아직잘모름)
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
function checkpassword(){ //비밀번호확인
	var input_pw = jf.m_pw.value; //비밀번호
	var input_checkpw = jf.check_mpw.value; //비밀번호확인
	
	alert("비밀번호 : "+input_pw+"비밀번호확인 : "+input_checkpw); //확인용
	
	if(input_pw==input_checkpw && input_pw!=""){
		$("input[name=checkpassword_YESorNO]").val('YES');
		alert("비밀번호일치")
	}else if(input_pw==""){
		alert("비밀번호를 입력하세요")
	}else{
		alert("비밀번호가다릅니다")
	}
}
$(document).ready(function(){ //비밀번호표시 체크박스
	$('input[type=checkbox][name=showpassword]').change(function(){
		alert("비밀번호표시신호")
		if($(this).is(':checked')){
			$('#m_pw').prop("type","text");
			$('#check_mpw').prop("type","text");
		}else{
			$('#m_pw').prop("type","password");
			$('#check_mpw').prop("type","password");
		}
	})
})
</script>
<p style="font-family:'Nanum Gothic'; font-weight: bold;" >infoupdateform.jsp</p>

<h1 style="font-family:'Nanum Gothic'">회원정보수정화면</h1>
<form class="container" action="infoupdate" name="jf" method = "post" enctype="multipart/form-data" onsubmit = "return checkValue()">
<input type="hidden" name="m_id" value="${infoupdateform.m_id }" />
<input type="hidden" name="checkname2_YESorNO" value="NO" readonly/><br /> <!-- 닉네임중복체크유무 -->
<input type="hidden" name="checkpassword_YESorNO" value="NO" readonly />

<input type="hidden" class="defaultemail" name="defaultemail" id="defaultemail" value="${m_email2 }" /> <!-- 이메일 뒷주소 -->

아이디 : ${infoupdateform.m_id }
<br />
비밀번호 : ${infoupdateform.m_pw }
<br />
<input type="password" name="m_pw" id="m_pw" value="${infoupdateform.m_pw }" />
비밀번호 확인 : <input type="password" id="check_mpw" name="check_mpw" value="${infoupdateform.m_pw }"/> <input type="button" value="확인" onclick="checkpassword()" />
비밀번호표시<input type="checkbox" name="showpassword" /> 
<br /> 
이름 : ${infoupdateform.m_name } 
<br />
전화번호 : ${infoupdateform.m_tel } 
<input type="hidden" name="default_tel" id="default_tel" value="${infoupdateform.m_tel } " />
<br />
<c:set var="tel" value="${infoupdateform.m_tel }"/>
<input type="text" name="m_tel1" id="m_tel1" value="${fn:substring(tel,0,3) }" pattern="\d*" maxlength='3'/> - 
<input type="text" name="m_tel2" id="m_tel2" value="${fn:substring(tel,4,8) }" pattern="\d*" maxlength='4'/> - 
<input type="text" name="m_tel3" id="m_tel3" value="${fn:substring(tel,9,13) }" pattern="\d*" maxlength='4'/>

<br />
닉네임 : ${infoupdateform.m_name2 }
<br />
<input type="text" name="m_name2" id="m_name2" value="${infoupdateform.m_name2 }"/><input type="button" value="중복확인" onclick="checknickname()" />
<br />
이메일 : ${infoupdateform.m_email }
<input type="hidden" name="default_email" id="default_email" value="${infoupdateform.m_email } " />
<br />
		<c:set var="email" value="${infoupdateform.m_email }" />
		<input type="text" name="m_email" id="m_email" value="${fn:substring(email,0,email.indexOf("@"))}"/>
		<select name="m_email2" id="m_email2">
		<option name="daum" value="@daum.net">@daum.net</option>
		<option name="naver"  value="@naver.com">@naver.com</option>
		<option name="gmail"  value="@gmail.com">@gmail.com</option>
		<option name="hanmail"  value="@hanmail.com">@hanmail.com</option>
		<option name="yahoo"  value="@yahoo.co.kr">@yahoo.co.kr</option>
		</select> 
		<input type="button" value="인증번호전송" onclick="emailcheck()"/>
		<input class="email_check_input" placeholder="인증번호 6자리를 입력하세요" disabled="disabled" maxlength="6" />
		<input type="button" value="확인" onclick="emailinputcheck()" />
		<input type="text" name ="email_check_input_result" value="NO"  readonly/><br /> <!-- 이메일인증진행 유무 -->
등급 : ${infoupdateform.m_grade }
<br />
나이 : ${infoupdateform.m_age }
<br />
성별 : ${infoupdateform.m_gender }
<br />
현금 : ${infoupdateform.m_cash }
<br />
프로필사진<input type="file" name="m_filesrc" value="3333" accept="image/png, image/jepg" onchange="readURL(this)"/>
		<img id="preview" src="../resources/upload/${infoupdateform.m_filesrc }" width="150px" height="150px" />
<br />
		<input type="submit" value="수정완료" /> &nbsp;&nbsp;
		<a href="mypageform">마이페이지로</a> &nbsp;&nbsp; --%>
<form class="container" style="height: 0px; padding-top: 700px;" action="infoupdate" name="jf" method = "post" enctype="multipart/form-data" onsubmit = "return checkinfovalue()">
<h1 style="font-family:'Nanum Gothic'">회원정보수정화면</h1>
<input type="hidden" name="m_id" value="${infoupdateform.m_id }" />
<input type="hidden" name="checkname2_YESorNO" id="checkname2_YESorNO" value="NO" /><br /> <!-- 닉네임중복체크유무 -->
<input type="hidden" name="checkpassword_YESorNO" id="checkpassword_YESorNO" value="NO" />
<input type="hidden" name="email_check_input_result" id="email_check_input_result" value="NO"/> <br /> <!-- 이메일인증유무 -->
<input type="hidden" name="m_gender" value="${infoupdateform.m_gender }" />

<p>
            <!-- 회원 정보 -->
            회원정보를 입력해주세요
        </p>
        
        <!-- Collection of personal(member) information? -->
        <!-- 회원 정보 -->
        <div class="MemberInfo_box">
            
            <!-- 휴대폰 번호 또는 이메일 주소 -->
            <div>
                <input type="text" id="id" name="m_id" value="${infoupdateform.m_id }" readonly/>
            </div>

            <!-- 비밀번호 -->
            <div>
                <input type="password" id="m_pw" name="m_pw" placeholder="8 ~ 16자 영문, 숫자 조합" oninput="checkpw()" value="${infoupdateform.m_pw }"/>
                <p class="pwnull" style="display: none; color: red;">비밀번호를입력하시오</p>
                <p class="pwcheck" style="display: none; color: red;">8 ~ 16자 영문, 숫자 조합</p>
            </div>

            <!-- 비밀번호 확인 -->
            <div>
                <input type="password" id="check_mpw" name="check_mpw" placeholder="비밀번호확인" oninput="checkpw()" value="${infoupdateform.m_pw }"/>
                <p class="pwnull" style="display: none; color: red;">비밀번호를입력하시오</p>
                <p class="pwcheck1" style="display: none; color: blue;">비밀번호가일치합니다</p>
                <p class="pwcheck0" style="display: none; color: red;">비밀번호가다릅니다</p>
                
            </div>
			
			<!-- 이름 -->
            <div>
                <input type="text" name="m_name" id="m_name" value="${infoupdateform.m_name }" readonly/>
            </div>
			
            <!-- 닉네임 -->
            <div>
                <input type="text" name="m_name2" placeholder="닉네임" oninput="checknickname()" value="${infoupdateform.m_name2 }">
                <p class="name2null" style="display: none; color: red;">닉네임을 입력하세요 </p>
                <p class="name2check1" style="display: none; color: red;">이미사용중인아이디입니다</p>
                <p class="name2check0" style="display: none; color: blue;">사용가능한아이디입니다</p>
            </div>

			<!-- 전화번호 -->
            <div>
				<input type="text" name="m_tel" id="m_tel" pattern="\d*" maxlength='11' placeholder="ex)01012341234" oninput="checktel()" value="${infoupdateform.m_tel } "/> 
				<p class="telnull" style="display: none; color: red;">전화번호를확인하세요</p>
			</div>
			
			<!-- 이메일 -->
            <div>
				<input type="text" name="m_email" id="m_email" placeholder="abc@naver.com" oninput="checkemail2()" value="${infoupdateform.m_email }" />
				<input class="btn1" type="button" onclick="checkemail()" value="인증번호전송"/>
				<!-- <p class="emailcheckcheck" style="display: none; color: red;">이메일 인증하시오</p> -->
				<p class="emailcheck1" style="display: none; color: red;">이미사용중인이메일</p>
				<p class="emailcheck0" style="display: none; color: blue;">사용가능한이메일</p>
				<p class="emailcheck" style="display: none; color: red;">이메일정규식</p>
			</div>
			
			<!-- 이메일인증번호 -->
			<div>
				<input class="email_check_input" placeholder="인증번호 6자리를 입력하세요" disabled="disabled" maxlength="6" oninput="emailinputcheck()"/>
				<!-- <p class="emailcheckcheck" style="display: none; color: red;">이메일 인증하시오</p> -->
				<p class="emailchecknumber0" style="display: none; color: red;">인증번호확인하세요</p>
				<p class="emailchecknumber1" style="display: none; color: blue;">인증완료</p>
			</div>	
				
			<!-- 생년월일 -->
            <div>
				<input type="text" name="m_age" id="m_age" pattern="\d*" maxlength='8' placeholder="ex)20230221" oninput="agecheck()" value="${infoupdateform.m_age }" readonly/>
				<p class="agenull" style="display: none; color: red;">생년월일입력하시오</p>
				<p class="agecheck" style="display: none; color: red;">생년월일확인하세요</p>
			</div>			
			
			<!-- 성별 -->
			<!-- <div>
				남<input type="radio" name="m_gender" id="m_gender" value="male" style="width: 25px; cursor: pointer"/>
				여<input type="radio" name="m_gender" id="m_gender" value="female" style="width: 25px; cursor: pointer"/>			
			</div> -->
			
			<!-- 프로필사진 -->
            <div>
				<input type="file" name="m_filesrc" accept="image/png, image/jepg" onchange="readURL(this)"/>
				<img id="preview" src="../resources/upload/${infoupdateform.m_filesrc }" width="150px" height="150px" />
			</div>

            <div>
                <input class="btn1" type="submit" value="수정완료" /> &nbsp;&nbsp;
            </div>
            <div>
                <!-- 취소 -->
                <input class="btn1" type="button" value="취소" onclick="location.href='mypageform'">&nbsp;&nbsp;
            </div>

        </div>

</form>
</main><!-- 사이드 -->
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>