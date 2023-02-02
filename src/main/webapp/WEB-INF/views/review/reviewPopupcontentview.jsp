<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/reviewstyle.css" />
</head>
<body>
<h3>reviewPopupcontentview</h3>
<%-- <input type="hidden" value="${popup_list.r_no }" /> --%>
<h1>상품리뷰</h1>
<p>리뷰 작성 시 적립 가능한 최대 마일리지</p>
<%-- <p>${popup_list.r_title }</p> --%>
${popup_list.r_no }
<div>
	<p>
		리뷰 리워드 혜택 안내
		<br />
		주문 상품 수령 후 30일 내 리뷰 작성시 10일 후 마일리지를 적립해드립니다.
	</p>
	<ul>
		<li>일단 텍스트 리뷰 : 500M, 사진 첨부 리뷰 : 1,000M 적립</li>
		<li>리워드 적립 전 리뷰 삭제 시 적립 대상에서 제외됩니다.</li>
		<li>반품 접수 시에는 리뷰 작성이 불가합니다.</li>
		<li>리뷰 작성으로 적립된 마일리지 유효기간은 2년입니다.</li>
	</ul>
</div>
<h1>리뷰 작성하기</h1>
<div>
	<p>
		현재 상품평을 작성할 수 있는 상품이 없습니다.
		<br />
		구매하신 상품이 있다면 상품에 대한 이야기를 들려주세요
		<br />
		<a href="#">주문내역보러가기</a>
	</p>
</div>
<h1>작성한 리뷰보기</h1>
	<ul>
		<li>리워드가 적립된 리뷰는 삭제가 불가하며, 삭제버튼이 노출되지 않습니다.</li>
		<li>리워드가 적립된 리뷰에 대한 삭제 요청은 고객센터로 문의해주세요.</li>
	</ul>
	<div class="clear" ></div>
	<hr />
	<form action="" >
		<div class="reviewListview_total">
			<div class="reviewListview_label">
				<div class="row">
					<div class="cell col11">
						<div class="reviewListview_img_box">
							<a href="reviewBoard">이미지</a>
						</div>
						<div>
							<button>수정</button><button>삭제</button>
						</div>
					</div>
					<div class="cell col22">
						<div>
							<div class="cell">
								<div>
									<a href="reviewBoard">상품명</a>
								</div>
							</div>
							<div class="cell">
								<div>
									<span>아이디</span><span>${review_mylist.r_date }</span>
								</div>
							</div>
							<div>
								<div>리뷰제목</div>
								<div>리뷰내용</div>
								<div>업로드 이미지</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>