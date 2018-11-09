<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 28. - 오후 3:15:17</title>

<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#quickMenuTop").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});


	});
	
</script>


</head>
<body id="master_body">
	<header>
		<nav id="KmongNavBar" class="navbar navbar-fixed-top"
			style="z-index: 99; display: block;">
			<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>
			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
		</nav>
	</header>
	<div class="fake_global_body"></div>
	<div class="global-body">
		

			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>

		<div id="ad_request">
			<div class="container ad-request-bg">
				<div class="row">
					<div class="col-xs-12">
						<ul
							class="adNaviList list-inline padding-bottom-0 margin-bottom-0">
							<li class="margin-right-10"><a
								class="ad-request-nav naviHeader color-base ad-request-active"
								data-target="position">노출위치</a></li>

							<li class="margin-right-10"><a
								class="ad-request-nav naviHeader font-color-lighter"
								data-target="price">상품가격</a></li>

							<li class="margin-right-10"><a
								class="ad-request-nav naviHeader font-color-lighter"
								data-target="effect">광고효과</a></li>

							<li class="margin-right-10"><a
								class="ad-request-nav naviHeader font-color-lighter"
								data-target="howto">구매방법</a></li>

							<li class="pull-right margin-top-5"><a
								class="btn btn-primary btn-xss btn-block"
								href="order_advertisement_gig.do"> <i class="fa fa-check">&nbsp;</i>광고신청
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="ad-request-trick-yellow overflow-hidden">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 position-relative">
							<div class="ad-request-main">
								<img src="css/image/ad_top_right2.png?1.1" title="플러스광고">
								<div class="bg-color-gray ad-request-trick-gray"></div>
							</div>

						</div>
					</div>
					<h1 class="margin-top-100">
						전문가님, <br> <b>광고</b>를 통한 <b>수익 증가</b>를<br> 경험해보세요!
					</h1>
					<h3 class="text-style margin-top-80">
						<span class="font-size-h2"><b>ㅡ</b></span><br> 대한민국 N0.1 서비스
						마켓플레이스 크몽 <br> 마켓 점유율 1위! 전문가 만족도 1위

					</h3>
				</div>
			</div>
			<div class="container position-relative" id="position"
				style="top: -45px;">
				<div class="row text-center">
					<h1 class="font-size-40">01</h1>
					<h2 class="NGB margin-top-0">광고는 어디에 노출되나요 ?</h2>
					<h3>광고 상품 구매 시 4가지 위치 모두에 동시노출 됩니다.</h3>
				</div>
				<div class="row margin-top-50 text-center">
					<div class="col-xs-6">
						<img class="ad-request-step" src="css/image/ad_step_01.png?1.1"
							title="메인페이지">
						<h3 class="NGB margin-top-30">01. 메인페이지</h3>
						<h4 class="text-style">로그인 이 후 메인 페이지 중앙에 위치하는 광고로써, 주목도가 가장
							높습니다.</h4>
					</div>
					<div class="col-xs-6">
						<img class="ad-request-step" src="css/image/ad_step_02.png?1.1"
							title="카테고리 리스트">
						<h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
						<h3 class="NGB margin-top-0">02. 카테고리 리스트</h3>
						<h4 class="text-style">
							카테고리 리스트 상단에 위치하는 광고로써,<br>해당 카테고리를 선택한 타겟 의뢰인들에게 <br>
							가장 먼저 소개될 수 있습니다.
						</h4>
					</div>
				</div>
				<div class="row margin-top-50 text-center">
					<div class="col-xs-6">
						<img class="ad-request-step" src="css/image/ad_step_03.png?1.1"
							title="키워드 검색 리스트">
						<h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
						<h3 class="NGB margin-top-0">03. 키워드 검색 리스트</h3>
						<h4 class="text-style">
							검색 리스트 상단에 위치하는 광고로써, <br> 관련 검색어를 통해 유입된 의뢰인들에게 <br>
							가장 먼저 소개 될 수 있습니다.
						</h4>
					</div>
					<div class="col-xs-6">
						<img class="ad-request-step" src="css/image/ad_step_04.png?1.1"
							title="키워드 검색 리스트">
						<h5 class="NGB color-danger margin-top-30">(100% 노출 보장)</h5>
						<h3 class="NGB margin-top-0">04. 모바일페이지</h3>
						<h4 class="text-style">
							모바일 메인 + 카테고리 리스트 + 키워드 검색 리스트 <br> 상단에 노출됩니다.
						</h4>
					</div>
				</div>
			</div>
			<div>
				<img class="width-100" src="css/image/ad_cross.png?1.1">
			</div>
			<div class="bg-color-yellow-400">
				<div class="container position-relative ad-title-up" id="price">
					<div class="row">
						<div class="row text-center">
							<h1 class="font-size-40">02</h1>
							<h2 class="NGB margin-top-0">광고 상품에는 어떤 것들이 있나요 ?</h2>
						</div>
					</div>
					<div class="row margin-top-70 text-center">
						<div class="col-xs-12 position-relative">
							<img src="css/image/ad_request_plus_gig.png?1.1" title="일반형">
							<div class="ad-request-pay text-center">
								<h2 class="margin-bottom-0 margin-top-30 font-color-lighter">
									- 플러스광고 1주일기준 -</h2>
								<div class="ad-request-pay-title margin-top-30 color-red">
									99,000 원</div>
							</div>
						</div>
						<div class="col-xs-12 margin-top-30">
							<img src="css/image/ad_request_premium_gig_ver2.png?1.1"
								title="프리미엄형">
							<div class="ad-request-pay text-center">
								<h2 class="margin-bottom-0 margin-top-30 font-color-lighter">
									- 프리미엄광고 1주일기준 -</h2>
								<div class="ad-request-pay-title margin-top-30 color-red">
									499,000 원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<img class="width-100" src="css/image/ad_cross_bottom.png?1.1">
			</div>
			<div class="container position-relative ad-title-up" id="effect">
				<div class="row">
					<div class="row text-center">
						<h1 class="font-size-40">03</h1>
						<h2 class="NGB margin-top-0">광고 효과는 좋은가요 ?</h2>
						<h4 class="text-style">광고 전과 후의 놀라운 수익금 차이, 직접 경험한 전문가님들의 후기를
							통해서도 확인할 수 있습니다.</h4>
					</div>
				</div>
				<div class="row margin-top-70 text-center">
					<div class="col-xs-6">
						<div class="panel panel-default">
							<div class="panel-body">
								<img src="css/image/ad_gra_01.jpg?1.1" title="만족도조사">
							</div>
						</div>

					</div>
					<div class="col-xs-6">
						<div class="panel panel-default">
							<div class="panel-body">
								<img src="css/image/ad_gra_02.jpg?1.1" title="수익금효과">
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center margin-top-40">
					<div class="col-xs-4">
						<img src="css/image/ad_pro_sens.png?1.1" title="플러스광고 효과로 인한 수익금">
						<h5 class="NGB font-color-lighter margin-top-15">쎈쓰박 님
							(로고디자이너)</h5>
						<h4 class="NGB text-style margin-top-20">
							광고 신청한 뒤로 단골 의뢰인분들도 생기고 <br> 거래량이 확실히 늘었어요.
						</h4>
					</div>
					<div class="col-xs-4">
						<img src="css/image/ad_pro_adfinder.png?1.1" title="플러스광고 효과로 인한 수익금">
						<h5 class="NGB font-color-lighter margin-top-15">애드파인더 님
							(광고효과 상승 전문가)</h5>
						<h4 class="NGB text-style margin-top-20">
							고민하다가 광고 신청한건데, <br> 확실히 문의건이랑 거래 건이 늘었네요!.
						</h4>
					</div>
					<div class="col-xs-4">
						<img src="css/image/ad_pro_hand.png?1.1" title="플러스광고 효과로 인한 수익금">
						<h5 class="NGB font-color-lighter margin-top-15">weeklyccy 님
							(핸드메이드 디자이너)</h5>
						<h4 class="NGB text-style margin-top-20">
							광고 이후에도 한동안은 <br> 의뢰인분들 소개로 또 다른 거래가 생겨 <br> 수익이 유지가 되는
							것 같아요.
						</h4>
					</div>
				</div>
			</div>
			<div>
				<img class="width-100" src="css/image/ad_cross.png?1.1">
			</div>
			<div class="bg-color-yellow-400">
				<div class="container position-relative ad-title-up" id="howto">
					<div class="row">
						<div class="row text-center">
							<h1 class="font-size-40">04</h1>
							<h2 class="NGB margin-top-0">광고는 어떻게 구매하나요 ?</h2>
							<h4 class="text-style">승인이 완료되어 판매 중인 서비스만 있다면, 간단하게 광고를 구매
								할 수 있습니다.</h4>
						</div>
					</div>
					<div class="row margin-top-70 text-center">
						<div class="col-xs-12">
							<img src="css/image/buy_how.png?1.1" title="광고구매 방법">
						</div>
					</div>
				</div>
			</div>
			<div class="ad-request-arrow"></div>
			<div class="container">
				<div class="row text-center margin-top-50">
					<div class="col-xs-4"></div>
					<div class="col-xs-4">
						<a href="order_advertisement_gig.do"
							class="btn btn-primary btn-block"><span class="font-size-h3">광고
								신청 하러 가기</span></a>
					</div>
					<div class="col-xs-4"></div>
				</div>
			</div>
		</div>
		<!-- 하단 -->


		<script>
			var $naviHeader = $('.naviHeader');

			$(document)
					.ready(
							function() {

								$naviHeader
										.click(function() {
											$naviHeader
													.removeClass('ad-request-active');
											$naviHeader
													.each(function(index, value) {
														if ($(value).hasClass(
																'color-base')) {
															$(value)
																	.removeClass(
																			'color-base')
																	.addClass(
																			'font-color-lighter');
														}
													});
											$(this)
													.addClass(
															'ad-request-active')
													.removeClass(
															'font-color-lighter')
													.addClass('color-base');
											var target = $(this).data('target');
											$('html, body')
													.animate(
															{
																scrollTop : $('#'
																		+ target)[0].offsetTop - 200
															}, 500);
										});

								$(window)
										.scroll(
												function() {
													var windowScroll = $(this)
															.scrollTop()
													var position = $(
															'#position')
															.offset().top - 200;
													var price = $('#price')
															.offset().top - 230;
													var effect = $('#effect')
															.offset().top - 230;
													var howto = $('#howto')
															.offset().top - 230;

													if (windowScroll > position
															&& windowScroll < price) {
														$naviHeader
																.removeClass(
																		'ad-request-active')
																.eq(0)
																.addClass(
																		'ad-request-active');
													} else if (windowScroll > price
															&& windowScroll < effect) {
														$naviHeader
																.removeClass(
																		'ad-request-active')
																.eq(1)
																.addClass(
																		'ad-request-active');
													} else if (windowScroll > effect
															&& windowScroll < howto) {
														$naviHeader
																.removeClass(
																		'ad-request-active')
																.eq(2)
																.addClass(
																		'ad-request-active');
													} else if (windowScroll > howto) {
														$naviHeader
																.removeClass(
																		'ad-request-active')
																.eq(3)
																.addClass(
																		'ad-request-active');
													}
												})
							})
		</script>
	</div>

	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

	
</body>
</html>