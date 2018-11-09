<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 크몽 - 당신의 비즈니스를 도와드립니다</title>

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
.help-block {
	display: block;
	padding-left: 15px;
	font-size: 11px;
	margin-top: 5px;
	margin-bottom: 10px;
	color: rgb(255, 114, 98);
}

.fa, .fa-stack {
	display: inline-block;
}

.fa {
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	transform: translate(0px, 0px);
}

.fa-exclamation-triangle::before, .fa-warning::before {
	content: "\f071";
}

*, ::after, ::before {
	box-sizing: border-box;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
						var userInputEmail = getCookie("userInputEmail");
						$("#m_email").val(userInputEmail);

						if ($("#m_email").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
							$("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
						}

						$("#remember").change(function() { // 체크박스에 변화가 있다면,
							if ($("#remember").is(":checked")) { // ID 저장하기 체크했을 때,
								var userInputEmail = $("#m_email").val();
								setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
							} else { // ID 저장하기 체크 해제 시,
								deleteCookie("userInputEmail");
							}
						});

						// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
						$("#m_email").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
							if ($("#remember").is(":checked")) { // ID 저장하기를 체크한 상태라면,
								var userInputEmail = $("#m_email").val();
								setCookie("userInputEmail", userInputEmail, 7); // 7일 동안 쿠키 보관
							}
						});

						$('#loginBtn2')
								.click(
										function() {
											var modalLayer = $("#modalLayer");
											var modalCont = $(".modalContent");

											var marginLeft = modalCont
													.outerWidth() / 2;
											var marginTop = modalCont
													.outerHeight() / 2;
											params = $('#loginForm')
													.serialize()
													+ "&messageGo=messageGo";
											$
											
													.ajax({
														url : "loginCheck.do",
														dataType : 'json',
														type : 'POST',
														data : params,
														success : function(data) {
															if (!regExp.test($(
																	'#m_email')
																	.val())) {
																$('#email_form')
																		.prop(
																				'style',
																				'display:block');
																$(
																		'#email_notmember')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#pass_missmatch')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#pass_notInput')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#email_notInput')
																		.prop(
																				'style',
																				'display:none');
																return false;
															} else {
																if (data.errors == "notInput_email") {
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "notInput_pass") {
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "missmatch_email") {
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "not_errors"
																		|| data.errors == "missmatch_pwd") {
																	if (data.errors == "missmatch_pwd") {
																		$(
																				'#email_notmember')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#email_notInput')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#pass_missmatch')
																				.prop(
																						'style',
																						'display:block');
																		$(
																				'#pass_notInput')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#email_form')
																				.prop(
																						'style',
																						'display:none');
																	} else {
																		window.location = "http://localhost:8080/kmongPro/message.do";
																	}
																} else if (data.errors == "withdrawalMember") {
																	modalLayer
																			.fadeIn(1000);
																	wrapWindowByMask();
																	modalCont
																			.css({
																				"margin-top" : -marginTop,
																				"margin-left" : -marginLeft
																			});
																	setTimeout(
																			function() {
																				$(
																						'#mask')
																						.hide();
																				modalLayer
																						.fadeOut(1000);
																			},
																			1000);
																}
															}
														}

													});
										});

						// 로그인 실시간 값확인 ajax처리
						var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
						$('#loginBtn')
								.click(
										function() {

											var modalLayer = $("#modalLayer");
											var modalCont = $(".modalContent");

											var marginLeft = modalCont
													.outerWidth() / 2;
											var marginTop = modalCont
													.outerHeight() / 2;
											var params = $('#loginForm')
													.serialize();
											$
													.ajax({
														url : "loginCheck.do",
														dataType : 'json',
														type : 'POST',
														data : params,
														success : function(data) {
															if (!regExp.test($(
																	'#m_email')
																	.val())) {
																$('#email_form')
																		.prop(
																				'style',
																				'display:block');
																$(
																		'#email_notmember')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#pass_missmatch')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#pass_notInput')
																		.prop(
																				'style',
																				'display:none');
																$(
																		'#email_notInput')
																		.prop(
																				'style',
																				'display:none');
																return false;
															} else {
																if (data.errors == "notInput_email") {
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "notInput_pass") {
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "missmatch_email") {
																	$(
																			'#email_notmember')
																			.prop(
																					'style',
																					'display:block');
																	$(
																			'#email_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_missmatch')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#pass_notInput')
																			.prop(
																					'style',
																					'display:none');
																	$(
																			'#email_form')
																			.prop(
																					'style',
																					'display:none');
																} else if (data.errors == "not_errors"
																		|| data.errors == "missmatch_pwd") {
																	if (data.errors == "missmatch_pwd") {
																		$(
																				'#email_notmember')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#email_notInput')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#pass_missmatch')
																				.prop(
																						'style',
																						'display:block');
																		$(
																				'#pass_notInput')
																				.prop(
																						'style',
																						'display:none');
																		$(
																				'#email_form')
																				.prop(
																						'style',
																						'display:none');
																	}

																	else {
																		window.location = "http://localhost:8080/kmongPro/lmain.do";
																	}
																} else if (data.errors == "withdrawalMember") {
																	modalLayer
																			.fadeIn(1000);
																	wrapWindowByMask();
																	modalCont
																			.css({
																				"margin-top" : -marginTop,
																				"margin-left" : -marginLeft
																			});
																	setTimeout(
																			function() {
																				$(
																						'#mask')
																						.hide();
																				modalLayer
																						.fadeOut(1000);
																			},
																			1000);
																}
															}
														}

													});
										});

					}

			);

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
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
</head>
<body>

	<jsp:include page="/WEB-INF/view/inc/header/header_notthing.jsp"></jsp:include>

	<div class="container margin-top-150">
		<div class="col-xs-offset-4 col-xs-5 padding-right-35 padding-left-35">
			<div class="row">
				<div class="col-xs-12">
					<h2>
						<b>로그인</b>
					</h2>
				</div>
			</div>

			<div class="row margin-top-15">
				<div class="col-xs-12">
					<form id="loginForm" autocomplete="off">
						<input name="_token" type="hidden"> <input id="target"
							type="hidden" name="next_page" value="/">
						<div class="multi-form-group margin-top-0">
							<div class="position-relative">
								<div id="emailFormGroup" class="form-group">
									<input id="m_email" type="email" class="form-control"
										name="m_email" placeholder="이메일" autocomplete="false"
										value="${param.m_email }"> <span class='help-block'
										id="email_notmember" style="display: none;"><i
										class='fa fa-exclamation-triangle' id='triangle1'></i> &nbsp;
										크몽에 가입되어 있지 않은 이메일 주소 입니다.</span> <span class='help-block'
										id="email_notInput" style="display: none;"><i
										class='fa fa-exclamation-triangle' id='triangle2' /></i> &nbsp;
										이메일을 입력해주세요.</span> <span class='help-block' id="email_form"
										style="display: none;"><i
										class='fa fa-exclamation-triangle' id='triangle2' /></i> &nbsp;
										email 형식이 유효하지 않습니다.</span>

								</div>
								<ul id="emailDropdown"
									class="dropdown-menu width-100 list-unstyled font-size-h6"
									role="menu" aria-labelledby="dLabel"
									style="top: 51px; display: none;" data-index="0">

								</ul>
							</div>

							<div id="passwordFormGroup" class="form-group">
								<input id="m_pwd" type="password" class="form-control"
									name="m_pwd" placeholder="비밀번호" autocomplete="new-password">
								<span class='help-block' id="pass_notInput"
									style="display: none;"><i
									class='fa fa-exclamation-triangle' id='triangle3' /></i> &nbsp;
									비밀번호를 입력해주세요.</span> <span class='help-block' id="pass_missmatch"
									style="display: none;"><i
									class='fa fa-exclamation-triangle' id='triangle3' /></i> &nbsp;
									비밀번호가 맞지 않습니다.</span>
							</div>

							<div class="pull-right margin-top-5 color-dark-gray">
								<div class="awesome-checkbox">
									<label class="label-margin-none" for="remember"> <input
										type="checkbox" id="remember" name="remember"> <span
										class="awesome-checkbox-body"></span>
										<div
											class="awesome-checkbox-text font-color-lighter font-size-h6"
											style="margin-top: 1px; opacity: 0.8">로그인 기억하기</div>
									</label>
								</div>
							</div>



							<div class="col-xs-12 margin-top-25">
								<c:choose>
									<c:when test="${messageGo eq 'messageGo' }">
										<div class="row">
											<a href="#" id="loginBtn2"
												class="btn btn-primary btn-black btn-block">로그인</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="row">
											<a href="#" id="loginBtn"
												class="btn btn-primary btn-black btn-block">로그인</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="row margin-top-10 margin-bottom-35">
									<div class="col-xs-6 text-left">
										<div class="row">
											<a class="font-color-base" href="forgot_idpw.do"><h6>아이디/비밀번호
													찾기</h6></a>
										</div>
									</div>
									<div class="col-xs-6 text-right">
										<div class="row">
											<a class="font-color-base" href="signup.do"><h6>무료회원가입</h6></a>
										</div>
									</div>
								</div>

								<!-- 네이버아이디로로그인 버튼 노출 영역 -->


								<h6
									class="text-center color-dark-gray margin-top-45 font-size-small">
									Copyright © 2017 Kmong Inc. All rights reserved.</h6>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="mar_30"></div>
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
			<div style="text-align: center; margin-top: 7%;">
				<img src="css/image/errorX.png" alt="" />
				<h2>회원탈퇴</h2>

				<p style="margin-top: 7%;" id="pconfig">회원 탈퇴한 계정입니다.</p>
			</div>
		</div>
	</div>
	<div id="mask"></div>
</body>
</html>