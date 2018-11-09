<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>

<title>계정설정 | 크몽</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="당신의 비니지스 파트너 외주 아웃소싱 | 크몽">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<meta name="keywords"
	content="외주, 외주사이트, 아웃소싱, 재능기부, 재능마켓, 서비스마켓, 재택알바, 자택알바, 직장인투잡알바, 창업사이트, 부업, 부업사이트, 직장인부업, 비지니스 파트너">
<meta content="https://kmong.com/my_profile/mail_settings"
	property="og:url">
<meta id="_token" value="Zzp9gT3rSUsKLd3UuDRISgJKZc6v5F2Nh2iKEkqZ">


<meta name="google-site-verification"
	content="fzUsdY8AFahsHxAgVke2Wh1Y_N6hE_dYMWomEwRmn8c">

<meta content="website" property="og:type">
<meta content="알림설정 | 크몽" property="og:title">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image">
<meta
	content="https://d2v80xjmx68n4w.cloudfront.net/intro/94b5862869f31a24eb088628cf8fc874.jpg"
	property="og:image:secure_url">
<meta
	content="디자인, 마케팅, 프로그래밍, 영상제작, 과외, 레슨 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다."
	property="og:description">

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
.file-input-wrapper {
	overflow: hidden;
	position: relative;
	cursor: pointer;
	z-index: 1;
}

.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus,
	.file-input-wrapper input[type=file]:hover {
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	z-index: 99;
	outline: 0;
}

.file-input-name {
	margin-left: 8px;
}
</style>


<style>
.gig-image .tooltip-inner {
	padding: 5px;
	text-align: center;
	max-width: 100px;
	width: 100px;
}
</style>

</head>
<script>
	$(function() {
		$(document).ready(function() {
			var StartTime = $('#StartTime').val();
			var EndTime = $('#EndTime').val();

			// av_time_from /av_time_to
			$('#av_time_from').val(StartTime);
			$('#av_time_to').val(EndTime);
			var profileCNT = $('#profileCNT').text().substring(0, 2);
			profileCNT = 100 - profileCNT;

			//$('#profileProgressBar').find('path').prop('stroke-dashoffset', profileCNT);

		});

		//닉네임수정
		$('#nicknameEdit').click(function() {
			$('#username').removeAttr('disabled');
			$('#username_change_btn_group').css('display', 'block');
		});
		$('#nicknameExit').click(function() {
			$('#username').prop('disabled', 'disabled');
			$('#username_change_btn_group').css('display', 'none');
		});
		$('#nicknameSave').click(function() {
			var param = "changeNickname=" + $('#username').val();
			var value = $('#username').val();
			$.ajax({
				url : "profile.edit.do",
				dataType : 'json',
				type : 'GET',
				data : param,
				success : function(data) {
					$('#username').prop('value', value);
					$('#username').prop('disabled', 'disabled');
					$('#username_change_btn_group').css('display', 'none');
					$('#nicknameEdit').css('display', 'none');

				}
			});

		});

		//av_time_from / av_time_to
		//연락가능시간 수정
		$('#phoneTimeEdit').click(function() {
			$('#av_time_change_btn_group').css('display', 'block');
			$('#av_time_to').removeAttr('disabled');
			$('#av_time_from').removeAttr('disabled');
		});
		$('#phoneTimeExit').click(function() {
			$('#av_time_change_btn_group').css('display', 'none');
			$('#av_time_to').prop('disabled', 'disabled');
			$('#av_time_from').prop('disabled', 'disabled');
		});
		$('#phoneTimeSave').click(function() {
			var StartTime = $('#av_time_from').val();
			var EndTime = $('#av_time_to').val();

			var param = "StartTime=" + StartTime + "&EndTime=" + EndTime;

			$.ajax({
				url : "profile.edit.do",
				dataType : 'json',
				type : 'GET',
				data : param,
				success : function(data) {
					if (data.Success == "성공") {
						$('#av_time_change_btn_group').css('display', 'none');
						$('#av_time_to').prop('disabled', 'disabled');
						$('#av_time_from').prop('disabled', 'disabled');
					} else {
						alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
					}
				}
			});
		});

		// phonenumEdit/phonenumSave/phonenumExit/contact_number
		$('#phonenumEdit').click(function() {
			$('#contact_number_change_btn_group').css('display', 'block');
			$('#contact_number').removeAttr('disabled');
			$(this).css('display', 'none');
		});
		$('#phonenumExit').click(function() {
			$('#contact_number_change_btn_group').css('display', 'none');
			$('#contact_number').prop('disabled', 'disabled');
			$('#phonenumEdit').css('display', 'block');
		});
		$('#phonenumSave').click(
				function() {
					var param = "newPhonenum=" + $('#contact_number').val();
					var value = $('#contact_number').val();

					$.ajax({
						url : "profile.edit.do",
						dataType : 'json',
						type : 'GET',
						data : param,
						success : function(data) {
							if (data.Success == "성공") {
								$('#contact_number_change_btn_group').css(
										'display', 'none');
								$('#contact_number').prop('disabled',
										'disabled');
								$('#phonenumEdit').css('display', 'block');
								$('#contact_number').prop('value', value);

							} else {
								alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
							}

						}
					});
				});

	});
</script>

			<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body">
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
	<style>
.safeNumberTooltip {
	top: 2px;
	left: -5px;
}

.safeNumberTooltip .tooltip-inner {
	padding: 10px;
	max-width: 510px;
	text-align: left;
	/* If max-width does not work, try using width instead */
	width: 510px;
}

select {
	/*for firefox*/
	-moz-appearance: none;
	/*for chrome*/
	-webkit-appearance: none;
}

/*for IE10*/
select::-ms-expand {
	display: none;
}
</style>

	<div class="container" id="profileSettingsDiv"
		xmlns="http://www.w3.org/1999/html" style="margin-bottom: 70px;">
		<div class="row margin-top-40">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-2">
						<h2 class="margin-top-0 margin-bottom-20">
							<b>계정설정</b>
						</h2>
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
							<li class="margin-right-30 position-relative active"
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.infomation.do">나의정보</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="#">인증정보</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.mailsetting.do">알림설정</a></li>

							<li class="margin-right-30 position-relative  "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.changepwd.do">비밀번호
									변경</a></li>

							<li class="margin-right-30 position-relative "
								role="presentation"><a class="plain font-color-lighter"
								href="http://localhost:8080/kmongPro/my_profile.withdrawal.do">회원탈퇴</a></li>
						</ul>


					</div>

					<div class="col-xs-10 padding-left-0">
						<div class="row">
							<div class="col-xs-12">
								<div class="panel panel-default margin-none">
									<div class="panel-body padding-all-30">
										<div class="row">
											<div class="col-xs-12">
												<h4 class="NGB margin-none padding-bottom-5 line-panel">기본정보</h4>
											</div>
										</div>
										<div class="row margin-top-20">
											<div class="col-xs-3 text-center">
												<img title="lvxclmla" class="profile-image" id="thumbnail"
													onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png';"
													src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/BeJne1519018545.PNG">
												<input name="file" id="thumbnail_upload"
													style="display: none;" type="file">

												<div class="margin-top-20">
													<label
														class="label-margin-none btn btn-default btn-sm width-100px border-888"
														id="profilePictureBtn" for="thumbnail_upload">이미지
														수정</label>
												</div>
											</div>
											<div class="col-xs-9 padding-left-0">
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group position-relative">
															<label class="label-margin-none margin-bottom-10"
																for="username"> 이메일 </label> <input name="email"
																disabled="disabled" class="form-control input-sm"
																type="text" value="${m_email }">
														</div>
													</div>
												</div>
												<div class="row margin-top-20" id="username_body">
													<div class="col-xs-12 position-relative">
														<div class="form-group position-relative">
															<label class="label-margin-none margin-bottom-10"
																for="username"> 닉네임&nbsp;<i title=""
																class="fa fa-info-circle" data-original-title=""
																data-toggle="tooltip" data-placement="right"
																data-title="닉네임 변경은 1회만 가능합니다"></i>
															</label>


															<c:if test="${nick_change == '0' }">
																<div class="pull-right">
																	<a
																		class="btn btn-link btn-xs link-color-blue text-underline"
																		id="nicknameEdit"> <i class="fa fa-pencil"
																		aria-hidden="true"></i> 수정
																	</a>
																</div>
																<div class="pull-right" id="username_change_btn_group"
																	style="display: none;">
																	<a
																		class="btn btn-link padding-right-0 btn-xs link-color-blue text-underline"
																		id="nicknameExit">취소</a> <a
																		class="btn btn-link btn-xs link-color-blue text-underline"
																		id="nicknameSave">저장</a>
																</div>
															</c:if>



															<input name="username" disabled="disabled"
																class="form-control input-sm" id="username" type="text"
																value="${m_name }">

															<div>
																<span class="help-block padding-left-0"
																	id="username_error" style="display: none;"></span> <span
																	class="help-block padding-left-0 color-success"
																	id="username_success" style="display: none;"></span>
															</div>
														</div>
													</div>
												</div>
												<div class="row margin-top-20">
													<div class="col-xs-6 position-relative" id="av_time_body">
														<div class="row">
															<div class="col-xs-5 padding-right-0">
																<div class="form-group position-relative">
																	<label class="label-margin-none margin-bottom-10"
																		for="username"> 연락 가능 시간 설정 </label>

																	<div class="select-control">
																		<input type="text" hidden="" id="StartTime"
																			value="${StartTime }" /> <select disabled="disabled"
																			class="form-control input-sm padding-side-15"
																			id="av_time_from">
																			<option value="0" selected="">0시</option>
																			<option value="1">1시</option>
																			<option value="2">2시</option>
																			<option value="3">3시</option>
																			<option value="4">4시</option>
																			<option value="5">5시</option>
																			<option value="6">6시</option>
																			<option value="7">7시</option>
																			<option value="8">8시</option>
																			<option value="9">9시</option>
																			<option value="10">10시</option>
																			<option value="11">11시</option>
																			<option value="12">12시</option>
																			<option value="13">13시</option>
																			<option value="14">14시</option>
																			<option value="15">15시</option>
																			<option value="16">16시</option>
																			<option value="17">17시</option>
																			<option value="18">18시</option>
																			<option value="19">19시</option>
																			<option value="20">20시</option>
																			<option value="21">21시</option>
																			<option value="22">22시</option>
																			<option value="23">23시</option>
																			<option value="24">24시</option>
																		</select>
																	</div>
																</div>
															</div>
															<div class="col-xs-2 text-center">
																<div class="form-group position-relative">
																	<label class="label-margin-none margin-bottom-5">&nbsp;</label>
																	<div class="align-input-sm">~</div>
																</div>
															</div>
															<div class="col-xs-5 padding-left-0">
																<div class="form-group position-relative">
																	<label class="label-margin-none margin-bottom-10"
																		for="av_time">&nbsp;</label>
																	<div class="pull-right">
																		<a
																			class="btn btn-link link-color-blue text-underline btn-xs"
																			href="javascript:void(0);" id="phoneTimeEdit"> <i
																			class="fa fa-pencil" aria-hidden="true"></i> 수정
																		</a>
																	</div>
																	<div class="pull-right" id="av_time_change_btn_group"
																		style="display: none;">
																		<a
																			class="btn btn-link padding-right-0 link-color-blue text-underline btn-xs"
																			href="javascript:void(0);" id="phoneTimeExit">취소</a>
																		<a
																			class="btn btn-link link-color-blue text-underline btn-xs"
																			href="javascript:void(0);" id="phoneTimeSave">저장</a>
																	</div>

																	<div class="select-control">
																		<input type="text" hidden="" id="EndTime"
																			value="${EndTime }" /> <select disabled="disabled"
																			class="form-control input-sm padding-side-15"
																			id="av_time_to">
																			<option value="0" selected="">0시</option>
																			<option value="1">1시</option>
																			<option value="2">2시</option>
																			<option value="3">3시</option>
																			<option value="4">4시</option>
																			<option value="5">5시</option>
																			<option value="6">6시</option>
																			<option value="7">7시</option>
																			<option value="8">8시</option>
																			<option value="9">9시</option>
																			<option value="10">10시</option>
																			<option value="11">11시</option>
																			<option value="12">12시</option>
																			<option value="13">13시</option>
																			<option value="14">14시</option>
																			<option value="15">15시</option>
																			<option value="16">16시</option>
																			<option value="17">17시</option>
																			<option value="18">18시</option>
																			<option value="19">19시</option>
																			<option value="20">20시</option>
																			<option value="21">21시</option>
																			<option value="22">22시</option>
																			<option value="23">23시</option>
																			<option value="24">24시</option>
																		</select>
																	</div>
																</div>
															</div>
														</div>
														<div>
															<span class="help-block padding-left-0"
																id="av_time_error" style="display: none;"></span> <span
																class="help-block padding-left-0 color-success"
																id="av_time_success" style="display: none;"></span>
														</div>
													</div>
													<div class="col-xs-6 padding-left-0"
														id="contact_number_body">
														<div class="form-group position-relative">
															<label
																class="label-margin-none margin-bottom-10 pull-left"
																for="username"> 연락처 </label>
															<div class="awesome-checkbox pull-left margin-left-10">
																<label> <input id="open_mobile" type="checkbox"
																	checked="" value="1"> <span
																	class="awesome-checkbox-body"></span> <span
																	class="awesome-checkbox-text safeNumberTooltip font-size-h6 margin-left-5 font-color-lighter"
																	style="width: 160px;">미결제 회원에게 안심번호 공개 <i
																		title="" class="fa fa-question-circle"
																		aria-hidden="true"
																		data-original-title="• 결제를 진행하지 않은 크몽의 모든 회원에게 전문가의 실제 전화번호 대신 임시의 가상 번호를 노출합니다.<br />• 안심번호를 통해 통화한 내용은 녹취됩니다. "
																		data-toggle="tooltip" data-placement="right"></i>
																</span>
																</label>
															</div>

															<div class="pull-right">
																<a
																	class="btn btn-link link-color-blue text-underline btn-xs"
																	href="javascript:void(0);" id="phonenumEdit"> <i
																	class="fa fa-pencil" aria-hidden="true"></i> 수정
																</a>
															</div>
															<div class="pull-right"
																id="contact_number_change_btn_group"
																style="display: none;">
																<a
																	class="btn btn-link padding-right-0 link-color-blue text-underline btn-xs"
																	href="javascript:void(0);" id="phonenumExit">취소</a> <a
																	class="btn btn-link link-color-blue text-underline btn-xs"
																	href="javascript:void(0);" id="phonenumSave">저장</a>
															</div>
															<input name="contact_number" disabled="disabled"
																class="form-control input-sm" id="contact_number"
																type="text" value="${m_phonenum }" maxlength="13">
														</div>
														<div>
															<span class="help-block padding-left-0"
																id="contact_number_error" style="display: none;"></span>
															<span class="help-block padding-left-0 color-success"
																id="contact_number_success" style="display: none;"></span>
														</div>
													</div>
												</div>
												<div class="row margin-top-20">
													<div class="col-xs-6 position-relative" style="top: 8px;">
														<span class="font-color-lighter">프로필 완성도: </span>&nbsp; <span
															class="NGB"><b id="profileCNT">${profileCNTs }%</b>
														</span>
													</div>
													<div class="col-xs-6 text-right">
														<a class="btn btn-link link-color-blue btn-xss"
															href="http://localhost:8080/kmongPro/profile.do?sellerID=${sessionID }">프로필 완성하러가기 &gt;</a>
													</div>
												</div>
												<div class="row margin-top-5">
													<div class="col-xs-12">
														<div id="profileProgressBar" style="position: relative;">
															<svg xmlns="http://www.w3.org/2000/svg"
																style="width: 100%; display: block;" viewBox="0 0 100 3"
																preserveAspectRatio="none meet">
																	<path style="stroke-dasharray: 100,100; stroke-dashoffset: ${profileCNT};"
																	fill-opacity="0" stroke="#ffd400" stroke-width="3"
																	d="M 0 1.5 L 100 1.5" id="pathstyle" /></svg>
															<div class="progressbar__label"
																style="margin: 0px; padding: 0px; left: 50%; top: 50%; color: rgb(255, 212, 0); position: absolute; opacity: 0; transform: translate(-50%, -50%);">undefined</div>
														</div>
													</div>
												</div>

												<style>
#profileProgressBar>svg {
	background: #f1f1f1;
}
</style>

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



<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
			<c:param name="sessionID" value="${sessionID }"></c:param>
		</c:import>



	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>

	<div id="criteo-tags-div" style="display: none;"></div>
</body>
</html>