<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	alert("관리자가회원정보수정신호")
	/* var m_age = $("#m_age").val();
	var m_name = $("#m_name").val(); */
	
	var m_id = $("m_id").val();
	var checkid_YESorNO = jf.checkid_YESorNO.value; //nickname중복확인진행 유무(기본값은 NO)

	

	if(checkid_YESorNO=="NO" || m_id=="" || m_id==0){
		alert("입력다시")
		return false;
	}else{
		alert("수정완료")
		return true;
	}
	 
}
function checkid(){
	var overlapcheck_id = $("m_id").val(); //input id의 value
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
}
</script>
<h3>memberupdateform.jsp</h3>
<h1>회원정보수정화면</h1>
<form class="container" action="memberupdate" method = "post" enctype="multipart/form-data" onsubmit="return checkinfovalue()" >
<input type="hidden" name="m_id" value="${memberupdate_id.m_id }" />
<input type="hidden" name="checkid_YESorNO" id="checkid_YESorNO" value="NO" /><br /> <!-- 아이디중복체크유무 -->
<input type="hidden" name="m_grade" value="${memberupdate_id.m_grade }" readonly/>

<div class="MemberInfo_box">
            
            <div>
                <input type="text" id="m_id" name="m_id" placeholder="영문자로 시작하는 영문자 또는 숫자 6~20자 " oninput="checkid()" value="${memberupdate_id.m_id }"/>
                <p class="idnull" style="display: none; color: red;">아이디를 입력하세요</p>
                <p class="idcheck" style="display: none; color: red;">영문자으로 시작하는 영문자 또는 숫자 6~20자</p>
                <p class="idcheck1" style="display: none; color: red;">이미사용중인아이디입니다</p>
                <p class="idcheck0" style="display: none; color: blue;">사용가능한아이디입니다</p>
            </div>

            <!-- 비밀번호 -->
            <div>
                <input type="password" id="m_pw" name="m_pw" placeholder="8 ~ 16자 영문, 숫자 조합" value="${memberupdate_id.m_pw }"/>
                <p class="pwnull" style="display: none; color: red;">비밀번호를입력하시오</p>
                <p class="pwcheck" style="display: none; color: red;">8 ~ 16자 영문, 숫자 조합</p>
            </div>

			<!-- 이름 -->
            <div>
                <input type="text" name="m_name" id="m_name" placeholder="이름" value="${memberupdate_id.m_name }"/>
                   <p class="namenull" style="display: none; color: red;">이름을입력하세요</p>
            </div>
			
            <!-- 닉네임 -->
            <div>
                <input type="text" name="m_name2" placeholder="닉네임" value="${memberupdate_id.m_name2 }"/>
                <p class="name2null" style="display: none; color: red;">닉네임을 입력하세요 </p>
                <p class="name2check1" style="display: none; color: red;">이미사용중인아이디입니다</p>
                <p class="name2check0" style="display: none; color: blue;">사용가능한아이디입니다</p>
            </div>

			<!-- 전화번호 -->
            <div>
				<input type="text" name="m_tel" id="m_tel" pattern="\d*" maxlength='11' placeholder="ex)01012341234" value="${memberupdate_id.m_tel }"/> 
				<p class="telnull" style="display: none; color: red;">전화번호를확인하세요</p>
			</div>
			
			<!-- 이메일 -->
            <div>
				<input type="text" name="m_email" id="m_email" placeholder="abc@naver.com" value="${memberupdate_id.m_email }" />
				<!-- <input class="btn1" type="button" onclick="checkemail()" value="인증번호전송"/> -->
				<!-- <p class="emailcheckcheck" style="display: none; color: red;">이메일 인증하시오</p> -->
				<p class="emailcheck1" style="display: none; color: red;">이미사용중인이메일</p>
				<p class="emailcheck0" style="display: none; color: blue;">사용가능한이메일</p>
				<p class="emailcheck" style="display: none; color: red;">이메일정규식</p>
			</div>
			
			<!-- 이메일인증번호 -->
			<!-- <div>
				<input class="email_check_input" placeholder="인증번호 6자리를 입력하세요" disabled="disabled" maxlength="6" oninput="emailinputcheck()"/>
				<p class="emailcheckcheck" style="display: none; color: red;">이메일 인증하시오</p>
				<p class="emailchecknumber0" style="display: none; color: red;">인증번호확인하세요</p>
				<p class="emailchecknumber1" style="display: none; color: blue;">인증완료</p>
			</div> -->
			
			<!-- 등급 -->
			<div>
				<input class="grade" value="${memberupdate_id.m_grade }"/>
				<!-- <p class="emailcheckcheck" style="display: none; color: red;">이메일 인증하시오</p> -->
				<!-- <p class="emailchecknumber0" style="display: none; color: red;">인증번호확인하세요</p>
				<p class="emailchecknumber1" style="display: none; color: blue;">인증완료</p> -->
			</div>	
				
			<!-- 생년월일 -->
            <div>
				<input type="text" name="m_age" id="m_age" pattern="\d*" maxlength='8' placeholder="ex)20230221" value="${memberupdate_id.m_age }"/>
				<p class="agenull" style="display: none; color: red;">생년월일입력하시오</p>
				<p class="agecheck" style="display: none; color: red;">생년월일확인하세요</p>
			</div>			
			
			<div>
				남<input type="radio" name="m_gender" id="m_gender" value="male" style="width: 25px; cursor: pointer"/>
				여<input type="radio" name="m_gender" id="m_gender" value="female" style="width: 25px; cursor: pointer"/>
			</div>
			
			<div>
				<input type="text" name="m_cash" id="m_cash" value="${memberupdate_id.m_cash }"/>
			</div>
			
			<!-- 프로필사진 -->
            <div>
				<input type="file" name="m_filesrc" accept="image/png, image/jepg" onchange="readURL(this)"/>
				<img id="preview" src="../resources/upload/${memberupdate_id.m_filesrc }" width="150px" height="150px" />
			</div>

            <div>
                <!-- 회원가입 -->
                <input class="btn1" type="submit" value="수정완료" onsubmit="return checkinfovalue()" >
            </div>
            <div>
                <!-- 삭제 -->
                <input class="btn1" type="button" value="삭제" onclick="location.href='memberdelete?m_id=${memberupdate_id.m_id }'">
            </div>
            <div>
                <!-- 취소 -->
                <input class="btn1" type="button" value="취소" onclick="location.href='memberlist'">
            </div>
        </div>
</form>
</body>
</html>