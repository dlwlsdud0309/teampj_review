<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&family=Nanum+Gothic&family=Noto+Sans+KR:wght@900&family=UnifrakturCook&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/pchartstyle.css" />
</head>
<body>
<!--@@@ header @@@-->
<jsp:include page="/WEB-INF/views/header.jsp" />

<%-- <c:if test="${empty sessionScope.loginid }">
   <a href="../member/loginform">login</a> 
   |  <a href="../member/joinform">join</a>

</c:if>
 <c:if test="${not empty sessionScope.loginid }">
    <a href="../member/logout">logout</a> 
 <br />
 ${sessionScope.loginid } 님, 로그인상태입니다.
	 <div>
		<p class="go-myOrderList" style="color: #336666;">
		<a href="../member/mypageform">마이페이지로</a>
		</p>
	</div>
 </c:if> --%>
 
 <!-- 로그인 상태라면 나의 주문내역보기 가능 -->
 
 <!--@@@ 메인 slide @@@-->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <style>
        .swiper-container {
          width: 100%;
          height: 100%;
          position: relative;
        }
    
        .swiper-slide {
          text-align: center;
          font-size: 18px;
          background: #fff;
    
          /* Center slide text vertically */
          display: -webkit-box;
          display: -ms-flexbox;
          display: -webkit-flex;
          display: flex;
          -webkit-box-pack: center;
          -ms-flex-pack: center;
          -webkit-justify-content: center;
          justify-content: center;
          -webkit-box-align: center;
          -ms-flex-align: center;
          -webkit-align-items: center;
          align-items: center;
        }
        :root{
          --swiper-navigation-size: 50px;
          --swiper-theme-color: black;
        }
        .swiper-slide>img{
        	position: relative;
        	top: -129px;
        	width: 1800px;
        	height: 720px;
        }
        .swiper-button-prev:after{
        	position: relative;
        	bottom: 120px;
        	left: 5px;
        }
        div.swiper-button-next::after{
      		position: relative;
        	bottom: 120px;
        }
        .swiper-text-htag{
        	position: relative;
        	left: 10px;
        }
        .swiper-text-htag{
        	position: absolute;
        	width: 50%;
        	height: 50%;
        	left: -2%;
        	bottom: 25%;
        }
        .swiper-text-htag>h1{
        	font-weight: bolder;
        	color: black;
        	font-size: 50px;
        }
        .swiper-text-htag>h5{
        	font-weight: bolder;
        	font-size: 15px;
        }
        .middle_img{
        	position: relative;
        	top: -131px;
        }
      </style>
</head>
<body>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="../resources/img/mainimg/0224_TNF_Main_KeyVisual_HIKING_PC_02.jpg">
				<div class="swiper-text-htag">
					<h1>LET'S GO <br />
					HIKING</h1>
					<h5>산뜻한 봄 산행을 위한 필수 아이템</h5>
				</div>
			</div>
			<div class="swiper-slide">
				<img src="../resources/img/mainimg/0228_TNF_Main_KeyVisual_HealingTrip_PC_notxt.jpg">
				<div class="swiper-text-htag">
					<h1>START YOUR <br />
					HEALING TRIP</h1>
					<h5>설렘과 쉼이 있는 여행에 필요한 아이템</h5>
				</div>
			</div>
			<div class="swiper-slide">
				<img src="../resources/img/mainimg/0222_TNF_Main_KeyVisual_KIDS_PC.jpg">
				<div class="swiper-text-htag">
					<h1 style="color: white;">ECO <br />
					LITTLE FOREST</h1>
					<h5 style="color: white;">KIDS 2023 SPRING COLLECTION</h5>
				</div>
			</div>
			<div class="swiper-slide">
				<img src="../resources/img/mainimg/Ew0zWoSVIAMsZ0g.jpg">
			</div>
		</div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
 <!--@@@ 메인 slide @@@-->
 

<style>
	body{
		overflow-x: hidden;
	}
	.productChartPackage>h2{
		text-align: center;
		font-weight: bold;
		font-size: 30px;
	}
	.productChartPackage>h4{
		margin-top: 70px;
		margin-bottom: 40px;
		text-align: center;
		font-weight: bold;
		font-size: 25px;
	}
	.main_imgbox{
		text-align: center;
	}
	.main_imgbox>img{
		margin-bottom: 5px;
	}
	.main_imgbox2{
		text-align: center;
	}
	.main_imgbox2>img{
		margin: 5px;
		width: 310px;
		height: 450px;
	}
	.main_text_gucci{
		margin-top: 200px;
		margin-bottom: 60px;
		color: black;
	}
	.main_text_gucci>h2{
		text-align: center;
		font-weight: bolder;
	}
	.main_text_gucci>h4{
		text-align: center;
		color: #757575;
		font-size: 16px;
		font-weight: bold;
	}
	.main_imgbox_andGucci{
		text-align: center;
	}
	.main_imgbox_andGucci>img{
		margin: 5px;
		height: 485px;
	}
</style>
 
<img class="middle_img" src="../resources/img/mainimg/img2_76226.jpg" />
<div class="main_imgbox2">
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-flexi-gear-lookbook-06-2fbf62fd-c9f3-48b9-86a8-567a299423ec.jpg"/>
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-flexi-gear-lookbook-13-bce97e70-41bf-4484-9710-9816fb8a157d.jpg"/>
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-flexi-gear-lookbook-12-2be83b76-b8f1-4ba2-8eb4-d4cab2b8df2e.jpg"/>
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-flexi-gear-lookbook-04-c3ba5b77-44a2-4bfa-a1a1-923b65c94cca.jpg"/>
</div>
<div class="main_imgbox2">
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-new-20-ss-capsule-collection-01-32dc87ac-9247-46a5-8ee5-82bba89de2a8.jpg"/>
	<img src="../resources/img/mainimg/the-north-face-urban-exploration-new-20-ss-capsule-collection-04-e3581233-2761-407b-993b-76f374db7ad1.jpg"/>
	<img src="../resources/img/mainimg/low10.jpg"/>
	<img src="../resources/img/mainimg/low7-1.jpg"/>
</div>
<div class="main_text_gucci">
	<h2>THE NORTH FACE X GUCCI</h2>
	<h4>명품성과 실용성의 조화</h4>
</div>
<div class="main_imgbox_andGucci">
	<img src="../resources/img/mainimg/gucci-north-face-collaborative-collection-teasure-release-01.jpg"/>
	<img src="../resources/img/mainimg/gi7yszc501rsuigib5qc.png"/>
</div>
<div class="main_imgbox">
	<img src="../resources/img/mainimg/The-North-Face-x-Gucci-The-Third-Chapter-01-800x450.jpg"/>
	<img src="../resources/img/mainimg/The-North-Face-x-Gucci-The-Third-Chapter-02-800x450.jpg"/>
	<img src="../resources/img/mainimg/The-North-Face-x-Gucci-The-Third-Chapter-03-800x450.jpg"/>
	<img src="../resources/img/mainimg/The-North-Face-x-Gucci-The-Third-Chapter-04-800x450.jpg"/>
</div>

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

<div class="productChartPackage">
<h2>판매량 top5</h2>
<br />
<h4>현재시간 top5</h4>
<ul class="productChart">
<c:forEach items="${pdtTimeChart }" var="pTChart">
	<li>
		<div class="pdtthumbnail">
			<a href="productDetail?pname=${pTChart.p_name }&pfilesrc=${pTChart.p_filesrc }">
			<img src="../resources/img/productimg/${pTChart.p_filesrc }.jpg" alt="" />
			</a>
		</div>
		<div class="pdtdetail">
			<p class="pname">
			<a href="productDetail?pname=${pTChart.p_name }&pfilesrc=${pTChart.p_filesrc }">
			${pTChart.p_name}
			</a>
			</p>
			<p class="pcolor">
				<span>${pTChart.p_color}</span>
			</p>
			<p class="pprice">
				<span><fmt:formatNumber value="${pTChart.p_price}" pattern="###,###"/>원</span>
			</p>
		</div>
	</li>	
</c:forEach>
</ul>
<h4>전체상품 top5</h4>
<h6></h6>
<ul class="productChart">
<c:forEach items="${productChart }" var="pChart">
	<li>
		<div class="pdtthumbnail">
			<a href="productDetail?pname=${pChart.p_name }&pfilesrc=${pChart.p_filesrc }">
			<img src="../resources/img/productimg/${pChart.p_filesrc }.jpg" alt="" />
			</a>
		</div>
		<div class="pdtdetail">
			<p class="pname">
			<a href="productDetail?pname=${pChart.p_name }&pfilesrc=${pChart.p_filesrc }">
			${pChart.p_name}
			</a>
			</p>
			<p class="pcolor">
				<span>${pChart.p_color}</span>
			</p>
			<p class="pprice">
				<span>${pChart.p_price}</span>
			</p>
		</div>
	</li>	
</c:forEach>
</ul>
<h4>별점순 top5</h4>
<div class="productChartPackage">
	<ul class="productChart">
	<c:forEach items="${chartScore_top5 }" var="scoredesc">
		<li>
			<div class="pdtthumbnail">
				<a href="../product/productDetail?pname=${scoredesc.productDto.p_name }&pfilesrc=${scoredesc.productDto.p_filesrc }">
				<img src="../resources/img/productimg/${scoredesc.productDto.p_filesrc }.jpg" alt="" />
				</a>
			</div>
			<div class="pdtdetail">
				<p class="pname">
				<a href="../product/productDetail?pname=${scoredesc.productDto.p_name }&pfilesrc=${scoredesc.productDto.p_filesrc }">
				${scoredesc.productDto.p_name}
				</a>
				</p>
				<p class="ppcolor">
					<span style="color: #ff7f00;">★</span><span>${scoredesc.productDto.avgscore}</span>
				</p>
				<p class="pprice">
					<span>${scoredesc.productDto.p_price}</span>
				</p>
			</div>
		</li>	
	</c:forEach>
	</ul>
</div>
<h4>남성 인기 순위 top5</h4>
	<ul class="productChart">
	<c:forEach items="${maleScore_top5 }" var="malescoredesc">
		<li>
			<div class="pdtthumbnail">
				<a href="../product/productDetail?pname=${malescoredesc.p_name }&pfilesrc=${malescoredesc.p_filesrc }">
				<img src="../resources/img/productimg/${malescoredesc.p_filesrc }.jpg" alt="" />
				</a>
			</div>
			<div class="pdtdetail">
				<p class="pname">
				<a href="../product/productDetail?pname=${malescoredesc.p_name }&pfilesrc=${malescoredesc.p_filesrc }">
				${malescoredesc.p_name}
				</a>
				</p>
				<p class="ppcolor">
					<span>${malescoredesc.p_color}</span>
				</p>
				<p class="pprice">
					<span>${malescoredesc.p_price}</span>
				</p>
			</div>
		</li>	
	</c:forEach>
	</ul>
<h4>여성 인기 순위 top5</h4>
	<ul class="productChart">
	<c:forEach items="${femaleScore_top5 }" var="femalescoredesc">
		<li>
			<div class="pdtthumbnail">
				<a href="../product/productDetail?pname=${femalescoredesc.p_name }&pfilesrc=${scoredesc.p_filesrc }">
				<img src="../resources/img/productimg/${femalescoredesc.p_filesrc }.jpg" alt="" />
				</a>
			</div>
			<div class="pdtdetail">
				<p class="pname">
				<a href="../product/productDetail?pname=${femalescoredesc.p_name }&pfilesrc=${scoredesc.p_filesrc }">
				${femalescoredesc.p_name}
				</a>
				</p>
				<p class="ppcolor">
					<span>${femalescoredesc.p_color}</span>
				</p>
				<p class="pprice">
					<span>${femalescoredesc.p_price}</span>
				</p>
			</div>
		</li>	
	</c:forEach>
	</ul>

</div>


</body>
<!--@@@ footer @@@-->
<jsp:include page="/WEB-INF/views/footer.jsp" />
</html>