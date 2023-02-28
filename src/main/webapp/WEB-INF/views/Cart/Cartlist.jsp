<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
// 수량 플러스 ,마이너스
function fnCalCount(type, ths){
    var $input = $(ths).parents("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.c_cnt").html());
    
    if(type=='p'){
        if(tCount < tEqCount) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
    
}
/* 옵션창 이동  */
function changeoption(ths) {
	var cartNum = Number($(ths).parents("tr").find("td.c_no").html());
	window.open('changeoption?c_no='+cartNum, '옵션변경', 'width=700px,height=800px,scrollbars=yes');
}

</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
body{
    margin-left: 10px;
}    
.tables{
	border-top: solid;
	border-top-color: black;
    width: 100%;
}
tr th{
 	border-bottom: 1px solid;
	border-bottom-color : #666666;
	height: 50px;
	text-align: center;
	
}
td{
    border-bottom: 1px solid;
    border-bottom-color : #dddddd; 	
}
.table-cnt{
    width: 182px;
    border-left: 1px solid;
    border-left-color: #dddddd;
    border-right: 1px solid;
    border-right-color: #dddddd;
}
.payment_left{
	border: 1px solid black;
 	float: right;
    margin-right: 110px;
    padding: 30px 5px 10px 5px;
    text-align: center;
}
.payment_left dd{
    /* border: 1px solid red; */
    padding: 20px;
    
}
.payment_left ul{
    /* text-align: left; */
    padding-left: 0px;    
    
}
.payment_left li{
    /* border: 1px solid red; */
    width: 100%;
    color: black;
    padding-right: 10px;
    margin-right: 10px;
    list-style: none;
    text-align: left;
}
.payment_left li em{
    /* border: 1px solid red; */
    font-style: normal;
    color: #666666;
    /* text-align: left; */
    /* margin-right: 30px; */
    /* float: left; */
}
.payment_left li span{
    /* border: 1px solid blue; */
    /* margin-left: 30px; */
    /* text-align: right; */
    /* float: right; */
}
.orderbutton{
    width: 80%;
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 10px 2px;
    background-color: black;
    color: #eeeeee;
    font-weight: bold;
}
.delete{
    color: black;
}
.delete:hover{
    color: #980000;
    text-decoration: none;
}
.cart-top-delete{
    text-align: right;
}
.cart-top-text{
    font-size: 20px;
}
b{
    font-size: 15px;
}
.cnt-btn-center{
    text-align: center;
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
.option-btn{
    /* width: 120px; */
    /* margin-left: ; */
    color: #666666;
    font-size: 12px;
    padding: 5px 40px 5px 40px;
    /* font-weight: bold; */
    background-color: white;
    border: 1px solid #cccccc;
}
</style>
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />


<form action="../order/orderPage" method="post">
    <div class="container-fluid">    
        <div class="col-xs-12 col-md-8">
            <b class="cart-top-text">장바구니</b> ${fn:length(list) } 개 <br />
            <div class="cart-top-delete">
                <a href="alldeleteCart" class="delete">전체삭제</a> 
            </div>
            <table class="tables">
                    <tr>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>주문금액</th>
                    </tr>
                    <c:forEach  var="cart" items="${list }">
                    <tr>
                        <!-- 상품의 재고 -->
                        <td class="c_cnt" style="display: none;">${cart.productDto.p_cnt }</td>
                        <td class="c_no" style="display: none;">${cart.c_no }</td>
                        <td style="display: none;">
                            <input type="text" name="p_no" value="${cart.productDto.p_no }" />
                            <input type="text" name="u_cnt" value="${cart.c_cnt }" />
                        </td>
                        
                        <td>
                            <!-- 상품의 상세정보로 이동 -->
                            <a href="#"><img src="../resources/img/productimg/${cart.productDto.p_filesrc }.jpg" alt="img_link" width="100px" height="100px"/></a>
                            ${cart.productDto.p_name } <br />
                            ${cart.productDto.p_size }/${cart.productDto.p_no } <br />
                            제품선택수량 : ${cart.c_cnt } <br />    	
                            제품재고 : ${cart.productDto.p_cnt } <br />    	
                            장바구니번호 : ${cart.c_no }				
                            카테고리 : ${cart.productDto.p_category }				
                        </td>
                        <td class="table-cnt">
                            <div class="cnt-btn-center">
                                <!-- +,- update -->
                                <a href="minusCartcount?p_no=${cart.p_no }&c_no=${cart.c_no }" >
                                    <button type="button" class="cnt-btn" onclick="fnCalCount('m', this);">-</button>
                                </a>
                                <input type="text" class="cnt-btn" name="pop_out" value="${cart.c_cnt }" readonly="readonly"/> 
                                <!-- <input type="text" class="cnt-btn" name="pop_out" value="10" readonly="readonly" style="text-align:center;" size=2/>  -->
                                <a href="plusCartcount?p_no=${cart.p_no }&c_no=${cart.c_no }" >
                                    <button type ="button" class="cnt-btn" onclick="fnCalCount('p',this);">+</button>
                                </a> 
                            </div>
                            <!-- 사이즈, 색상 변경으로인해 제품번경 -->
                            <div class="cnt-btn-center">
                                <input type="button" class="option-btn" value="옵션변경" onclick="changeoption(this);" />	
                            </div>
                        </td>
                        <td>
                            <!-- p_no는 화면유지 c_no는 쿼리문에사용 -->
                            <a href="deleteCart?p_no=${cart.p_no }&c_no=${cart.c_no }"><img src="../resources/img/icon_delete.png" alt="현재 장바구니 삭제" /></a> <br />
                            <!-- 상품 갯수증가에 따른가격조정 -->
            <%-- 		    	<c:set value="${cart.productDto.p_price*cart.c_cnt }" var="cntprice" scope="application"/> --%>
                            <strong>${cart.productDto.p_price}</strong><span><b>원</b></span>
                        </td>
                    </tr>
                    </c:forEach>		 
                </table>
                
            </div>

    <div class="payment_left">

        <dl>
            <dt><b>주문 금액</b></dt>	
            <br>
            <dd>
                <ul>
                    <li>
                        <em>상품금액</em> <span>${totalprice }원</span>
                    </li>
                    <li>
                        <em>배송비</em> <span>0원</span>
                    </li>
                    <li>
                        <em>상품 할인금액</em> <span>0원</span>
                    </li>
                    <li>
                        <em>주문 할인금액</em> <span>0원</span>
                    </li>
                </ul>
            </dd>
        </dl>
        <em style="font-style: normal;">총 결제금액</em> <b style="color: red;">${totalprice }</b> <span>원</span> <br />
    <!-- 제품,사이즈,수량,가격,구매자  -->

    <input class="orderbutton" type="submit" value="주문하기" />
    </div>
    
</div>

    <div class="row">
        <div class="col-xs-12 col-md-8" style="border: 1px solid red">.col-xs-12 .col-md-8</div>
        <div class="col-xs-6 col-md-4"  style="border: 1px solid red">.col-xs-6 .col-md-4</div>

  </div>
</form>
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>