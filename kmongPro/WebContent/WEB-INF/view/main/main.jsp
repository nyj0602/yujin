<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>비지니스 파트너 크몽에 다있다! 외주, 아웃소싱 전문 | 크몽</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style>
.global-body {
	margin-top: 0px !important;
}
</style>






<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css" type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">
<link rel="shortcut icon" href="css/image/favicon.ico">



<script type="text/javascript">

	$(document).ready(function() {
		//alert('11');

		var mknav = $('#mainKmongNavBar');
		$(window).scroll(function() {
			if ($(this).scrollTop() > 750) {
				mknav.css("display", "block");
				mknav.addClass("f-nav");
			} else {
				mknav.css("display", "none");
				mknav.removeClass("f-nav");
			}
		});

		$("#quickMenuTop").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		$('.fSliderTrack').slick({
			prevArrow : $('.specialGigSliderLeft'),
			nextArrow : $('.specialGigSliderRight'),
			infinite : true,
			slidesToShow : 4.5,
			slidesToScroll : 1

		});

	});
</script>

</head>
<body id="master_body">
<h1>어떻게 들어오는거징</h1>

	<header>


		<nav id="kmongNavBar" class="navbar header-main">

			<div class="container">
				<div class="row">
					<div class="col-xs-6 padding-top-15 padding-bottom-10">
						<ul class="list-inline margin-bottom-0 margin-top-5">
							<li class="pull-left header-logo-align"><a href="main.do"
								onclick=" sendGAEvent('main', '투명 헤더 - 로고', kmongCurrentPath); ">
									<img class="width-100px searchMainFlag"
									style="margin-top: 3px;" src="css/image/kmong_logo_20170518.png"
									title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( Kmong )">
							</a></li>
						</ul>
					</div>
					<div class="col-xs-6 padding-top-15 padding-bottom-10">


						<ul class="list-inline margin-all-0 pull-right">
							<li class="position-relative" style="top: 2px;"><a
								class="plain color-white" href="become_a_seller.do"
								onclick="sendGAEvent('main', '투명 헤더 - 판매시작하기', kmongCurrentPath);">
									<h5>판매시작하기</h5>
							</a></li>
							<li class="position-relative padding-left-20" style="top: 2px;">
								<a class="plain color-white" href="login.do">
									<h5>로그인</h5>
							</a>
							</li>

							<li class="position-relative padding-left-20"><a
								class="btn btn-sm btn-block searchMainFlag  btn-black "
								href="http://localhost:8080/kmongPro/signup.do"
								onclick="sendGAEvent('main', '투명 헤더 - 무료회원가입', kmongCurrentPath);">
									무료 회원가입 </a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<nav id="mainKmongNavBar" class="navbar navbar-fixed-top"
		style="z-index: 99; display: none;">
		<jsp:include page="/WEB-INF/view/inc/header/header_main.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
	</nav>


	<div class="fake_global_body"></div>
	<div class="global-body">

			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>


		<div id="mainHeaderGigsContainer" class="bg-color-yellow-400">
			<div class="container">

				<div id="mainTopGigsCarousel" class="carousel slide carousel-fade"
					data-ride="carousel" data-interval="false">
					<div class="row">
						<div class="col-xs-5 padding-left-45"
							style="margin-top: 151px; z-index: 30">
							<div class="row">
								<div class="col-xs-12">
									<div class="font-size-32 NGM title-text-style">
										모든 일에는 <br> 전문가가 필요합니다.
									</div>
									<h3 class="margin-top-10">각 분야 전문가들의 실력을 빌려보세요.</h3>
								</div>
							</div>
							<form method="GET" action="https://kmong.com/gigs/keyword"
								accept-charset="UTF-8" id="searchKeyword"
								class="margin-bottom-0" data-name="메인 상단" data-type="기본">
								<div class="row margin-top-10">
									<div class="col-xs-12">
										<div class="search-group">
											<input class="form-control input-sm"
												placeholder="어떤 서비스가 필요하세요?" id="mainKeyword" name="keyword"
												type="text">
											<button type="submit" class="btn btn-black btn-sm"
												onmouseup="sendGAEvent('main', '기본 - 서비스 검색', kmongCurrentPath); sendGAEvent('A/B test - main', '기본', '검색버튼 클릭');">검색</button>
										</div>
									</div>
								</div>
							</form>
							<div class="row">
								<div class="col-xs-12">
									<h5 class="color-brown text-underline margin-top-15 cursor"
										data-toggle="modal" data-target="#kmongManual"
										onclick="sendGAEvent('main', '기본 - 초간단 구매방법', kmongCurrentPath);">
										<b>초간단 구매방법</b>
									</h5>
								</div>
							</div>
							<div class="row margin-top-65">
								<div class="col-xs-12">
									<div id="mainTopGigsCarouselIndicator"
										class="carousel-indicators index-main-slide-nav">
										<i class="fa fa-circle margin-right-5  active "
											data-target="#mainTopGigsCarousel" data-slide-to="0"
											aria-hidden="true"></i> <i
											class="fa fa-circle margin-right-5 "
											data-target="#mainTopGigsCarousel" data-slide-to="1"
											aria-hidden="true"></i> <i
											class="fa fa-circle margin-right-5 "
											data-target="#mainTopGigsCarousel" data-slide-to="2"
											aria-hidden="true"></i> <i
											class="fa fa-circle margin-right-5 "
											data-target="#mainTopGigsCarousel" data-slide-to="3"
											aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-7 padding-right-45">
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div style="left: -120px" class="index-seller item  active ">
									<div style="top: -2px"
										class="index-seller-main position-absolute">
										<img style="z-index: 5; width: 833px"
											src="https://d2v80xjmx68n4w.cloudfront.net/assets/images/desktop/main_top_picture_2.png"
											alt="사진 &amp; 영상촬영">
									</div>
									<div style="right: -200px;"
										class="index-seller-information bottom-10">
										<ul class="font-size-h6">
											<li class="font-size-h5 NGB font-color-base">사진 &amp;
												영상촬영</li>
											<li>₩ 240,000</li>
											<li class="margin-top-5"><i
												class="fa fa-check check-thin-navy" aria-hidden="true"></i>
												촬영매수: 300컷</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 작업일: 2일</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 제공방식: 원본 + 보정</li>
										</ul>
										<h6 class="text-left color-brown opacity-half">by
											part1256</h6>
									</div>
								</div>




								<div class="index-seller item  ">
									<div class="index-seller-main position-absolute right-0">
										<img style="z-index: 5; width: 580px"
											src="https://d2v80xjmx68n4w.cloudfront.net/assets/images/desktop/main_top_programming_1.png"
											alt="프로그래밍">
									</div>
									<div style="right: -40px"
										class="index-seller-information bottom-25">
										<ul class="font-size-h6">
											<li class="font-size-h5 NGB font-color-base">웹사이트 개발</li>
											<li>₩ 290,000</li>
											<li class="margin-top-5"><i
												class="fa fa-check check-thin-navy" aria-hidden="true"></i>
												페이지수: 7 페이지</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 플러그인설치: 2개</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 작업일: 5일</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 내부 구매전환 데이터 측정</li>
										</ul>
										<h6 style="left: -305px"
											class="text-left color-brown position-absolute opacity-half bottom-25">by
											fortune4123</h6>
									</div>
								</div>



								<div class="index-seller item  ">
									<div class="index-seller-main position-absolute left-40">
										<img style="z-index: 5;"
											src="https://d2v80xjmx68n4w.cloudfront.net/assets/images/desktop/main_top_package_2.png"
											alt="패키지 디자인">
									</div>
									<div style="right: -20px !important;"
										class="index-seller-information right-0 bottom-20">
										<ul class="font-size-h6">
											<li class="font-size-h5 NGB font-color-base">패키지 디자인</li>
											<li>₩ 120,000</li>
											<li class="margin-top-5"><i
												class="fa fa-check check-thin-navy" aria-hidden="true"></i>
												시안갯수: 2개</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 작업일: 10일</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 수정횟수: 2회</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 인쇄 최적화 파일 제공</li>
										</ul>
										<h6 class="text-left color-brown opacity-half">by 삼우디자인</h6>
									</div>
								</div>

								<div class="index-seller item ">
									<div class="index-seller-main position-absolute top-0 left-40">
										<img style="z-index: 5; width: 500px"
											src="https://d2v80xjmx68n4w.cloudfront.net/assets/images/desktop/main_top_logo_1.png"
											alt="로고 디자인">
									</div>
									<div style="right: -25px"
										class="index-seller-information bottom-40">
										<ul class="font-size-h6">
											<li class="font-size-h5 NGB font-color-base">로고 + 명함디자인</li>
											<li>₩ 430,000</li>
											<li class="margin-top-5"><i
												class="fa fa-check check-thin-navy" aria-hidden="true"></i>
												시안 갯수: 1개</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 작업일: 9일</li>
											<li><i class="fa fa-check check-thin-navy"
												aria-hidden="true"></i> 아이디어 소통</li>
										</ul>
									</div>
									<div class="position-absolute bottom-5" style="left: 120px;">
										<h6 class="color-brown opacity-half">by 2gunhang</h6>
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="margin-top-60">
			<div class="container">
				<div id="rootCategoryContainer" class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12">
								<h2 class="header-margin-none">
									<b>카테고리</b>
								</h2>
							</div>
						</div>
						<div
							class="category-wrapper row margin-top-20 margin-left-0 margin-right-0">
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/1"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 1', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_1.png?v=1.4"
											alt="디자인 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(0).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/6"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 6', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_6.png?v=1.4"
											alt="IT &amp; 프로그래밍 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(1).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/7"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 7', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_7.png?v=1.4"
											alt="컨텐츠 제작 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(2).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/2"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 2', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_2.png?v=1.4"
											alt="마케팅 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(3).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/3"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 3', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_3.png?v=1.4"
											alt="번역 &amp; 통역 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(4).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/4"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 4', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_4.png?v=1.4"
											alt="문서작성 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(5).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/9"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 9', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_9.png?v=1.4"
											alt="상담 &amp; 컨설팅 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(6).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/10"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 10', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_10.png?v=1.4"
											alt="레슨 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(7).c_group }</h5>
									</div>
								</a>
							</div>
							<div class="col-xs-3 category-item padding-side-0 index-category">
								<a class="plain" href="https://kmong.com/category/11"
									onclick="sendGAEvent('main', '기본 - 카테고리 - 11', kmongCurrentPath);">
									<div class="padding-all-20 text-center">
										<img class="width-40px" src="css/image/ic_category_11.png?v=1.4"
											alt="핸드메이드 카테고리 아이콘">
										<h5 class="margin-bottom-0">${categoryList.get(8).c_group }</h5>
									</div>
								</a>
							</div>
							<div
								class="col-xs-3 category-item padding-side-0 bg-color-e6 opacity-half">
								<div
									class="padding-left-20 padding-right-20 padding-bottom-40 padding-top-40 text-center">
									<h5 class="margin-bottom-0 font-color-lighter">Coming Soon</h5>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="row">
					<div class="col-xs-12">
						<div class="row margin-top-50">
							<div class="col-xs-12">
								<h2 class="header-margin-none">
									<b>이달의 인기키워드</b>
								</h2>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<div class="index-slide-arrow overflow-hidden">
									<img
										class="specialGigSliderLeft width-15px pull-left cursor disabled"
										src="css/image/index_arrow_left.png" style="display: none;"
										alt="arrow left"> <img
										class="specialGigSliderRight width-15px pull-right cursor"
										src="css/image/index_arrow_right.png" alt="arrow right">
								</div>


								<div class="row">
									<div class="col-xs-12">
										<div class="fSliderWrapper">
											<div id="specialGigSlider" class="fSlider"
												style="height: 275px; width: 100%;">
												<div class="fSliderTrack"
													style="width: 1446.98px; left: 0px;">
													<div
														class="inline-block padding-side-0  margin-right-10  sliderItem current"
														style="width: 220px;">
														<a href="https://kmong.com/category/1004"
															onclick="sendGAEvent('main', '인기키워드 - #미술&amp;공예 레슨', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#미술&amp;공예 레슨</h2>
																<img class="width-100"
																	src="css/image/drawing_lesson.png?v=1.1"
																	alt="#미술&amp;공예 레슨 - 똥손이 금손되는 시간!">
															</div>
														</a>
													</div>
													<div
														class="inline-block padding-side-0  margin-right-10  sliderItem"
														style="width: 220px;">
														<a href="https://kmong.com/category/501"
															onclick="sendGAEvent('main', '인기키워드 - #사업계획서&amp;제안서', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#사업계획서&amp;제안서</h2>
																<img class="width-100"
																	src="css/image/business_plan.png?v=1.1"
																	alt="#사업계획서&amp;제안서 - 투자를 부르는 작성 노하우는?">
															</div>
														</a>
													</div>
													<div
														class="inline-block padding-side-0  margin-right-10  sliderItem"
														style="width: 220px;">
														<a href="https://kmong.com/category/217"
															onclick="sendGAEvent('main', '인기키워드 - #카페&amp;블로그', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#카페&amp;블로그</h2>
																<img class="width-100" src="css/image/cafe_n_blog.png?v=1.1"
																	alt="#카페&amp;블로그 - 입소문은 손님을 싣고~">
															</div>
														</a>
													</div>
													<div
														class="inline-block padding-side-0  margin-right-10  sliderItem"
														style="width: 220px;">
														<a href="https://kmong.com/category/203"
															onclick="sendGAEvent('main', '인기키워드 - #SNS광고', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#SNS광고</h2>
																<img class="width-100" src="css/image/sns.png?v=1.1"
																	alt="#SNS광고 - 저비용으로 고효율 광고하기">
															</div>
														</a>
													</div>
													<div
														class="inline-block padding-side-0  margin-right-10  sliderItem"
														style="width: 220px;">
														<a href="https://kmong.com/category/101"
															onclick="sendGAEvent('main', '인기키워드 - #로고디자인', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#로고디자인</h2>
																<img class="width-100" src="css/image/logo_design.png?v=1.1"
																	alt="#로고디자인 - 전문 디자이너에게 맡겨보세요">
															</div>
														</a>
													</div>
													<div class="inline-block padding-side-0  sliderItem"
														style="width: 220px;">
														<a href="https://kmong.com/category/724"
															onclick="sendGAEvent('main', '인기키워드 - #사진&amp;영상촬영', kmongCurrentPath);">
															<div class="position-relative">
																<h2
																	class="position-absolute color-white header-margin-none"
																	style="top: 25px; left: 20px; opacity: 0.9;">
																	#사진&amp;영상촬영</h2>
																<img class="width-100" src="css/image/picture.png?v=1.1"
																	alt="#사진&amp;영상촬영 - 상품을 맛있게 담아드립니다">
															</div>
														</a>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div
			class="padding-top-50 padding-bottom-50 margin-top-50 bg-color-gray">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-4 padding-side-0 text-center">
										<h3 class="NGB margin-top-0">전문적인 서비스</h3>
										<h5 class="line-height margin-bottom-0">
											각 분야 전문가 <b>98,151명</b>의 <br>차별화된 서비스를 이용해보세요.
										</h5>
									</div>
									<div class="col-xs-4 padding-side-0 text-center">
										<h3 class="NGB margin-top-0">만족도 높은 결과물</h3>
										<h5 class="line-height margin-bottom-0">
											의뢰인 평점 <b>98%</b>에 달하는 <br>정확하고 만족도 높은 서비스를 경험해보세요.
										</h5>
									</div>
									<div class="col-xs-4 padding-side-0 text-center">
										<h3 class="NGB margin-top-0">안전한 거래 시스템</h3>
										<h5 class="line-height margin-bottom-0">
											<b>538,175건</b>의 거래를 완료한 <br>안전한 주문 시스템을 이용해보세요.
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="margin-top-55">
			<div class="container padding-bottom-35">

				<div id="myCarousel" class="carousel slide" data-ride="carousel">

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div
							class="item panel panel-default border-radius-0 margin-none position-relative active">
							<div class="row">
								<div
									class="col-xs-5 padding-right-0 position-relative overflow-hidden">

									<a class="index-buyer-images" href="javascript:void(0);"
										onclick="sendGAEvent('main', '동영상 재생 - 1', kmongCurrentPath); openVideoModal('first')">
										<div class="position-relative">
											<img class="width-100" src="css/image/buyer_review_1.png"
												alt="전문가 동영상">
										</div>
									</a>
								</div>
								<div class="col-xs-7 padding-left-0">
									<div class="buyer-video-text">
										<h2
											class="padding-left-50 margin-bottom-0 margin-top-10 color-e6"
											style="font-size: 50px !important;">“</h2>
										<h4
											class="text-center text-style margin-none padding-left-60 padding-right-60"
											style="height: 110px">
											장사하기 바빠서 마케팅에 신경 쓸 여유가 많이 없는데,<br> 크몽은 가격도 저렴하고 효과도 좋아서
											종종 이용하고 있습니다.<br> 다른 사람들한테 소개하기 좀 아까울 정도로 좋은 사이트예요!
										</h4>
										<h2 class="padding-right-50 margin-top-10 text-right color-e6"
											style="font-size: 50px !important;">”</h2>
										<h5 class="text-center margin-top-0 margin-bottom-5">
											<b>최규태님</b>
										</h5>
										<h6 class="header-margin-none text-center">와인바 대표</h6>
									</div>
								</div>
							</div>
						</div>
						<div
							class="item panel panel-default border-radius-0 margin-none position-relative">
							<div class="row">
								<div
									class="col-xs-5 padding-right-0 position-relative overflow-hidden">
									<a class="index-buyer-images" href="javascript:void(0);"
										onclick="sendGAEvent('main', '동영상 재생 - 2', kmongCurrentPath);openVideoModal('second')">
										<div class="position-relative">
											<img class="width-100" src="css/image/buyer_review_2.png"
												alt="전문가 동영상">
										</div>
									</a>
								</div>
								<div class="col-xs-7 padding-left-0">
									<div class="buyer-video-text">
										<h2
											class="padding-left-50 margin-bottom-0 margin-top-10 color-e6"
											style="font-size: 50px !important;">“</h2>
										<h4
											class="text-center text-style margin-none padding-left-60 padding-right-60"
											style="height: 110px">그냥 한 번 들어나보자 하는 마음으로 구매했던 건데, 생각보다
											많은 조언을 들을 수 있었습니다. 실시간으로 메시지가 바로바로 되니까 미팅 장소, 날짜 잡기도 수월했습니다.
											앞으로는 창업해서 멘티가 아닌 멘토로서 활동해보고 싶네요!</h4>
										<h2 class="padding-right-50 margin-top-10 text-right color-e6"
											style="font-size: 50px !important;">”</h2>
										<h5 class="text-center margin-top-0 margin-bottom-5">
											<b>김우진님</b>
										</h5>
										<h6 class="header-margin-none text-center">창업 준비생</h6>
									</div>
								</div>
							</div>
						</div>
						<div
							class="item panel panel-default border-radius-0 margin-none position-relative">
							<div class="row">
								<div
									class="col-xs-5 padding-right-0 position-relative overflow-hidden">
									<a class="index-buyer-images" href="javascript:void(0);"
										onclick="sendGAEvent('main', '동영상 재생 - 3', kmongCurrentPath); openVideoModal('third')">
										<div class="position-relative">
											<img class="width-100" src="css/image/buyer_review_3.png"
												alt="전문가 동영상">
										</div>
									</a>
								</div>
								<div class="col-xs-7 padding-left-0">
									<div class="buyer-video-text">
										<h2
											class="padding-left-50 margin-bottom-0 margin-top-10 color-e6"
											style="font-size: 50px !important;">“</h2>
										<h4
											class="text-center text-style margin-none padding-left-60 padding-right-60"
											style="height: 110px">
											홈페이지 제작이 필요해서 크몽 처음 써봤어요.<br> 상세페이지에 경력이랑 포트폴리오가 잘 정리되어
											있어서 좋은 작업자분 만날 수 있었던 것 같아요~ 나름대로 큰 돈 쓴거라 걱정이 많았는데, 크몽 덕분에
											안전하게 거래가 끝났어요!
										</h4>
										<h2 class="padding-right-50 margin-top-10 text-right color-e6"
											style="font-size: 50px !important;">”</h2>
										<h5 class="text-center margin-top-0 margin-bottom-5">
											<b>황아영님</b>
										</h5>
										<h6 class="header-margin-none text-center">쇼핑몰 대표 겸 모델</h6>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

				<div class="row margin-top-60">
					<div class="col-xs-12 text-center">
						<h2 class="header-margin-none">
							<b>전문가 랭킹 </b>
						</h2>
						<h5>크몽에서 가장 많이 판매한 인기 전문가</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 padding-side-25">
						<div class="row">


							<c:forEach var="masterRankList" items="${ masterRankList}">
								<div class="col-xs-4 padding-side-5">
									<div
										class="panel panel-default position-relative index-ranking margin-bottom-0 border-radius-0 margin-top-10">
										<a class="plain" href="#">
											<div class="row">
												<div class="col-xs-5 padding-right-0">
													<div style="height: 128px; overflow: hidden">
														<img class="width-100"
															src="css/image/${masterRankList.m_profile }" alt="전문가 랭킹">
													</div>
												</div>
												<div class="col-xs-6 padding-right-0">
													<h5 class="font-color-light margin-top-15">총 판매금액</h5>
													<h3 class="margin-none">
														<b>₩${masterRankList.total_price }</b>
													</h3>
													<h6
														class="margin-top-40 margin-bottom-0 font-color-lighter">${masterRankList.m_name }</h6>
												</div>
											</div> <img class="index-ranking-number"
											src="css/image/ranking_${masterRankList.rownum }.png"
											alt="전문가 랭킹 순위">
										</a>
									</div>
								</div>
							</c:forEach>

							<div class="col-xs-4 padding-side-5  position-relative">
								<div
									class="padding-bottom-35 padding-top-35 text-center margin-top-10 border-dashed index-ranking-hover">
									<a href="https://kmong.com/seller/become_a_seller"
										class="plain font-color-light"
										onclick="sendGAEvent('main', '판매자 랭킹 - 서비스 등록', kmongCurrentPath);">
										<div class="row">
											<div class="col-xs-12">
												<h5 class="margin-none line-height font-color-lighter">
													서비스를 등록하여 <br> 전문가 랭킹에 도전하세요!
												</h5>
												<h5 class="margin-bottom-0 margin-top-5">
													<b class="font-color-light">+ 서비스 등록하기</b>
												</h5>
											</div>
										</div>
									</a>
								</div>
								<div id="newSellerMileageWrapper"
									class="new-member-mileage text-center bg-color-yellow-400 color-brown font-size-h6">
									<div class="position-absolute top-0 right-5 cursor">
										<img class="width-10px" src="css/image/index_seller_close.png"
											onclick="$('#newSellerMileageWrapper').fadeOut(300);"
											alt="마일리지 닫기 ">
									</div>
									신규 등록 시 <b>50,000</b>마일리지 지급
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

	<input type="file" multiple="multiple" class="dz-hidden-input"
		style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">


	<div id="criteo-tags-div" style="display: none;"></div>


</body>
</html>