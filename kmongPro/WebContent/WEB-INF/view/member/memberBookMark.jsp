<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<script
	src="https://www.google-analytics.com/gtm/js?id=GTM-MXSMMLH&amp;cid=1348856344.1519115349"
	type="text/javascript"></script>
<script src="https://www.google-analytics.com/plugins/ua/ec.js"
	type="text/javascript"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="당신의 비니지스 파트너 외주 아웃소싱 | 크몽">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<meta name="keywords"
	content="외주, 외주사이트, 아웃소싱, 재능기부, 재능마켓, 서비스마켓, 재택알바, 자택알바, 직장인투잡알바, 창업사이트, 부업, 부업사이트, 직장인부업, 비지니스 파트너">



<meta name="google-site-verification"
	content="fzUsdY8AFahsHxAgVke2Wh1Y_N6hE_dYMWomEwRmn8c">


<title>찜목록 | 크몽</title>


<link rel="stylesheet" href="css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="css/kmong_buy.css" />
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="css/kmong_fonts.css" />
<link rel="stylesheet" href="css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="css/mykmong_main.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="css/image/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>




<style>
.gig-image .tooltip-inner {
	padding: 5px;
	text-align: center;
	max-width: 100px;
	width: 100px;
}
</style>


<script src="https://kmong.com/js/buildV63.js"></script>


<script src="//static.criteo.net/js/ld/ld.js" type="text/javascript"></script>
<script src="https://kmong.com/js/aws-sdk-2.205.0.min.js"></script>
<script src="https://kmong.com/js/moment.min.js"></script>
<script
	src="https://kmong.com/build/js/kmong-2519a24c67.click_event_stream.js"></script>
</head>

<script>
	$(document).ready(
			function() {
				$('#searchPM').each(function() {
					if ($(this).find('i.pulse')) {
						$('.pulse').next().css('display', 'none');
					}
				});
				$('.gigList').each(
						function() {
							if ($('#Staravg').val() != null) {

								var avg = $('#Staravg').val();
								if (0.1 <= avg && avg <= 0.5) {
									avg = "10%";
								} else if (0.6 <= avg && avg <= 1.0) {
									avg = "20%";
								} else if (1.1 <= avg && avg <= 1.5) {
									avg = "30%";
								} else if (1.6 <= avg && avg <= 2.0) {
									avg = "40%";
								} else if (2.1 <= avg && avg <= 2.5) {
									avg = "50%";
								} else if (2.6 <= avg && avg <= 3.0) {
									avg = "60%";
								} else if (3.1 <= avg && avg <= 3.5) {
									avg = "70%";
								} else if (3.6 <= avg && avg <= 4.0) {
									avg = "80%";
								} else if (4.1 <= avg && avg <= 4.5) {
									avg = "90%";
								} else {
									avg = "100%";
								}
								$('#Staravg').parent().prev().find(
										$('.filled-stars')).prop('style',
										'width:' + avg);
							}
						});
			});
</script>
<script>
	$(function() {
		$(document).on(
				"click",
				"#PMSelect",
				function() {
					var param = "choiceTalent=" + $(this).prev().val()
							+ "&m_email=" + $(this).prev().prev().val()
							+ "&t_seq=" + $(this).prev().val();
					var clickSelect = $(this);

					$.ajax({
						url : "my_profile.HeartEdit.do",
						dataType : 'json',
						type : 'GET',
						data : param,
						success : function(data) {
							if (data.Success == "성공") {
								clickSelect.prop('class',
										'fa fa-heart-o color-e6');
							} else if (data.Success == "찜목록재등록") {
								clickSelect.prop('class',
										'fa fa-heart color-red pulse');
							} else {
								alert("잠시 후 다시 시도해주시기 바랍니다.");
							}

						}
					});
				});
	});
</script>
<script>
	$(function() {
		/*			 */
		$('#selectOne').click(function() { // 디자인

		});
		$('#selectTwo').click(function() { // IT&프로그래밍

		});
		$('#selectThree').click(function() { // 컨텐츠 제작 

		});
		$('#selectFour').click(function() { // 마케팅

		});
		$('#selectFive').click(function() { // 번역&통역

		});
		$('#selectSix').click(function() { // 문서작성

		});
		$('#selectSeven').click(function() { // 상담&컨설팅

		});
		$('#selectEight').click(function() { // 레슨

		});
		$('#selectNine').click(function() { // 핸드메이드

		});

	});
</script>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body">

	<div class="fake_global_body"></div>
	<div class="global-body" style="height: 600px; margin-top:0;">



		<style>
@media ( min-width : 1800px) {
	.marchEventFloatingBanner {
		right: 13% !important;
	}
}
</style>




		<style>
body {
	background: #fafafa !important;
	font-size: 14px;
}

.font-size-h1, h1 {
	font-size: 22px !important;
}

.font-size-h2, h2 {
	font-size: 20px !important;
}

.font-size-h3, h3 {
	font-size: 18px !important;
}

.font-size-h4, h4 {
	font-size: 16px !important;
}

.font-size-h5, h5 {
	font-size: 14px !important;
}

.font-size-h6, h6 {
	font-size: 12px !important;
}

.card-font-size-default, p {
	font-size: 13px !important;
}

.card-font-size-small {
	font-size: 11px !important;
}

.panel, .panel-heading, .form-control {
	border-radius: 0;
}

.border-radius-none {
	border-radius: 0 !important;
}

.border-radius {
	border-radius: 4px !important;
}

.modal-content {
	border-radius: 0 !important;
	border: none !important;
}
</style>


		<div class="container">
			<div class="row margin-top-20">
				<div class="col-xs-12 page_mheight">
					<h2 class="NGB">찜목록</h2>
				</div>
			</div>
			<div class="row margin-top-30">
				<div class="col-xs-12">
					<div role="tabpanel">
						<!-- 상단 -->

						<div class="row">
							<div class="col-xs-12" style="width: 1024px;">
								<ul
									class="nav nav-tabs border-radius-0 margin-all-0 border-solid bg-color-white"
									role="tablist">
									<li
										class="bookmarks-menu-item margin-left-15 margin-right-25  active "
										role="presentation" id="selectAll"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartList.do">전체</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectOne"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=1">디자인</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectTwo"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=2">IT
											&amp; 프로그래밍</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectThree"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=3">컨텐츠
											제작</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectFour"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=4">마케팅</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectFive"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=5">번역
											&amp; 통역</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectSix"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=6">문서작성</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectSeven"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=7">상담
											&amp; 컨설팅</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectEight"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=8">레슨</a></li>
									<li class="bookmarks-menu-item margin-right-25 "
										role="presentation" id="selectNine"><a
										class="font-size-h5 font-color-lighter"
										href="http://localhost:8080/kmongPro/my_profile.HeartCategory.do?cat=9">핸드메이드</a></li>
								</ul>
							</div>
						</div>

						<!-- 하단 리스트 -->

						<div class="row">
							<div class="col-xs-12">
								<div class="tab-content">

									<div class="tab-pane fade active in" id="all" role="tabpanel">
										<div class="row gigList margin-none">

											<style>
.tahoma {
	font-family: Tahoma !important;
	font-weight: 700;
}

.ab-won {
	font-size: 14px;
	display: inline-block;
	margin-top: -5px;
	vertical-align: middle;
}
</style>

											<c:choose>
												<c:when test="${m_email eq null }">
													<div class="col-xs-12 margin-top-10">
														<div class="panel panel-default border-radius-0">
															<div class="panel-body text-center">
																<img class="width-100px"
																	src="css/image/nothing_bookmarks.png">
																<h4 class="margin-top-30">찜한 서비스가 없습니다.</h4>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${cat eq null }">
															<c:import
																url="http://localhost:8080/kmongPro/my_profile.Hearttalent.do">
																<c:param name="sessionID" value="${sessionID }"></c:param>
															</c:import>
														</c:when>
														<c:otherwise>
															<c:import
																url="http://localhost:8080/kmongPro/my_profile.HeartCategory.do">
																<c:param name="sessionID" value="${sessionID }"></c:param>
															</c:import>
														</c:otherwise>
													</c:choose>


												</c:otherwise>
											</c:choose>
											<!-- 임포트 -->

										</div>
										<div class="text-center"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>
		</div>

	</div>





	<input class="dz-hidden-input"
		style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;"
		type="file" multiple="multiple">


	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>




	<div id="criteo-tags-div" style="display: none;"></div>

</body>

</html>