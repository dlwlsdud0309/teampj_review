<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- 공통 메소드들 정리해논 파일 -->
    <!-- <script type="text/javascript" src="Utility.js"></script> -->
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
<body style="text-align: center">
<script>
var code = ""; //이메일전송 인증번호 저장을 위한 코드

function checkid(){
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
}
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
function agecheck(){
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
function checkinfovalue(){
	alert("회원가입onsubmit신호")
	var m_age = $("#m_age").val();
	var m_name = $("#m_name").val();
	
	var m_tel =  jf.m_tel.value;
	var m_gender = jf.m_gender.value;
	
	var check_id = jf.checkid_YESorNO.value;
	var checkname2_YESorNO = jf.checkname2_YESorNO.value; //nickname중복확인진행 유무(기본값은 NO)
	var checkemail_YESorNO = jf.email_check_input_result.value; //email인증진행 유무(기본값은 NO)
	var checkpassword_YESorNO = jf.checkpassword_YESorNO.value; //비밀번호확인 진행 유무
	

	if(m_age==0 || m_age=="" || m_name==0 || m_name=="" || m_tel==0 || m_tel=="" || m_gender==0 || m_gender=="" || check_id=="NO" || checkname2_YESorNO=="NO" || checkemail_YESorNO=="NO" || checkpassword_YESorNO=="NO"){
		alert("입력다시")
		return false;
	}else{
		alert("가입완료")
		return true;
	}
	 
}
function checkname(){
	var m_name = $("m_name").val();
	
	if(m_name==0 || m_name==""){
		$('.namenull').css("display","inline-block");
	}else{
		$('.namenull').css("display","none");
		
	}
}
</script>
    <form class="container" action="join" name="jf" method="post" enctype="multipart/form-data" onsubmit="return checkinfovalue()">
      
    <input type="hidden" name="checkid_YESorNO" id="checkid_YESorNO" value="NO" /><br /> <!-- 아이디중복체크유무 -->
	<input type="hidden" name="checkname2_YESorNO" id="checkname2_YESorNO" value="NO" /><br /> <!-- 닉네임중복체크유무 -->
	<input type="hidden" name="email_check_input_result" id="email_check_input_result" value="NO"/> <br /> <!-- 이메일인증유무 -->
	<input type="hidden" name="checkpassword_YESorNO" id="checkpassword_YESorNO" value="NO" /> <br /> <!-- 비밀번호확인유무 --> 
	<input type="hidden" name="m_grade" value="bronze" readonly/>
	<!-- <input type="hidden" name="checkgender_YESorNO" id="checkpassword_YESorNO" value="NO" /> <br /> 비밀번호확인유무  -->
        <!-- 이용약관 -->
        <!-- <p>    
            약관 동의
        </p> -->

        <!-- terms and conditions -->
        <!-- <div class="TandC">

            전체 동의
            <div style="border-bottom: 1px solid gray;">
                <span>전체 동의</span>
                <input type="checkbox" name="" id="">
            </div>
            
            필수 1
            <div>
                <span><strong>(필수)</strong> 개인회원 약관에 동의 <button>상세 보기</button></span>
                <input type="checkbox" name="" id="">
            </div>
            
            필수 2
            <div>
                <span><strong>(필수)</strong> 개인정보 수집 및 이용에 동의 <button>상세 보기</button></span>
                <input type="checkbox" name="" id="">
            </div>

            선택 1
            <div>
                <span>(선택) 마케팅 정보 수신 동의 - 이메일 <button>상세 보기</button></span>
                <input type="checkbox" name="" id="">
            </div>
            
            선택 2
            <div>
                <span>(선택) 마케팅 정보 수신 동의 - SMS/MMS <button>상세 보기</button></span>
                <input type="checkbox" name="" id="">
            </div>

        </div>  -->

        <p>
            <!-- 회원 정보 -->
            회원정보를 입력해주세요
        </p>
        
        <!-- Collection of personal(member) information? -->
        <!-- 회원 정보 -->
        <div class="MemberInfo_box">
            
            <!-- 휴대폰 번호 또는 이메일 주소 -->
            <div>
                <input type="text" id="id" name="m_id" placeholder="영문자로 시작하는 영문자 또는 숫자 6~20자 " oninput="checkid()"/>
                <p class="idnull" style="display: none; color: red;">아이디를 입력하세요</p>
                <p class="idcheck" style="display: none; color: red;">영문자으로 시작하는 영문자 또는 숫자 6~20자</p>
                <p class="idcheck1" style="display: none; color: red;">이미사용중인아이디입니다</p>
                <p class="idcheck0" style="display: none; color: blue;">사용가능한아이디입니다</p>
            </div>

            <!-- 비밀번호 -->
            <div>
                <input type="password" id="m_pw" name="m_pw" placeholder="8 ~ 16자 영문, 숫자 조합" oninput="checkpw()"/>
                <p class="pwnull" style="display: none; color: red;">비밀번호를입력하시오</p>
                <p class="pwcheck" style="display: none; color: red;">8 ~ 16자 영문, 숫자 조합</p>
            </div>

            <!-- 비밀번호 확인 -->
            <div>
                <input type="password" id="check_mpw" name="check_mpw" placeholder="비밀번호확인" oninput="checkpw()"/>
                <p class="pwnull" style="display: none; color: red;">비밀번호를입력하시오</p>
                <p class="pwcheck1" style="display: none; color: blue;">비밀번호가일치합니다</p>
                <p class="pwcheck0" style="display: none; color: red;">비밀번호가다릅니다</p>
                
            </div>
			
			<!-- 이름 -->
            <div>
                <input type="text" name="m_name" id="m_name" placeholder="이름" oninput="checkname()"/>
                   <p class="namenull" style="display: none; color: red;">이름을입력하세요</p>
            </div>
			
            <!-- 닉네임 -->
            <div>
                <input type="text" name="m_name2" placeholder="닉네임" oninput="checknickname()">
                <p class="name2null" style="display: none; color: red;">닉네임을 입력하세요 </p>
                <p class="name2check1" style="display: none; color: red;">이미사용중인아이디입니다</p>
                <p class="name2check0" style="display: none; color: blue;">사용가능한아이디입니다</p>
            </div>

			<!-- 전화번호 -->
            <div>
				<input type="text" name="m_tel" id="m_tel" pattern="\d*" maxlength='11' placeholder="ex)01012341234" oninput="checktel()"/> 
				<p class="telnull" style="display: none; color: red;">전화번호를확인하세요</p>
			</div>
			
			<!-- 이메일 -->
            <div>
				<input type="text" name="m_email" id="m_email" placeholder="abc@naver.com" oninput="checkemail2()" />
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
				<input type="text" name="m_age" id="m_age" pattern="\d*" maxlength='8' placeholder="ex)20230221" oninput="agecheck()"/>
				<p class="agenull" style="display: none; color: red;">생년월일입력하시오</p>
				<p class="agecheck" style="display: none; color: red;">생년월일확인하세요</p>
			</div>			
			
			<div>
				남<input type="radio" name="m_gender" id="m_gender" value="male" style="width: 25px; cursor: pointer"/>
				여<input type="radio" name="m_gender" id="m_gender" value="female" style="width: 25px; cursor: pointer"/>

			</div>
			
			<!-- 프로필사진 -->
            <div>
				<input type="file" name="m_filesrc" accept="image/png, image/jepg" onchange="readURL(this)"/>
				<img id="preview" width="150px" height="150px" />
			</div>

            <div>
                <!-- 회원가입 -->
                <input class="btn1" type="submit" value="회원가입" >
            </div>
            <div>
                <!-- 취소 -->
                <input class="btn1" type="button" value="취소" onclick="location.href='loginform'">
            </div>

        </div>
    </form>
</body>
</html>