<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 2. 21. - 오후 7:37:01</title>

<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong-8888b96a4a.master_desktop.css"
	type="text/css">
<link rel="stylesheet" href="css/kmong_fonts.css" type="text/css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="common-b8e57eb3f0.js"></script>
<script src="kmon-03f7b7fa93click_event_stream.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<script type="text/javascript">
	$(document).ready(
			function() {

				$("#quickMenuTop").click(function() {
					$('html, body').animate({
						scrollTop : 0
					}, 400);
					return false;
				});

				$('#plusAdvertisementDisabledContainer').on('click',
						function() {
							//alert('플러스광고');
							$(this).hide();
							$(this).next().show();

							$(this).next().next().show();
							$(this).next().next().next().hide();

						});
				$('#premiumAdvertisementDisabledContainer').on('click',
						function() {
							//alert("프리미엄 광고");
							$(this).hide();
							$(this).next().show();
							$(this).prev().hide();
							$(this).prev().prev().show();
						});

				var maxmm = $("#inormm").attr('max');
				var tag = '<b>(' + maxmm + '원 사용가능)</b>';
				$('#havemileage').html(tag);
				$('#prhavemileage').html(tag);

				var totprice = 0;

				$('#inormm').keyup(
						function() {
							var n = $(this).val();
							//alert(maxmm);
							if (totprice == 0) {
								alert('광고기간을 선택해주세요');
								$(this).val("");
							} else if (0 <= n && n <= parseInt(maxmm)) {
								var tag2 = "<b>(" + (parseInt(maxmm) - n)
										+ "원 사용가능)</b>";
								$("#havemileage").html(tag2);
								var totprice2 = totprice;
								totprice2 = totprice2 - n
								//alert(totprice - n);
								var tothtml = "<i class='fa fa-krw'></i>&nbsp;"
										+ totprice2;
								$("#ortotprice").html(tothtml);

							} else {
								$(this).val(maxmm);
								var tag3 = '<b>(' + 0 + '원 사용가능)</b>';
								$("#havemileage").html(tag3);
								var tothtml = "<i class='fa fa-krw'></i>&nbsp;"
										+ (totprice - maxmm);
								$("#ortotprice").html(tothtml);
							}
						});
				$('#inprmm').keyup(
						function() {
							var n = $(this).val();
							//alert(n);
							if (totprice == 0) {
								alert('광고기간을 선택해주세요');
								$(this).val("");
							} else if (0 <= n && n <= parseInt(maxmm)) {
								var tag2 = "<b>(" + (parseInt(maxmm) - n)
										+ "원 사용가능)</b>";
								$("#prhavemileage").html(tag2);
								var totprice2 = totprice;
								totprice2 = totprice2 - n
								var tothtml = "<i class='fa fa-krw'></i>&nbsp;"
										+ totprice2;
								$("#prtotprice").html(tothtml);

							} else {
								$(this).val(maxmm);
								var tag3 = '<b>(' + 0 + '원 사용가능)</b>';
								$("#prhavemileage").html(tag3);
								var tothtml = "<i class='fa fa-krw'></i>&nbsp;"
										+ (totprice - maxmm);
								$("#prtotprice").html(tothtml);
							}
						});
				$('#orangePrice').change(function() {
					totprice = $(this).val() * 99000;
					var adprice = "<i class='fa fa-krw'></i>&nbsp;" + totprice;
					$("#orprice").html(adprice);
					$("#ortotprice").html(adprice);
					var tag2 = "<b>(" + parseInt(maxmm) + "원 사용가능)</b>";
					$("#havemileage").html(tag2);
					$("#inormm").val("");
				});
				$('#pselect').change(function() {
					totprice = $(this).val();
					var adprice = "<i class='fa fa-krw'></i>&nbsp;" + totprice;
					$("#pprice").html(adprice);
					$("#prtotprice").html(adprice);
					var tag2 = "<b>(" + parseInt(maxmm) + "원 사용가능)</b>";
					$("#prhavemileage").html(tag2);
					$("#inprmm").val("");
				});

			});
</script>

</head>
<body id="master_body">


	<nav id="KmongNavBar" class="navbar navbar-fixed-top"
		style="z-index: 99; display: block;">
		<div class="header-yellow bg-color-yellow-400">
			<div class="container">

				<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			</div>
		</div>
		<div id="indexCategoryHeader"
			class="bg-color-white border-bottom-solid">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
						<ul class="list-inline margin-none">
							<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</nav>


	<div class="fake_global_body"></div>
	<div class="global-body">


		<script>
			var $globalBody = $('.global-body');

			if ($('#penaltyDetailBanner').length > 0) {
				$('#kmongNavBar').css('margin-top',
						$('#penaltyDetailBanner').height() + 'px');
				$('#penaltyDetailBanner').css({
					'position' : 'fixed',
					'top' : 0,
					'z-index' : 100
				});
			}
		</script>

			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>
	</div>


	<div id="advertisementForm" class="container">
		<div class="col-xs-1">&nbsp;</div>
		<div class="col-xs-10">
			<div class="row margin-top-50">
				<div class="col-xs-9">
					<h2 class="margin-all-0">
						<b>광고신청</b>
					</h2>
				</div>
				<div class="col-xs-3 margin-top-5 text-right">
					<a href="ad_request.do"> <i class="fa fa-bullhorn"
						aria-hidden="true"></i> <span class="text-underline">광고 상품
							자세히보기</span>
					</a>
				</div>
			</div>
			<div class="row margin-top-30">



				<div id="plusAdvertisementDisabledContainer"
					class="col-xs-6 padding-left-10 position-relative advertisementDisabledContainer"
					data-ad-type="plus">
					<div
						class="panel bg-color-lighter margin-all-0 padding-bottom-50 border-radius-none">
						<div
							class="panel-body padding-top-30 text-center color-white position-relative">
							<div class="NGB" style="font-size: 36px;">플러스 광고</div>
							<div class="NGB" style="font-size: 23px;">&nbsp;</div>
							<div class="plus-flag">
								<img src="css/image/plus_black.png">
							</div>
						</div>
					</div>
					<div
						class="panel panel-default padding-top-40 border-radius-none margin-bottom-0 ad-border position-relative margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 position-relative">
									<div
										class="panel panel-default border-radius-none advertisment-info">
										<div
											class="panel-body padding-left-10 padding-right-10 padding-top-10 padding-bottom-10">
											<ul
												class="list-unstyled padding-left-0 margin-bottom-0 font-color-light">
												<li class="padding-all-0">• 신청가능 갯수 : 무제한 (랜덤노출)</li>
												<li class="padding-all-0">• 노출위치 : 메인화면,카테고리 리스트
													상단,검색리스트 상단</li>
												<li class="padding-all-0">• 프리미엄광고와 중복으로 구매할 수 있습니다.</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-xs-12">
									<h4 class="margin-top-0 margin-bottom-10">
										<b>서비스 선택</b>
									</h4>
									<div class="form-group">
										<select
											class="form-control input-sm padding-top-10 padding-bottom-10"
											disabled="">
											<option>선택해주세요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<h4 class="margin-all-0">
										<b>광고기간 선택</b>
									</h4>
									<div class="form-group margin-top-10">
										<select
											class="form-control input-sm padding-top-10 padding-bottom-10"
											disabled="">
											<option>선택해주세요</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="panel border-solid bg-color-fa border-radius-none margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<h5 class="margin-all-0">광고 금액</h5>
								</div>
								<div class="col-xs-6 text-right">
									<h5 class="margin-all-0">
										<i class="fa fa-krw"></i>&nbsp;0
									</h5>
								</div>
							</div>
							<div class="row margin-top-10">
								<div class="col-xs-8">
									<h5>
										전문가 마일리지 <span class="font-size-h6 margin-left-5"
											style="display: none"><b>(0원 사용가능)</b></span>
									</h5>
								</div>
								<div class="col-xs-4 padding-left-0 text-right">
									<div class="form-group">
										<span class="margin-left-10 pull-left margin-top-5"><i
											class="fa fa-krw"></i></span> <input type="text" name=""
											class="form-control input-xs width-80px inline-block"
											"
												disabled="">
									</div>

								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<div class="ad-border-dashed"></div>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-6">
									<h4 class="margin-all-0">
										<b>총 결제금액</b>
									</h4>
								</div>
								<div class="col-xs-6 text-right">
									<h3 class="margin-all-0 color-primary NGB">
										<i class="fa fa-krw"></i>&nbsp;0
									</h3>
									<h6 class="margin-top-5">(VAT 포함)</h6>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-12">
									<a href="javascript:void(0);" class="btn btn-primary width-100"
										disabled="">광고신청</a>
								</div>
							</div>
						</div>
					</div>

					<a class="plain" href="javascript:void(0);">
						<div class="row advertisement-transparent-body">
							<div class="col-xs-12"></div>
						</div>
					</a>
				</div>



				<div class="col-xs-6 padding-left-10" style="display: none">
					<div
						class="panel bg-banner-orang margin-all-0 padding-bottom-50 border-radius-none">
						<div
							class="panel-body padding-top-30 text-center color-white position-relative">
							<div class="NGB" style="font-size: 36px;">플러스 광고</div>
							<div class="NGB" style="font-size: 23px;">&nbsp;</div>
							<div class="plus-flag">
								<img src="css/image/plus_color.png">
							</div>
						</div>
					</div>
					<div
						class="panel panel-default padding-top-40 border-radius-none margin-bottom-0 ad-border position-relative margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 position-relative">
									<div
										class="panel panel-default border-radius-none advertisment-info">
										<div
											class="panel-body padding-left-10 padding-right-10 padding-top-10 padding-bottom-10">
											<ul
												class="list-unstyled padding-left-0 margin-bottom-0 font-color-light">
												<li class="padding-all-0">• 신청가능 갯수 : 무제한 (랜덤노출)</li>
												<li class="padding-all-0">• 노출위치 : 메인화면,카테고리 리스트
													상단,검색리스트 상단</li>
												<li class="padding-all-0">• 프리미엄광고와 중복으로 구매할 수 있습니다.</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<h4 class="margin-top-0 margin-bottom-10">
										<b>서비스 선택</b>
									</h4>
									<div class="form-group">
										<select id="svSelect"
											class="form-control input-sm padding-top-10 padding-bottom-10">
											<c:forEach var="serviceList" items="${myServiceNameList }">
												<c:choose>
													<c:when test="${empty serviceList }">
														<option>선택해주세요</option>
													</c:when>
													<c:when test="${not empty serviceList }">
														<option value="${serviceList.t_seq }">${serviceList.t_name }</option>
													</c:when>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<h4 class="margin-all-0">
										<b>광고기간 선택</b>
									</h4>
									<div class="form-group margin-top-10">
										<select id="orangePrice"
											class="form-control input-sm padding-top-10 padding-bottom-10">
											<option value="">선택해주세요</option>
											<option value="3">플러스광고 1주</option>
											<option value="4">플러스광고 2주</option>
											<option value="6">플러스광고 4주</option>
											<option value="7">플러스광고 8주</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="panel border-solid bg-color-light-yellow border-radius-none margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<h5 class="margin-all-0">광고 금액</h5>
								</div>
								<div class="col-xs-6 text-right">
									<h5 id="orprice" class="margin-all-0">
										<i class="fa fa-krw"></i>&nbsp;0
									</h5>
								</div>
							</div>








							<div class="row margin-top-10">
								<div class="col-xs-8">
									<h5>
										전문가 마일리지 <span id="havemileage"
											class="font-size-h6 margin-left-5"></span>
									</h5>
								</div>
								<div class="col-xs-4 padding-left-0 text-right">

									<div class="form-group">
										<span class="margin-left-10 pull-left margin-top-5"><i
											class="fa fa-krw"></i></span> <input id="inormm" type="text"
											class="form-control input-xs width-80px inline-block"
											max="${masterMileage }">
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<div class="ad-border-dashed"></div>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-6">
									<h4 class="margin-all-0">
										<b>총 결제금액</b>
									</h4>
								</div>
								<div class="col-xs-6 text-right">
									<h3 id="ortotprice" class="margin-all-0 color-primary NGB">
										<i class="fa fa-krw"></i>&nbsp;499,000
									</h3>
									<h6 class="margin-top-5">(VAT 포함)</h6>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-12">
									<button class="orderAdvertisementBtn btn btn-primary btn-block">광고신청</button>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div id="premiumAdvertisementDisabledContainer"
					class="col-xs-6 padding-right-10 position-relative advertisementDisabledContainer"
					data-ad-type="premium" style="display: none;">
					<div
						class="panel bg-color-lighter margin-all-0 padding-bottom-50 border-radius-none">
						<div
							class="panel-body padding-top-30 text-center color-white position-relative">
							<div class="NGB" style="font-size: 36px;">프리미엄 광고</div>
							<div class="NGB" style="font-size: 23px;">(1+1 이벤트)</div>
							<div class="premium-flag">
								<img src="css/image/premium_black.png">
							</div>
						</div>
					</div>
					<div
						class="panel panel-default padding-top-40 border-radius-none margin-bottom-0 ad-border position-relative margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 position-relative">
									<div
										class="panel panel-default border-radius-none advertisment-info">
										<div
											class="panel-body padding-left-10 padding-right-10 padding-top-10 padding-bottom-10">
											<ul
												class="list-unstyled padding-left-0 margin-bottom-0 font-color-light">
												<li class="padding-all-0">• 1+1 이벤트는 18년 12월 31일 까지만
													한시적으로 진행됩니다.</li>
												<li class="padding-all-0">• 신청가능 갯수 : 무제한 (최상단 고정)</li>
												<li class="padding-all-0">• 노출위치 : 메인화면,카테고리 리스트
													상단,검색리스트 상단</li>
												<li class="padding-all-0">• 플러스광고와 중복으로 구매할 수 있습니다.</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<h4 class="margin-top-0 margin-bottom-10">
										<b>서비스 선택</b>
									</h4>


									<div class="form-group">
										<select
											class="form-control input-sm padding-top-10 padding-bottom-10"
											disabled="">
											<option>선택해주세요</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<h4 class="margin-all-0">
										<b>광고기간 선택</b>
									</h4>
									<div class="form-group margin-top-10">
										<select
											class="form-control input-sm padding-top-10 padding-bottom-10"
											disabled="">
											<option>선택해주세요</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="panel border-solid bg-color-fa border-radius-none margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<h5 class="margin-all-0">광고 금액</h5>
								</div>
								<div class="col-xs-6 text-right">
									<h5 class="margin-all-0">
										<i class="fa fa-krw"></i>&nbsp;0
									</h5>
								</div>
							</div>








							<div class="row margin-top-10">
								<div class="col-xs-8">
									<h5>
										전문가 마일리지 <span class="font-size-h6 margin-left-5"
											style="display: none"><b>(0원 사용가능)</b></span>
									</h5>
								</div>
								<div class="col-xs-4 padding-left-0 text-right">
									<div class="form-group">
										<span class="margin-left-10 pull-left margin-top-5"><i
											class="fa fa-krw"></i></span> <input type="text" name=""
											class="form-control input-xs width-80px inline-block"
											disabled="">
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<div class="ad-border-dashed"></div>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-6">
									<h4 class="margin-all-0">
										<b>총 결제금액</b>
									</h4>
								</div>
								<div class="col-xs-6 text-right">
									<h3 class="margin-all-0 color-primary NGB">
										<i class="fa fa-krw"></i>&nbsp;0
									</h3>
									<h6 class="margin-top-5">(VAT 포함)</h6>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-12">
									<a href="javascript:void(0);" class="btn btn-primary width-100"
										disabled="">광고신청</a>
								</div>
							</div>
						</div>
					</div>

					<a class="plain" href="javascript:void(0);">
						<div class="row advertisement-transparent-body">
							<div class="col-xs-12"></div>
						</div>
					</a>
				</div>





				<div class="col-xs-6 padding-right-10" style="">
					<div
						class="panel bg-banner-purple margin-all-0 padding-bottom-50 border-radius-none">
						<div
							class="panel-body padding-top-30 text-center color-white position-relative">
							<div class="NGB" style="font-size: 36px;">프리미엄 광고</div>
							<div class="NGB" style="font-size: 23px;">(1+1 이벤트)</div>
							<div class="premium-flag">
								<img src="css/image/premium_color.png">
							</div>
						</div>
					</div>
					<div
						class="panel panel-default padding-top-40 border-radius-none margin-bottom-0 ad-border position-relative margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 position-relative">
									<div
										class="panel panel-default border-radius-none advertisment-info">
										<div
											class="panel-body padding-left-10 padding-right-10 padding-top-10 padding-bottom-10">
											<ul
												class="list-unstyled padding-left-0 margin-bottom-0 font-color-light">
												<li class="padding-all-0">• 1+1 이벤트는 18년 12월 31일 까지만
													한시적으로 진행됩니다.</li>
												<li class="padding-all-0">• 신청가능 갯수 : 무제한 (최상단 고정)</li>
												<li class="padding-all-0">• 노출위치 : 메인화면,카테고리 리스트
													상단,검색리스트 상단</li>
												<li class="padding-all-0">• 플러스광고와 중복으로 구매할 수 있습니다.</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<h4 class="margin-top-0 margin-bottom-10">
										<b>서비스 선택</b>
									</h4>
									<div class="form-group">
										<select id="svSelect"
											class="form-control input-sm padding-top-10 padding-bottom-10">

											<c:forEach var="serviceList" items="${myServiceNameList }">
												<c:choose>
													<c:when test="${empty serviceList }">
														<option>선택해주세요</option>
													</c:when>
													<c:when test="${not empty serviceList }">
														<option value="${serviceList.t_seq }">${serviceList.t_name }</option>
													</c:when>
												</c:choose>
											</c:forEach>

										</select>
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<h4 class="margin-all-0">
										<b>광고기간 선택</b>
									</h4>
									<div class="form-group margin-top-10">
										<select id="pselect"
											class="form-control input-sm padding-top-10 padding-bottom-10">
											<option value="0">선택해주세요</option>
											<option value="499000">프리미엄광고 1+1주</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div
						class="panel border-solid bg-color-light-yellow border-radius-none margin-top-0">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<h5 class="margin-all-0">광고 금액</h5>
								</div>
								<div class="col-xs-6 text-right">
									<h5 id="pprice" class="margin-all-0">
										<i class="fa fa-krw"></i>&nbsp;0
									</h5>
								</div>
							</div>


							<div class="row margin-top-10">
								<div class="col-xs-8">
									<h5>
										전문가 마일리지 <span id="prhavemileage"
											class="font-size-h6 margin-left-5"><b>(0원
												사용가능)</b></span>
									</h5>
								</div>
								<div class="col-xs-4 padding-left-0 text-right">
									<div class="form-group">
										<span class="margin-left-10 pull-left margin-top-5"><i
											class="fa fa-krw"></i></span> <input id="inprmm" type="text"
											class="form-control input-xs width-80px inline-block"
											max="${masterMileage }">
									</div>
								</div>
							</div>
							<div class="row margin-top-20">
								<div class="col-xs-12">
									<div class="ad-border-dashed"></div>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-6">
									<h4 class="margin-all-0">
										<b>총 결제금액</b>
									</h4>
								</div>
								<div class="col-xs-6 text-right">
									<h3 id="prtotprice" class="margin-all-0 color-primary NGB">
									</h3>
									<h6 class="margin-top-5">(VAT 포함)</h6>
								</div>
							</div>
							<div class="row margin-top-30">
								<div class="col-xs-12">
									<div
										style="color: rgb(255, 112, 112); font-size: 11px; margin-bottom: 5px; display: none;">현재
										광고 구매가 불가능한 카테고리입니다.</div>
									<button class="orderAdvertisementBtn btn btn-primary btn-block">광고신청</button>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-xs-12">
					<div
						class="panel bg-color-transparent profits-panel-border border-radius-0">
						<div class="panel-body">
							<h5 class="NGB margin-all-0">
								<i class="fa fa-exclamation-circle" aria-hidden="true"></i> 결제전
								안내사항
							</h5>
							<ul
								class="text-style font-color-light margin-top-5 padding-left-20 margin-bottom-0">
								<li>광고는 구매 즉시 사용되기 때문에 일시중지 또는 환불이 절대 불가 합니다.</li>
								<li>광고 구매 후 패널티가 부여되어 크몽의 사용이 정지 된 경우, 사이트 내 규정을 위반하여 패널티가
									부과된 것이기 때문에 일시중지 또는 환불이 절대 불가합니다.</li>
								<li>이미 광고가 진행 중인 서비스는 다른 서비스로 변경하실 수 없습니다.</li>
								<li>휴가모드 사용 시 또는 서비스 판매중단 시에도 광고를 중단할 수 없으며 기간이 연장되지 않습니다.
								</li>
								<li>세금계산서는 자동 발행되지 않으며, 매입세액공제가 필요한 경우 카드영수증/현금영수증을 신청해주시기
									바랍니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

	
</body>
</html>