<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
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


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="당신의 비니지스 파트너 외주 아웃소싱 | 크몽">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<meta name="keywords"
	content="외주, 외주사이트, 아웃소싱, 재능기부, 재능마켓, 서비스마켓, 재택알바, 자택알바, 직장인투잡알바, 창업사이트, 부업, 부업사이트, 직장인부업, 비지니스 파트너">
<meta content="https://kmong.com/my_profile/leave" property="og:url">
<meta id="_token" value="bJcG0S5zWKZLeLb8Q0Zuffm5rvMTdLqsIMPZNDqw">


<meta name="google-site-verification"
	content="fzUsdY8AFahsHxAgVke2Wh1Y_N6hE_dYMWomEwRmn8c">

<meta content="website" property="og:type">
<meta content="회원탈퇴 - 계정설정 | 크몽" property="og:title">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image:secure_url">
<meta
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다."
	property="og:description">

<title>회원탈퇴 - 계정설정 | 크몽</title>

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


<style>
iframe[name='google_conversion_frame'] {
	height: 0 !important;
	width: 0 !important;
	line-height: 0 !important;
	font-size: 0 !important;
	margin-top: -13px;
	float: left;
}
</style>
<script src="https://kmong.com/js/buildV63.js"></script>


<script src="//static.criteo.net/js/ld/ld.js" type="text/javascript"
	async="true"></script>
<script src="https://kmong.com/js/aws-sdk-2.205.0.min.js"></script>
<script src="https://kmong.com/js/moment.min.js"></script>
<script
	src="https://kmong.com/build/js/kmong-2519a24c67.click_event_stream.js"></script>
</head>
<script>
	$(function() {
		$('#withdrawingBtn').click(function() {
			var modalLayer = $("#modalLayer");
			var modalCont = $(".modalContent");
			var modalLayer2 = $("#modalLayer2");
			var modalCont2 = $(".modalContent2");
			var marginLeft = modalCont.outerWidth() / 2;
			var marginTop = modalCont.outerHeight() / 2;

			var email = $('#email').val();
			var param = "email=" + email;

			$.ajax({
				url : "my_profile.widhrawing.do",
				dataType : "json",
				type : 'GET',
				data : param,
				success : function(data) {
					if (data.Success == "실패") {
						alert("회원탈퇴에 실패 다시시도");
					} else if (data.Success == "가입하신이메일과동일X") {
						modalLayer.fadeIn(1000);
						wrapWindowByMask();
						modalCont.css({
							"margin-top" : -marginTop,
							"margin-left" : -marginLeft
						});
						setTimeout(function() {
							$('#mask').hide();
							modalLayer.fadeOut(1000);
						}, 1000);
						$('#email').prop('value', '');
					} else {
						modalLayer2.fadeIn(1000);
						wrapWindowByMask();
						modalCont2.css({
							"margin-top" : -marginTop,
							"margin-left" : -marginLeft
						});
						setTimeout(function() {
							$('#mask').hide();
							modalLayer2.fadeOut(1000);
						}, 1000);
					}
				}
			});
		});
	});
</script>

<script>
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//애니메이션 효과
		$('#mask').fadeTo("slow", 0.8);
	}
</script>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body">


	<div class="fake_global_body"></div>


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



	<div class="container" style="margin-top: 100px;">
		<div class="row margin-top-30">
			<div class="col-xs-2">
				<div class="row">
					<div class="col-xs-12 padding-left-0">
						<h2 class="margin-none NGB">계정설정</h2>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-xs-12 padding-right-0 padding-left-0">

						<ul class="my-profile-menu-list list-style-none font-size-h4"
							role="tablist">
							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.infomation.do">나의정보</a></li>


							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="#">인증정보</a></li>

							<li class="margin-right-30 position-relative  "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.mailsetting.do">알림설정</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.changepwd.do">비밀번호
									변경</a></li>

							<li class="margin-right-30 position-relative  active "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.withdrawal.do">회원탈퇴</a></li>
						</ul>

					</div>
				</div>
			</div>
			<div class="col-xs-10">
				<!--회원탈퇴하기 변경 시작-->
				<form id="leaveMemberForm">
					<input name="_token" type="hidden"
						value="bJcG0S5zWKZLeLb8Q0Zuffm5rvMTdLqsIMPZNDqw"> <input
						name="type" type="hidden" value="leave">
					<div class="row">
						<div class="panel panel-default margin-none border-radius-0">
							<div class="panel-body padding-all-30">
								<div class="row leave-border-bottom">
									<div class="col-xs-12">
										<h4 class="margin-none line-panel padding-bottom-5 NGB">탈퇴사유</h4>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<div class="awesome-radio">
											<label> <input name="because"
												class="margin-top-0 vertical-align-middle" type="radio"
												value="다른 계정이름으로 사용하기 위해서"> <span
												class="awesome-radio-body padding-left-0"></span>
												<div class="awesome-radio-text">다른 계정이름으로 사용하기 위해서</div>
											</label>
										</div>
										<div class="awesome-radio margin-top-10">
											<label> <input name="because"
												class="margin-top-0 vertical-align-middle" type="radio"
												value="사용빈도가 낮고, 개인정보 유출이 우려되서"> <span
												class="awesome-radio-body padding-left-0"></span>
												<div class="awesome-radio-text">사용빈도가 낮고, 개인정보 유출이
													우려되서</div>
											</label>
										</div>
										<div class="awesome-radio margin-top-10">
											<label> <input name="because"
												class="margin-top-0 vertical-align-middle" type="radio"
												value="사이트 이용시 장애가 많아서"> <span
												class="awesome-radio-body padding-left-0"></span>
												<div class="awesome-radio-text">사이트 이용시 장애가 많아서</div>
											</label>
										</div>
										<div class="awesome-radio margin-top-10">
											<label> <input name="because"
												class="margin-top-0 vertical-align-middle" type="radio"
												value="서비스의 질에 대한 불만이 있어서"> <span
												class="awesome-radio-body padding-left-0"></span>
												<div class="awesome-radio-text">서비스의 질에 대한 불만이 있어서</div>
											</label>
										</div>
										<div class="awesome-radio margin-top-10">
											<label> <input name="because"
												class="margin-top-0 vertical-align-middle" type="radio"
												value="사이트 이용시 고객응대가 나빠서"> <span
												class="awesome-radio-body padding-left-0"></span>
												<div class="awesome-radio-text">사이트 이용시 고객응대가 나빠서</div>
											</label>
										</div>
										<div class="form-group margin-top-10">
											<div class="row">
												<div class="col-xs-2">
													<div class="awesome-radio">
														<label> <input name="because"
															class="margin-top-0 vertical-align-middle" type="radio"
															value="etc"> <span
															class="awesome-radio-body padding-left-0"></span>
															<div class="awesome-radio-text">기타</div>
														</label>
													</div>
												</div>
											</div>
											<div class="row margin-top-5" style="display: none;">
												<div class="col-xs-12 padding-left-30">
													<input name="because_etc" class="form-control input-sm"
														type="text" placeholder="직접입력">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row margin-top-30">
									<div class="col-xs-12 padding-right-0">
										<h4 class="margin-none line-panel padding-bottom-5 NGB">이메일
											확인</h4>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<h5 class="margin-none">이메일 주소</h5>
										<div class="form-group margin-top-5">
											<input name="email" class="form-control input-sm" id="email"
												required="" type="text" placeholder="크몽에 가입하신 이메일을 적어주세요">
											<h5 class="font-color-lighter line-height">
												* 무상으로 지급된 크몽캐시는 탈퇴와 함께 자동 소멸됩니다. <br> 환불 가능한 <a
													class="link-color-blue text-underline NGB"
													href="https://kmong.com/kmong_cash_history">크몽캐시</a>가 있을
												경우, 고객센터를 통해 환불 받으실 수 있습니다.
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row margin-top-30">
						<div class="col-xs-12 text-right padding-right-0">
							<a class="btn btn-primary padding-left-45 padding-right-45"
								id="withdrawingBtn">회원 탈퇴</a>
						</div>
					</div>
				</form>
				<!--회원탈퇴하기 변경 끝-->


			</div>
		</div>
	</div>


	</div>

	<div tabindex="-1" class="modal fade" id="kmongManual" role="dialog"
		aria-hidden="false" aria-labelledby="myModal">
		<div class="modal-dialog manual_modal modal-position"
			style="width: 640px;">
			<div class="modal-content">
				<div class="container" style="width: 100% !important;">
					<div class="row">
						<div class="col-xs-12 text-center padding-top-30">
							<h2 class="color-black">
								<b>초간단 구매방법</b>
							</h2>
							<button class="close kmong-how-close" aria-label="Close"
								type="button" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							<h3 class="margin-top-5 color-dark-gray">서비스를 상품처럼 사고팔 수 있는
								곳, 크몽</h3>
						</div>
					</div>
					<div
						class="row padding-right-80 padding-left-80 margin-top-30 margin-bottom-50">
						<div class="col-xs-12">
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="전문가찾기" src="/img/kmong_how/1.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>01</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>'카테고리 선택'</b> 또는 <b>'검색창'</b>을 통해 전문가를 찾아보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="서비스 설명보기"
										src="/img/kmong_how/2.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>02</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												제공 <b>서비스에 대한 설명과 가격</b> 등을 꼼꼼히 살펴보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="견적문의" src="/img/kmong_how/3.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>03</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>크몽 메세지</b>를 통해 전문가에게<b> 견적을 문의</b>해보세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="구매버튼 클릭"
										src="/img/kmong_how/4.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>04</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">구매버튼을 클릭하여 구매를
												완료하세요.</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="작업물 확인" src="/img/kmong_how/5.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-bottom-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>05</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">전문가와 대화하며 최상의 작업물을
												받아보세요.</h4>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-2 padding-right-0 padding-left-0">
									<img class="width-55px" alt="전문가 평가" src="/img/kmong_how/6.png">
								</div>
								<div
									class="col-xs-10 padding-left-30 padding-right-0 border-dashed-left">
									<dl>
										<dt>
											<h2 class="margin-top-0 color-dark-yellow-400">
												<i>06</i>
											</h2>
										</dt>
										<dd>
											<h4 class="color-black margin-top-5">
												<b>전문가를 평가</b>해주세요.
											</h4>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style>
a {
	color: #000;
}

#modalLayer .modalContent {
	width: 440px;
	height: 270px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 49%;
	z-index: 9002;
	background: white;
	border-radius: 2%;
}

#modalLayer2 .modalContent2 {
	width: 440px;
	height: 270px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 49%;
	z-index: 9004;
	background: white;
	border-radius: 2%;
}

#modalLayer {
	z-index: 9001;
}

#modalLayer2 {
	z-index: 9003;
}

#modalLayer .modalContent button {
	position: absolute;
	right: 0;
	top: 0;
	cursor: pointer;
}

#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9000;
	background-color: #000;
	display: none;
}
</style>

	<div id="modalLayer" style="display: none; position: relative;">
		<div class="modalContent" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 10%;">
				<img src="css/image/errorX.png" alt="" />
				<h2>이메일</h2>

				<p style="margin-top: 7%;">가입하신 이메일과 동일하지 않습니다.</p>
			</div>
		</div>
	</div>
	<div id="modalLayer2" style="display: none; position: relative;">
		<div class="modalContent2" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 7%;">
				<img src="css/image/successX.png" alt="" />
				<h2>회원탈퇴완료</h2>

				<p style="margin-top: 7%;" id="pconfig">회원 탈퇴가 완료되었습니다.</p>
			</div>
		</div>
	</div>
	<div id="mask"></div>






	<input class="dz-hidden-input"
		style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;"
		type="file" multiple="multiple">

	<script src="https://js.pusher.com/3.0/pusher.min.js"></script>


	<div id="criteo-tags-div" style="display: none;"></div>

	<div class="padding-bottom-30 padding-top-20 bg-color-white ">
		<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
	</div>
	<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
		<c:param name="sessionID" value="${sessionID }"></c:param>
	</c:import>
</body>
</html>