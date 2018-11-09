<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body id="master_body">

	<div class="col-xs-3">
		<!-- 겹치는 프로필 박스 부분 -->
		<div class="row">
			<div class="col-xs-12">
				<div
					class="text-center panel panel-default user-profile-bottom-container margin-bottom-0 margin-top-0">


					<div class="user-profile-body">
						<!-- 프로필 이미지 -->


						<!-- 클릭하면 프로필로 넘어감 -->
						<a class="plain" href="#"> 
						<img class="user-profile-image"
							src="" title="${name}"
							onerror="this.onerror=null;this.src='../image/main_user_gray.png';">
						</a>


						<!-- 전문가 등급 -->
						<!-- 클릭하면 전문가 등급으로 넘어감 -->
						<div class="user-profile-ranking">
							<a href="#"> <img class="tooltip-width-100 width-100"
								src="../image/kmong_grade_NEW.png" rel="tooltip-text"
								data-toggle="tooltip" data-placement="right" title=""
								data-original-title=NEW>
							</a>
						</div>


					</div>




					<ul class="list-group margin-top-10">
						<!-- 닉네임부 충전하기 버튼 까지 -->



						<li class="list-unstyled margin-bottom-20">
							<h3 class="margin-bottom-20">
								<a class="plain" href="#">${name}</a>
							</h3>
							<div class="font-color-lighter font-size-h6">크몽캐시</div> <!-- 회원에 따라서 데이터 다르게 줘야 함. -->
							<h3 class="margin-bottom-15 margin-top-5 link-color-blue NGB">
								${sc+cc} 원</h3>
							<div>
								<!-- 클릭하면 충전하기 페이지로 넘어감 -->
								<a class="plain" href="cashcharge.do">
									<div class="btn btn-sm btn-brand-yellow NGB padding-top-5 padding-bottom-5">충전하기</div>
								</a>
							</div>
						</li>




						<li class="list-group-item padding-all-15">
							<!-- 클릭하면 크몽캐시 페이지로 넘어감 --> <a class="plain" href="cash.do?type=적립">
								<div class="row">
									<div class="col-xs-4 text-left padding-right-0">
										<div class="font-color-lighter">적립캐시</div>
									</div>
									<div class="col-xs-8 text-right">
										<!-- 회원에 따라서 데이터 다르게 줘야 함. -->
										<b>${sc}&nbsp;원</b>
									</div>
								</div>
						</a>
						</li>




						<li class="list-group-item padding-all-15">
							<!-- 클릭하면 크몽캐시 페이지로 넘어감 --> <a class="plain" href="cash.do?type=충전">
								<div class="row">
									<div class="col-xs-4 text-left padding-right-0">
										<div class="font-color-lighter">충전캐시</div>
									</div>
									<div class="col-xs-8 text-right">
										<!-- 회원에 따라서 데이터 다르게 줘야 함. -->
										<b>${cc}&nbsp;원</b>
									</div>
								</div>
						</a>
						</li>




					</ul>
				</div>
			</div>
		</div>

	<div class="row margin-left-0 margin-right-0 seller-menu">
			<!-- 바둑판 메뉴 부분 -->
			<div class="col-xs-12 border-solid border-top-none">



				<div class="row border-bottom-solid">
					<!-- 구매관리 페이지로 이동 -->
					<a class="plain font-color-lighter" href="buy.do">
						<div
							class="col-xs-6 bg-color-white padding-all-15 text-center position-relative seller-menu-item border-right  ${active eq 'buy' ? 'active' : '' } "
							data-target="buying">
							<div>
								<img class="width-30px" src="${active eq 'buy' ? '../image/buying_active.png' : '../image/buying.png' }">
							</div>
							<h6 class="margin-bottom-0">구매관리</h6>
						</div>
					</a>


					<!-- 캐시내역 페이지로 이동 -->
					<a class="plain font-color-lighter" href="cash.do">
						<div
							class="col-xs-6 bg-color-white padding-all-15 text-center position-relative seller-menu-item  ${active eq 'cash' ? 'active' : '' }"
							data-target="cash">
							<div>
								<img class="width-30px" src="${active eq 'cash' ? '../image/cash_active.png' : '../image/cash.png' }">
							</div>
							<h6 class="margin-bottom-0">크몽캐시</h6>
						</div>
					</a>

				</div>


				<div class="row">
					<a class="plain font-color-lighter" href="paylist.do">
						<div
							class="col-xs-6 bg-color-white padding-all-15 text-center position-relative seller-menu-item border-right  ${active eq 'pay' ? 'active' : '' }"
							data-target="payment">
							<div>
								<img class="width-30px" src="${active eq 'pay' ? '../image/payment_active.png' : '../image/payment.png' }">
							</div>
							<h6 class="margin-bottom-0">결제내역</h6>
						</div>
						<div
							class="col-xs-6 bg-color-white padding-all-15 text-center position-relative seller-menu-item"
							style="height: 83px"></div>
					</a>
				</div>





			</div>
		</div>

</div>


</body>
</html>