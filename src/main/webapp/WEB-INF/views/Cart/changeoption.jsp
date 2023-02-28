<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
<script src="../resources/js/scriptjsp.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- 3.x.x 버전 - 가장 최신 버전, 아작스를 지원 -->
<script>
function fnCalCount(type, ths){
    var $input = $(ths).parents("div").find("input[name='c_cnt']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("div").find("p.c_cnt").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
         }
}
function dbupdate() {
	var p_no=forms.p_no.value;
	var p_color=forms.p_color.value;
	var p_size=forms.p_size.value;
	var c_cnt=forms.c_cnt.value;
	var c_no=forms.c_no.value;
	var p_category=forms.p_category.value;
	var p_name=forms.p_name.value;
	$.ajax({
		url:'modifycartoption?p_no='+p_no+'&p_color='+p_color+'&p_size='+p_size+'&c_cnt='+c_cnt+'&c_no='+c_no+'&p_category='+p_category+'&p_name='+p_name,
		async:true,
		type:'GET',
		data: {
		},
		success: function( result ) {
// 				중복일떄
				if (result == 1 ) {
					alert("중복된 상품이 있습니다.")
				}
	        	opener.document.location.reload();
	        	window.close();
	     },
	     error: function() {
	        console.log( "joinForm의 ajax 에러" )
	     }
	});
}
function selectsize(ths){
	var size=$(ths).val();
	document.getElementById("result").value=size;
}
//별점
function redeptlist(target) {
    alert("target : "+target.value);
    $('#starInput[name=r_score]').attr('value',target.value);   
 }
 
 function getvalue(target) {
    alert(target.value);
 } 
</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>Insert title here</title>
<style>
.title-text{
    border-bottom: 2px solid #333;
}
.option-img{
    width: 100%;
    /* height: 350px; */
}
.size-btn-center{
    /* text-align: center; */
    /* border: 1px solid red; */
}
.pdtsizeradio {
	width: 60px;
	height: 43px;
	padding: 2px 5px;
	display: inline-block;
}
.pdtsizeradio input[type=radio] {
	display: none;
}
.pdtsizeradio input[type=radio]+label {
	display: inline-block;
    width: 55px;
	height: 40px;
	border: 1px solid #333;
	line-height: 40px;
    border-radius: 10px;
    text-align: center;
    font-size: 12px;
    cursor: pointer;
}
.pdtsizeradio input[type=radio]:checked+label {
	background: #000;
	color: #fff;
}
.cnt-btn{
    width: 35px;
    /* height: 33px; */
    text-align: center;
    /* margin-left: 10px; */
    margin-left: -3px;
    margin-right: -2px;
    margin-bottom: 10px;
    color: #666666;
    font-size: 20px;
    /* font-weight: bold; */
    background-color: white;
    border: 1px solid #cccccc;
}
.cnt-btn-position{
	padding-left: 10px;
/* 	line-height: 30px; */
}
.selectbutton{
    width: 300px;
    /* width: 80%; */
    margin-left: 7px;
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 10px 2px;
    background-color: black;
    color: #eeeeee;
    font-weight: bold;
}
</style>
</head>
<body>

<div class="container-fluid">
    <div class="title-text">
        <h3>옵션 변경</h3>
    </div>
<br />
    <form name="forms">
        <div class="row">        
            <div class="col-xs-6">
                <img src="../resources/img/productimg/${list.productDto.p_filesrc }.jpg" alt="img" class="option-img"/>        
            </div>
            <div class="col-xs-6">
                ${list.productDto.p_no } <br />	
                <b>${list.productDto.p_name }</b>  <a href="#">상품상세</a><br /><!-- 상품의 디테일로가는링크 -->
                
                ${list.productDto.p_price } <span>원</span> <br />     
                <hr />
                <div>
                    <div class="avg_star">
                        <div class="tablerow">
                        <div class="tablecell">
                            <span class="user_date">
                                <span class="reviewBoard_star">
                                    ★★★★★
                                    <span id="star2" style="width:8${avgStarscore*20}%">★★★★★</span>
                                </span>
                            </span>
                        </div>
                        <div class="tablerow">
                            <%-- <b>&nbsp;&nbsp;&nbsp; ${avgStarscore } 총점</b> --%>
                        </div>
                        </div>
                        <div><b>${totalCount }2개의 REVIEWS</b></div>
                    </div>
                <br />
                </div>
                <hr />
                <!-- 상품의색상의 이미지를 클릭하면 그 상품으로 변환  -->
                ${list.productDto.p_color } <br />
                <hr />
                <!-- 사이즈 변경시 같은색의 선택한 사이즈의 상품으로 변환 -->
                사이즈 	
                    <div class="size-btn-center">
                        <c:forEach var="plist" items="${plist }" >
                            <div class="pdtsizeradio">
                                <c:if test="${plist.p_cnt eq 0 }">
                                </c:if>
                                <c:if test="${plist.p_cnt > 0 }">
                                    <input type="radio" id="size${plist.p_size }" name="size" value="${plist.p_size }" onclick="selectsize(this);"/>
                                    <label for="size${plist.p_size }">${plist.p_size }</label>            
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                    <br />
                수량
                <p class="c_cnt" style="display: none;">${list.productDto.p_cnt }</p> <br />
                <!-- +,-에 update달기 -->
                <div class="cnt-btn-position">
                    <input type="text" name="c_cnt" value="${list.c_cnt }" readonly="readonly" class="cnt-btn"/>
                    <button type="button" class="cnt-btn" onclick="fnCalCount('m', this);">-</button>
                    <button type ="button" class="cnt-btn" onclick="fnCalCount('p',this);">+</button>
                </div>
                <input type="button" value="선택완료" class="selectbutton" onclick="dbupdate();" />	
            </div>
        </div>
        <input type="text" name="p_no" value="${list.productDto.p_no }">
        <input type="text" name="p_color" value="${list.productDto.p_color }">
        <input type="text" id="result" name="p_size" value="${list.productDto.p_size }">
        <input type="text" name="c_no" value="${list.c_no }">
        <input type="text" name="p_category" value="${list.productDto.p_category }">
        <input type="text" name="p_name" value="${list.productDto.p_name }">
    </form>
</div>
</body>
</html>