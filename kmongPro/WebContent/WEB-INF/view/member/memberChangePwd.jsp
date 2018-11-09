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
<meta content="https://kmong.com/my_profile/change_password"
	property="og:url">
<meta id="_token" value="Zzp9gT3rSUsKLd3UuDRISgJKZc6v5F2Nh2iKEkqZ">


<meta name="google-site-verification"
	content="fzUsdY8AFahsHxAgVke2Wh1Y_N6hE_dYMWomEwRmn8c">

<meta content="website" property="og:type">
<meta content="비밀번호 변경 - 계정설정 | 크몽" property="og:title">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image:secure_url">
<meta
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다."
	property="og:description">

<title>비밀번호 변경 - 계정설정 | 크몽</title>

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


<script src="//static.criteo.net/js/ld/ld.js" type="text/javascript"
	async="true"></script>
<script src="https://kmong.com/js/aws-sdk-2.205.0.min.js"></script>
<script src="https://kmong.com/js/moment.min.js"></script>
<script
	src="https://kmong.com/build/js/kmong-2519a24c67.click_event_stream.js"></script>
</head>
<script>
	$(function() {
		//old_password , new_password , confirm_password

		$('#change_password').click(
				function() {
					var modalLayer = $("#modalLayer");
					var modalCont = $(".modalContent");
					var modalLayer2 = $("#modalLayer2");
					var modalCont2 = $(".modalContent2");
					var modalLayer3 = $("#modalLayer3");
					var modalCont3 = $(".modalContent3");
					var marginLeft = modalCont.outerWidth() / 2;
					var marginTop = modalCont.outerHeight() / 2;
					var param = "old_password=" + $('#old_password').val()
							+ "&new_password=" + $('#new_password').val()
							+ "&confirm_password="
							+ $('#confirm_password').val();

					$.ajax({
						url : "my_profile.changing.do",
						dataType : 'json',
						type : 'GET',
						data : param,
						success : function(data) {
							if (data.Success == "기존비밀번호일치X") {
								$('#pconfig2').text('기존의 비밀번호과 동일하지 않습니다.');	
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
								$('#old_password').prop('value', '');

							} else if (data.Success == "입력한패스워드동일X") {

								$('#pconfig').text('비밀번호 확인 값이 올바르지 않습니다.');
								modalLayer3.fadeIn(1000);
								wrapWindowByMask();
								modalCont3.css({
									"margin-top" : -marginTop,
									"margin-left" : -marginLeft
								});
								setTimeout(function() {
									$('#mask').hide();
									modalLayer3.fadeOut(1000);
								}, 1000);
								$('#new_password').prop('value', '');
								$('#confirm_password').prop('value', '');
							} else if (data.Success == "실패") {
								alert("변경에 실패하였습니다. 다시 시도해주시기 바랍니다.");
							} else if (data.Success == "패스워드길이부족") {
								$('#pconfig2').text('패스워드의 최소 길이는 6자 이상입니다.');								
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
							} else if (data.Success == "기존패스워드와동일") {
								$('#pconfig').text('기존에 사용하시던 패스워드와 같습니다.');
								modalLayer3.fadeIn(1000);
								wrapWindowByMask();
								modalCont3.css({
									"margin-top" : -marginTop,
									"margin-left" : -marginLeft
								});
								setTimeout(function() {
									$('#mask').hide();
									modalLayer3.fadeOut(1000);
								}, 1000);
								$('#new_password').prop('value', '');
								$('#confirm_password').prop('value', '');
							}else {
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
	<div class="global-body">


		<style>
.knowledgeBaseDetailContent p {
	margin-bottom: 0;
}

.knowledgeBaseDetailContent>img {
	width: 100%;
}

.twitter-typeahead {
	width: 100%;
}

.tt-menu {
	width: 100%;
	border-top: 2px solid #ffd400;
	text-align: left;
	position: relative;
	z-index: 2;
}

.tt-cursor:hover, .tt-cursor:focus, .tt-cursor {
	color: #F49165 !important;
	cursor: pointer;
}

.kmong-kb-search {
	color: #666;
}

.kmong-kb-search:focus, .kmong-kb-search:hover {
	color: #F49165;
}

.kmong-kb-search span {
	color: #888;
}

.kmong-kb-search:focus span, .kmong-kb-search:hover span {
	color: #444 !important;
}
</style>
		<!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
	</div>


	<style>
@media ( min-width : 1800px) {
	.marchEventFloatingBanner {
		right: 13% !important;
	}
}
</style>




	<div class="container">
		<div class="row margin-top-30">
			<div class="col-xs-2">
				<div class="row">
					<div class="col-xs-12 padding-left-0">
						<h2 class="margin-none NGB">계정설정</h2>
					</div>
				</div>
				<div class="row margin-top-10">
					<div class="col-xs-12 padding-right-0 padding-left-0">
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
						<ul class="my-profile-menu-list list-style-none font-size-h4"
							role="tablist">
							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.infomation.do">나의정보</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="#">인증정보</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.mailsetting.do">알림설정</a></li>

							<li class="margin-right-30 position-relative  active "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.changepwd.do">비밀번호
									변경</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.withdrawal.do">회원탈퇴</a></li>
						</ul>

					</div>
				</div>
			</div>
			<div class="col-xs-10">
				<!--비밀번호 변경 시작-->
				<form id="password_form"
					action="https://kmong.com/my_profile/change_password" method="POST"
					accept-charset="UTF-8" autocomplete="off">
					<input name="_token" type="hidden"
						value="Zzp9gT3rSUsKLd3UuDRISgJKZc6v5F2Nh2iKEkqZ">
					<div class="row">
						<div class="panel panel-default border-radius-0">
							<div class="panel-body padding-all-30">
								<div class="row">
									<div class="col-xs-12">
										<h4 class="margin-none line-panel NGB padding-bottom-5">현재
											비밀번호</h4>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<h5 class="margin-top-0">현재 비밀번호</h5>
										<div class="form-group">
											<input name="current_password"
												class="form-control input-sm border-radius-0"
												id="old_password" type="password"
												placeholder="기존 비밀번호를 입력해 주세요." value=""
												autocomplete="new-password">
										</div>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<h4 class="margin-none line-panel NGB padding-bottom-5">변경
											비밀번호</h4>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-6 padding-right-5">
										<h5 class="margin-top-0">변경할 비밀번호</h5>
										<div class="form-group">
											<input name="password"
												class="form-control input-sm border-radius-0"
												id="new_password" type="password"
												placeholder="변경할 비밀번호를 입력해 주세요." value=""
												autocomplete="new-password">
										</div>
									</div>
									<div class="col-xs-6 padding-left-5">
										<h5 class="margin-top-0">한번 더 입력</h5>
										<div class="form-group">
											<input name="password_confirmation"
												class="form-control input-sm border-radius-0"
												id="confirm_password" type="password"
												placeholder="변경할 비밀번호를 한번 더 입력해주세요." value=""
												autocomplete="new-password"> <span
												class="incorrect_confirm-error error-required help-block hidden" id="errorHidden"><i
												class="fa fa-exclamation-triangle"></i>&nbsp;패스워드는 6자 이상이어야 합니다.</span> <span
												class="insert_confirm-error error-required help-block hidden"><i
												class="fa fa-exclamation-triangle"></i>&nbsp;변경 할 비밀번호를
												입력해주세요.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-xs-offset-6 padding-right-0">
							<a class="btn btn-brand-yellow btn-block NGB"
								id="change_password">변경하기</a>
						</div>
					</div>
				</form>
				<!--비밀번호 변경 끝-->
			</div>
		</div>
	</div>


	<script src="/build/js/kmong-8502f9976b.password.js"></script>







	<script src="/build/js/kmong-1b91d8e5d3.master.js"></script>
	<input class="dz-hidden-input"
		style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;"
		type="file" multiple="multiple">







	<div id="criteo-tags-div" style="display: none;"></div>

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

#modalLayer3 .modalContent3 {
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

#modalLayer3 {
	z-index: 9004;
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
				<h2>비밀번호</h2>

				<p style="margin-top: 7%;" id="pconfig2">기존의 비밀번호과 동일하지 않습니다.</p>
			</div>
		</div>
	</div>
	<div id="modalLayer2" style="display: none; position: relative;">
		<div class="modalContent2" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 7%;">
				<img src="css/image/successX.png" alt="" />
				<h2>비밀번호변경완료</h2>

				<p style="margin-top: 7%;" >비밀 번호 변경이 완료되었습니다.</p>
			</div>
		</div>
	</div>
	<div id="modalLayer3" style="display: none; position: relative;">
		<div class="modalContent3" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 10%;">
				<img src="css/image/errorX.png" alt="" />
				<h2>비밀번호</h2>

				<p style="margin-top: 7%;" id="pconfig">비밀번호 확인 값이 올바르지 않습니다.</p>
			</div>
		</div>
	</div>
	<div id="mask"></div>

	<div class="padding-bottom-30 padding-top-20 bg-color-white ">
		<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
	</div>
			<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
					<c:param name="sessionID" value="${sessionID }"></c:param>
			</c:import>
</body>
</html>