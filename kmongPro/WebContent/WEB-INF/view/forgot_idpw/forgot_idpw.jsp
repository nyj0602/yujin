<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="크몽 - 당신의 비즈니스를 도와드립니다  kmong@kmong.com">
<meta name="site_name" content="크몽 - 당신의 비즈니스를 도와드립니다 ">
<meta name="keywords"
	content="서비스 마켓플레이스, 서비스, 크몽, kmong, kmongcom, 마케팅, 디자인, 번역, 문서작성, 컴퓨터, 프로그래밍, 부업, 핸드메이드, 앱제작, 앱개발, 웹제작, elance, odesk, taskrabbit, fiverr, 투잡, 홈페이지 제작">
<meta name="description"
	content="당신의 \'일\'을 해결해줄 전문가들이 있는 곳, 크몽 - 당신의 비즈니스를 도와드립니다 ( Kmong )">
<meta content=" 크몽 - 당신의 비즈니스를 도와드립니다" property="og:title">

<meta
	content="당신의 '일'을 해결해줄 전문가들이 있는 곳, 크몽 - 당신의 비즈니스를 도와드립니다 ( Kmong )"
	property="og:description">
<title>아이디/비밀번호 찾기 크몽 - 당신의 비즈니스를 도와드립니다</title>

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


<script>
	$(function() {
		var modalLayer = $("#modalLayer");
		var modalCont = $(".modalContent");
		var modalLayer2 = $("#modalLayer2");
		var modalCont2 = $(".modalContent2");

		var modalLayer3 = $("#modalLayer3");
		var modalCont3 = $(".modalContent3");
		var marginLeft = modalCont.outerWidth() / 2;
		var marginTop = modalCont.outerHeight() / 2;

		$('#loginBtn').click(function() {
			var paramss = $('#form2').serialize();

			$.ajax({
				url : "http://localhost:8080/kmongPro/find_pw.do",
				dataType : 'json',
				type : 'GET',
				data : paramss,
				success : function(data) {
					if (data.SorF == "success") {
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
						$('#pconfig').text('입력하신 이메일 주소로 비밀번호를 발송하였습니다.');
						$('#email').prop('value', '');
						$('#names').prop('value', '');
						$('#phonenum').prop('value', '');

					} else if (data.SorF == "false") {
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
						$('#pconfig').text('입력하신 정보를 다시 한번 확인 바랍니다.');
						$('#email').prop('value', '');
						$('#email').focus();
						$('#names').prop('value', '');
						$('#phonenum').prop('value', '');
					} else {
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
						$('#email').prop('value', '');
						$('#email').focus();
						$('#names').prop('value', '');
						$('#phonenum').prop('value', '');
					}
				}
			});

		});

		$('#loginBtn1').click(
				function() {
					var params = "fullname=" + $('#fullname').val()
							+ "&mobile=" + $('#mobile').val();
					$.ajax({
						url : "http://localhost:8080/kmongPro/find_id.do",
						dataType : 'json',
						type : 'GET',
						data : params,
						success : function(data) {
							if (data.SorF == "success") {
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
								$('#fullname').prop('value', '');
								$('#mobile').prop('value', '');
							} else {
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
								$('#fullname').prop('value', '');
								$('#fullname').focus();
								$('#mobile').prop('value', '');
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



<script src="https://static.criteo.net/js/ld/ld.js"
	type="text/javascript" async="true"></script>
</head>
<body>


	<jsp:include page="/WEB-INF/view/inc/header/header_notthing.jsp"></jsp:include>
	<div class="container margin-top-80">
		<div class="col-xs-offset-4 col-xs-4">
			<div class="row">
				<div class="col-xs-12">
					<h2>아이디/비밀번호 찾기</h2>
				</div>
			</div>

			<div class="row margin-top-15">
				<div class="col-xs-12">

					<div class="panel panel-default">
						<div class="panel-heading">아이디 찾기</div>
						<div class="panel-body">
							<form id="form1">
								<input name="_token" type="hidden"
									value="PilVNsncWPHM6iSJToQt4Gahey0jzztmTpHPjn5w"> <input
									name="type" type="hidden" value="email">
								<div class="multi-form-group margin-top-0 margin-bottom-0">
									<div class="form-group">
										<input name="fullname" class="form-control" id="fullname"
											required="" type="text" placeholder="본명">
									</div>

									<div class="form-group">
										<input name="mobile" class="form-control" id="mobile"
											required="" type="text" placeholder="전화번호 ( - 포함)"
											maxlength="13">
									</div>

									<div class="margin-top-15 margin-bottom-15">
										<small>크몽 본인인증시 사용하였던 휴대전화로 가입 시 등록했던 이메일을 보내드립니다.</small>
									</div>
									<input class="btn btn-primary btn-sm btn-block margin-top-5"
										id="loginBtn1" value="SMS로 이메일 주소 전송" readonly>
								</div>
							</form>
						</div>
					</div>


					<div class="panel panel-default margin-bottom-0">
						<div class="panel-heading">비밀번호 찾기</div>
						<div class="panel-body">
							<form class="margin-bottom-0" id='form2'>
								<input name="_token" type="hidden"
									value="PilVNsncWPHM6iSJToQt4Gahey0jzztmTpHPjn5w"> <input
									name="type" type="hidden" value="password">
								<div class="multi-form-group margin-top-0  margin-bottom-0">
									<div class="form-group">
										<input name="email" class="form-control" id="email"
											required="" type="email" placeholder="이메일"> <input
											name="names" class="form-control" id="names" type="text"
											placeholder="이름" maxlength="5" style="margin-top: 5px;">
										<input name="phonenum" class="form-control" id="phonenum"
											type="text" placeholder="전화번호 ( - 포함)" maxlength="13"
											style="margin-top: 5px;">
									</div>

									<div class="margin-top-15 margin-bottom-15">
										<small>크몽 가입 시 등록했던 이메일,이름,전화번호 입력시 비밀번호가 이메일로 발송됩니다.</small>
									</div>

									<input class="btn btn-primary btn-sm btn-block margin-top-5"
										id="loginBtn" value="비밀번호 이메일 발송" readonly>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row margin-top-10">
				<div class="col-xs-12">
					<div class="col-xs-6 text-left">
						<div class="row">
							<a href="http://localhost:8080/kmongPro/login.do"><h5>로그인</h5></a>
						</div>
					</div>
					<div class="col-xs-6 text-right">
						<div class="row">
							<a href="http://localhost:8080/kmongPro/signup.do"><h5>무료회원가입</h5></a>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<h6 class="text-center color-dark-gray margin-top-25">
					Copyright © 2016 Kmong Inc. All rights reserved.</h6>
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
	z-index: 9005;
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

	<!-- <a href="#modalLayer" class="modalLink">간단한 모달 창 만들기</a> -->
	<div id="modalLayer" style="display: none; position: relative;">
		<div class="modalContent" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 10%;">
				<img src="css/image/errorX.png" alt="" />
				<h2>회원 정보 없음</h2>

				<p style="margin-top: 7%;">입력하신 정보를 다시 한번 확인 바랍니다.</p>
			</div>
		</div>
	</div>
	<div id="modalLayer2" style="display: none; position: relative;">
		<div class="modalContent2" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 7%;">
				<img src="css/image/successX.png" alt="" />
				<h2>전송완료</h2>

				<p style="margin-top: 7%;" id="pconfig">가입하신 이메일 주소를 휴대전화로
					보내드렸습니다.</p>
			</div>
		</div>
	</div>
	<div id="modalLayer3" style="display: none; position: relative;">
		<div class="modalContent3" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 10%;">
				<img src="css/image/errorX.png" alt="" />
				<h2>회원 정보 없음</h2>

				<p style="margin-top: 7%;">탈퇴한 회원의 정보입니다. 확인바랍니다.</p>
			</div>
		</div>
	</div>

	<div id="mask"></div>


</body>
</html>