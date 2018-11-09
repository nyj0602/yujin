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

<title>알림설정 | 크몽</title>


<link rel="stylesheet" href="css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="css/kmong_buy.css" />
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="css/kmong_fonts.css" />
<link rel="stylesheet" href="css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="css/mykmong_main.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="css/image/favicon.ico">


<style>
.gig-image .tooltip-inner {
	padding: 5px;
	text-align: center;
	max-width: 100px;
	width: 100px;
}
</style>






<script src="//static.criteo.net/js/ld/ld.js" type="text/javascript"
	async="true"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<script type="text/javascript">
	$(function() {
		//profileEmail,profileSms 계정정보변경
		$(document).on(
				"click",
				"#profileEmail",
				function() {
					var $obj =  $('#profileEmail');
					
					if ($('#profileEmail').val() == 1) {
						var param = "profileEmail=" + $('#profileEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#profileEmail').val('0');
									$('#profileEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#profileEmail').val() == 0) {
						var param = "profileEmail=" + $('#profileEmail').val()
								+ "&sessionID=${sessionID}";
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});
		
		$(document).on(
				"click",
				"#profileSms",
				function() {
					var $obj =  $('#profileSms');
					
					if ($('#profileSms').val() == 1) {
						var param = "profileSms=" + $('#profileSms').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#profileSms').val('0');
									$('#profileSms').removeAttr('checked');
								}
							}

						});

					} else if ($('#profileSms').val() == 0) {
						var param = "profileSms=" + $('#profileSms').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});
		//messageEmail 문의메세지
		$(document).on(
				"click",
				"#messageEmail",
				function() {
					var $obj =  $('#messageEmail');
					
					if ($('#messageEmail').val() == 1) {
						var param = "messageEmail=" + $('#messageEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#messageEmail').val('0');
									$('#messageEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#messageEmail').val() == 0) {
						var param = "messageEmail=" + $('#messageEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});

		// orderStatusEmail 주문접수
			$(document).on(
				"click",
				"#orderStatusEmail",
				function() {
					var $obj =  $('#orderStatusEmail');
					
					if ($('#orderStatusEmail').val() == 1) {
						var param = "orderStatusEmail=" + $('#orderStatusEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#orderStatusEmail').val('0');
									$('#orderStatusEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#orderStatusEmail').val() == 0) {
						var param = "orderStatusEmail=" + $('#orderStatusEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});

		// orderMessageEmail 거래메세지
		$(document).on(
				"click",
				"#orderMessageEmail",
				function() {
					var $obj =  $('#orderMessageEmail');
					
					if ($('#orderMessageEmail').val() == 1) {
						var param = "orderMessageEmail=" + $('#orderMessageEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#orderMessageEmail').val('0');
									$('#orderMessageEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#orderMessageEmail').val() == 0) {
						var param = "orderMessageEmail=" + $('#orderMessageEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});

		// gigEmail, gigSms 나의서비스관련
$(document).on(
				"click",
				"#gigEmail",
				function() {
					var $obj =  $('#gigEmail');
					
					if ($('#gigEmail').val() == 1) {
						var param = "gigEmail=" + $('#gigEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#gigEmail').val('0');
									$('#gigEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#gigEmail').val() == 0) {
						var param = "gigEmail=" + $('#gigEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});
		
		$(document).on(
				"click",
				"#gigSms",
				function() {
					var $obj =  $('#gigSms');
					
					if ($('#gigSms').val() == 1) {
						var param = "gigSms=" + $('#gigSms').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#gigSms').val('0');
									$('#gigSms').removeAttr('checked');
								}
							}

						});

					} else if ($('#gigSms').val() == 0) {
						var param = "gigSms=" + $('#gigSms').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});
		//newsletterEmail  뉴스레터
		$(document).on(
				"click",
				"#newsletterEmail",
				function() {
					var $obj =  $('#newsletterEmail');
					
					if ($('#newsletterEmail').val() == 1) {
						var param = "newsletterEmail=" + $('#newsletterEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {
									$('#newsletterEmail').val('0');
									$('#newsletterEmail').removeAttr('checked');
								}
							}

						});

					} else if ($('#newsletterEmail').val() == 0) {
						var param = "newsletterEmail=" + $('#newsletterEmail').val();
						$.ajax({
							url : 'my_profile.mailsettingChange.do',
							dataType : 'json',
							type : 'GET',
							data : param,
							cache:false,
							success : function(data) {
								if (data.Success == "변경실패") {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
								} else {									
									$obj.val('1');
									$obj.prop('checked', true);
								}
							}

						});

					}
				});
		
	});
</script>
<jsp:include page="/WEB-INF/view/inc/header/header_lmain.jsp"></jsp:include>

			<jsp:include page="/WEB-INF/view/inc/header/header_category.jsp"></jsp:include>
<body id="master_body">




	<div class="fake_global_body"></div>
	<div class="global-body">







		<style>
@media ( min-width : 1800px) {
	.marchEventFloatingBanner {
		right: 13% !important;
	}
}
</style>





		<style>
#profileProgressBar>svg {
	background: #f1f1f1;
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
		<div class="container" xmlns="http://www.w3.org/1999/html">
			<div class="row margin-top-30" id="profileDiv">
				<div class="col-xs-2">
					<div class="row">
						<div class="col-xs-12">
							<h2 class="margin-none NGB">계정설정</h2>
						</div>
					</div>
					<div class="row margin-top-20">
						<div class="col-xs-12">
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

								<li class="margin-right-30 position-relative  active "
									role="presentation"><a class="plain font-color-lighter"
									href="http://localhost:8080/kmongPro/my_profile.mailsetting.do">알림설정</a></li>

								<li class="margin-right-30 position-relative "
									role="presentation"><a class="plain font-color-lighter"
									href="http://localhost:8080/kmongPro/my_profile.changepwd.do">비밀번호 변경</a>
								</li>

								<li class="margin-right-30 position-relative "
									role="presentation"><a class="plain font-color-lighter"
									href="http://localhost:8080/kmongPro/my_profile.withdrawal.do">회원탈퇴</a></li>
							</ul>

						</div>
					</div>
				</div>
				<div class="col-xs-10">
					<!--비밀번호 변경 시작-->
					<div class="row margin-bottom-20" id="invalidEmailNoticeDiv"
						style="display: none;">
						<div class="col-xs-12">
							<div class="caption-banner overflow-hidden">
								<div class="pull-left margin-top-5">
									<i class="fa fa-exclamation-triangle"></i>&nbsp;유효하지 않은 이메일 주소로
									확인되었습니다. help@kmong.com으로 이메일 변경을 요청해주세요
								</div>
								<a
									class="btn btn-default btn-xss color-light-red border-light-red inline-block pull-right"
									onclick="master_vue.openKmongKB();$('#kmongHelpCenterLink').trigger('click');"
									href="javascript: void (0)">변경요청</a>
							</div>
						</div>
					</div>


					<!-- 모듈import위치 -->
					<c:import
						url="http://localhost:8080/kmongPro/my_profile.mailsettingModule.do">
						<c:param name="sessionID" value="${sessionID }"></c:param>
					</c:import>


				</div>
			</div>
		</div>


		<!-- Begin MailChimp Signup Form -->
		<div id="mc_embed_signup" style="display: none;">
			<form name="mc-embedded-subscribe-form" class="validate"
				id="mc-embedded-subscribe-form"
				action="//kmong.us10.list-manage.com/subscribe/post?u=eab3323d866622c6df5ef9d1b&amp;id=08b2bbd5c7"
				method="post" target="_blank" novalidate="">
				<div id="mc_embed_signup_scroll">

					<div class="mc-field-group">
						<label for="mce-EMAIL">Email Address </label> <input name="EMAIL"
							class="required email" id="mce-EMAIL" type="email"
							value="lvxclmlawe@nate.com">
					</div>
					<div class="mc-field-group">
						<label for="mce-USERID">USERID </label> <input name="USERID"
							id="mce-USERID" type="text" value="336484">
					</div>
					<div class="mc-field-group">
						<label for="mce-USERNAME">USERNAME </label> <input name="USERNAME"
							id="mce-USERNAME" type="text" value="lvxclmlawe_FosT8">
					</div>
					<div class="mc-field-group size1of2">
						<label for="mce-MMERGE4">COMPANY </label> <input name="COMPANY"
							id="mce-MMERGE4" type="number" value="0">
					</div>
					<div class="mc-field-group size1of2">
						<label for="mce-SELLER">SELLER </label> <input name="SELLER"
							id="mce-SELLER" type="number" value="0">
					</div>
					<div class="clear" id="mce-responses">
						<div class="response" id="mce-error-response"
							style="display: none;"></div>
						<div class="response" id="mce-success-response"
							style="display: none;"></div>
					</div>
					<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
					<div aria-hidden="true" style="left: -5000px; position: absolute;">
						<input name="b_eab3323d866622c6df5ef9d1b_08b2bbd5c7" tabindex="-1"
							type="text" value="">
					</div>
					<div class="clear">
						<input name="subscribe" class="button" id="mc-embedded-subscribe"
							type="submit" value="Subscribe">
					</div>
				</div>
			</form>
		</div>

		<!--End mc_embed_signup-->

		<!--End mc_embed_signup-->



	</div>





		<c:import url="http://localhost:8080/kmongPro/QuickMenuModuel.do">
			<c:param name="sessionID" value="${sessionID }"></c:param>
		</c:import>

	<input class="dz-hidden-input"
		style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;"
		type="file" multiple="multiple">

	<script src="https://js.pusher.com/3.0/pusher.min.js"></script>
	<div id="criteo-tags-div" style="display: none;"></div>
	
	<jsp:include page="/WEB-INF/view/inc/footer/footer_notice.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/footer/footer.jsp"></jsp:include>
</body>
</html>