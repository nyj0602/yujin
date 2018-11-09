<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
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
<title>회원가입 크몽 - 당신의 비즈니스를 도와드립니다</title>

<link rel="stylesheet" href="css/signup_style.css" />
<link rel="shortcut icon" href="css/image/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- <script src="https://kmong.com/build/js/common-b8e57eb3f0.js"></script>
<script src="https://kmong.com/build/js/kmong-7370f1d0fe.js"></script>

<script src="https://kmong.com/js/buildV63.js"></script>

<script src="https://kmong.com/js/aws-sdk-2.165.0.min.js"></script>
<script src="https://kmong.com/build/js/kmong-c7448f76b7.dynamo.js"></script> -->

</head>
<script>
	$(function() {

		//기업 or 개인 div활성화구분
		$("#click").click(function() {
			$("#companyDiv").prop("class", "multi-form-group");
		});
		$("#click2").click(function() {
			$("#companyDiv").prop("class", "multi-form-group hidden");
		});

		/* 이메일 중복체크 실시간처리 */
		$('#email')
				.blur(
						function() {
							var params = "m_email=" + $('#email').val();
							$
									.ajax({
										url : "M_ec.do",
										dataType : 'json',
										type : 'GET',
										data : params,
										/*  data= { "count":0 } */
										success : function(data) {
											console.log(data.count);
											if (data.count == 0) {
												$('#emailcheck2')
														.prop('class',
																'email-error help-block hidden');
												$('#email').prop('style', '');
												$('#emailcheck2').html('');
											} else {
												$('#emailcheck2')
														.prop('class',
																'email-error help-block');
												$('#email')
														.prop('style',
																'border-color: rgb(255, 114, 98)');
												$('#emailcheck2')
														.html(
																'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; 크몽에 이미 가입되어 있는 이메일 주소 입니다.');
											}
										}
									});

						});

		$

		/* 비밀번호 유효성검사 */
		$('#password')
				.blur(
						function() {
							var emptytest = $(this).val();
							if (emptytest.length == 0) {
								$('#passwordcheck').prop('class',
										'password-error help-block');
								$('#password').prop('style',
										'border-color: rgb(255, 114, 98)');
								$('#passwordcheck')
										.html(
												'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; 비밀번호를 입력해주세요');
							} else if (emptytest.length < 6) {
								$('#passwordcheck').prop('class',
										'password-error help-block');
								$('#password').prop('style',
										'border-color: rgb(255, 114, 98)');
								$('#passwordcheck')
										.html(
												'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; 비밀번호는 6자 이상 입력해주세요.');
							} else {
								$('#passwordcheck').prop('class',
										'password-error help-block hidden');
								$('#password').prop('style', '');
								$('#passwordcheck').html('');
							}
						});

		/* 이메일유효성검사	 */
		$('body')
				.click(
						function() {
							var regExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
							// 위의 조건을 만족하려면 최소 6자 이상이어야 함.
							if (!regExp.test($('#email').val())) {
								if ($('#email').val() == 0) {
									$('#emailcheck2').prop('class',
											'email-error help-block');
									$('#email').prop('style',
											'border-color: rgb(255, 114, 98)');
									$('#emailcheck2')
											.html(
													'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; 이메일을 입력해주세요.');

								} else if ($('#email').val().length >= 1) {
									$('#emailcheck2').prop('class',
											'email-error help-block');
									$('#email').prop('style',
											'border-color: rgb(255, 114, 98)');
									$('#emailcheck2')
											.html(
													'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; email형식이 유효하지 않습니다.');

								} else {
									$('#emailcheck2').prop('class',
											'email-error help-block hidden');
									$('#email').prop('style', '');
									$('#emailcheck2').html('');
								}
							}
						});

		/* 비밀번호 확인부분 체크 */
		$('body')
				.click(
						function() {
							var pass = $('#password').val();
							var pass_con = $('#password_confirm').val();
							if (pass == pass_con) {
								$('#passwordcon').prop('class',
										'password-error help-block hidden');
								$('#password_confirm').prop('style', '');
								$('#passwordcon').html('');
							} else {
								$('#passwordcon').prop('class',
										'password-error help-block');
								$('#password_confirm').prop('style',
										'border-color: rgb(255, 114, 98)');
								$('#passwordcon')
										.html(
												'<i class="fa fa-exclamation-triangle" id="triangle"/> &nbsp; 입력하신 비밀번호와 동일하게 입력해주세요.');

							}
						});

		// 회원/기업 선택에 따른 서브밋
		$('#signup_btn')
				.click(
						function() {

							var emails = $('#email').val();
							var passwords = $('#password').val();
							var phonenums = $('#certificationMobileInput')
									.val();
							var names = $('#certificationNameInput').val();
							var births = $('#certificationBirthdayInput').val();
							var password_cons = $('#password_confirm').val();
							var c_type_ids = $('#company_type_id').val();
							var c_names = $('#c_name').val();
							var c_rn_inputs = $('#c_rn').val();
							var error_length = $('body').find(
									'i.fa-exclamation-triangle').length;

							if ($('#companyRadioBtn').is(':checked')) {
								if (emails.length == 0 || passwords.length == 0
										|| passwords != password_cons
										|| phonenums.length == 0
										|| names.length == 0
										|| births.length == 0
										|| c_type_ids.length == 0
										|| c_names.length == 0
										|| error_length > 3) {
									alert("회원가입을 할 수 없습니다. 입력한 정보를 다시 확인해주시기 바랍니다.");
								} else if ($('#c_rn').is('.failed')) {
									alert("사업자인증을 진행해주시기 바랍니다.");
								} else {
									$('#m_sep').prop('value', '기업회원');
									$('#signupForm')
											.prop('action',
													'http://localhost:8080/kmongPro/m/join_company.do');
									$('#signupForm').submit();
								}

							} else {
								if (emails.length == 0 || passwords.length == 0
										|| passwords != password_cons
										|| phonenums.length == 0
										|| names.length == 0
										|| births.length == 0
										|| error_length > 3) {
									alert("회원가입을 할 수 없습니다. 입력한 정보를 다시 확인해주시기 바랍니다.");
								} else {

									$('#m_sep').prop('value', '개인회원');
									$('#signupForm')
											.prop('action',
													'http://localhost:8080/kmongPro/m/join.do');
									$('#signupForm').submit();
								}
							}
						});
		// 사업자번호 유효성 검사 클래스명 form-control company numberOnlyInput
		$('#companyCertificationBtn').click(
				function() {
					var c_rn = $('#c_rn').val();
					if (is_binNo(c_rn)) {
						alert("인증되었습니다.");
						$('#c_rn').prop('class',
								'form-control company numberOnlyInput');
					} else {
						alert("올바르지 않은 사업자 번호입니다.");
						$('#c_rn').prop('class',
								'form-control company numberOnlyInput failed');
					}
				});
	});
</script>
<script>
	//사업자번호 유효성검사함수
	function is_binNo(num) {
		var reg = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
		if (!reg.test(num))
			return false;
		num = RegExp.$1 + RegExp.$2 + RegExp.$3;
		var cVal = 0;
		for (var i = 0; i < 8; i++) {
			var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : (_tmp == 1) ? 3
					: 7);
			cVal += (parseFloat(num.substring(i, i + 1)) * cKeyNum) % 10;
		}
		var li_temp = parseFloat(num.substring(i, i + 1)) * 5 + '0';
		cVal += parseFloat(li_temp.substring(0, 1))
				+ parseFloat(li_temp.substring(1, 2));
		return (parseInt(num.substring(9, 10)) == 10 - (cVal % 10) % 10);
	}

	function Exists(input, types) {
		if (types)
			if (!Trim(input.value))
				return false;
		return true;
	}
</script>


<body>

<jsp:include page="/WEB-INF/view/inc/header/header_notthing.jsp"></jsp:include>
	<div class="container margin-top-70">

		<div class="row">
			<div class="col-xs-12">
				<h2>무료회원가입</h2>
			</div>
		</div>

		<div class="row margin-top-15">
			<div class="col-xs-7" style="padding-right: 50px;">
				<form id="signupForm">
					<input name="_token" type="hidden"
						value="PilVNsncWPHM6iSJToQt4Gahey0jzztmTpHPjn5w"> <input
						name="utm_source" type="hidden" value=""> <input
						name="next_page" type="hidden" value="">
					<div class="multi-form-group margin-top-0">
						<div class="position-relative">
							<div class="form-group" id="emailDiv">
								<input name="m_email" class="form-control" id="email"
									type="email" placeholder="이메일" value="" autocomplete="off">

								<span class="email-error help-block hidden" id="emailcheck2"
									style="color: #FF7262"> &nbsp; </span>
							</div>
							<ul class="dropdown-menu width-100 list-unstyled font-size-h6"
								id="emailDropdown" role="menu" aria-labelledby="dLabel"
								style="top: 51px;" data-index="0">

							</ul>
						</div>

						<div class="form-group" id="passwordDiv">
							<input name="m_pwd" class="form-control" id="password"
								type="password" placeholder="비밀번호"> <span
								class="password-error help-block hidden" id="passwordcheck"
								style="color: #FF7262"> &nbsp;</span>
						</div>

						<div class="form-group" id="passwordConfirmDiv">
							<input name="password_confirm" class="form-control"
								id="password_confirm" type="password" placeholder="비밀번호 확인">
							<span class="password_confirm-error help-block hidden"
								id="passwordcon" style="color: #FF7262"></span>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading">휴대폰 인증</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-9 text-left color-dark-gray">
									본인 명의의 휴대폰으로만 인증이 가능합니다. 가입을 원하시면 <br> <span
										class="color-black">[인증하기]</span>를 클릭해주세요
								</div>
								<div class="col-xs-3 text-left">
									<a class="btn btn-default btn-sm width-100"
										id="mobileConfirmBtn" role="button"
										onclick='window.open("http://localhost:8080/kmongPro/per/check.do", "_blank", "width=652, height=682");'><strong>인증
											하기</strong></a>
								</div>
							</div>
						</div>

						<ul class="list-group color-dark-gray hidden"
							id="mobileCertificationUl">
							<li class="list-group-item" id="fullname"></li>
							<li class="list-group-item" id="birthday"></li>
							<li class="list-group-item" id="mobile"></li>

							<input name="birthday" id="certificationBirthdayInput"
								type="hidden">
							<input name="mobile" id="certificationMobileInput" type="hidden">
							<input name="fullname" id="certificationNameInput" type="hidden">
							<input name="gender" id="certificationGenderInput" type="hidden">
							<input name="conn_info_id" id="certificationConnInput"
								type="hidden">
							<input name="dupl_info_id" id="certificationDuplInput"
								type="hidden">
							<input name="isMobileCertification" id="isMobileCertification"
								type="hidden"
								value="eyJ2YWx1ZSI6InN3dXRjUlpSWkJjR0FGOHVYM2xLclE9PSJ9">
						</ul>

					</div>

					<div class="panel panel-default">
						<div class="panel-body panel-form-label">
							<div
								class="col-xs-3 col-xs-offset-2 col-xs-offset-right-3 radio-inline">
								<div class="awesome-radio">
									<label> <input name="memberType" id="personalRadioBtn"
										aria-label="개인" type="radio" checked="checked"
										value="personal"> <span class="awesome-radio-body"
										id="click2"></span>
										<div class="awesome-radio-text">개인</div>
									</label>
								</div>
							</div>
							<div class="col-xs-3 radio-inline margin-left-0 padding-left-10">
								<div class="awesome-radio">
									<label> <input name="memberType" id="companyRadioBtn"
										aria-label="기업" type="radio" value="company"> <span
										class="awesome-radio-body" id="click"></span>
										<div class="awesome-radio-text">기업</div>
									</label>
								</div>
							</div>

						</div>
					</div>


					<div class="multi-form-group hidden" id="companyDiv">
						<div class="form-group">
							<select name="company_type_id_input" class="form-control"
								id="company_type_id">
								<option value="">선택하세요</option>
								<option value="1">스타트업</option>
								<option value="2">자영업</option>
								<option value="3">중소기업</option>
								<option value="4">중견기업</option>
								<option value="5">대기업</option>
							</select> <span class="company_type_id-error help-block hidden"><i
								class="fa fa-exclamation-triangle">&nbsp;기업형태는 필수입니다.</i></span>
						</div>

						<div class="form-group">
							<input name="c_name_input" class="form-control company"
								id="c_name" type="text" placeholder="회사명"> <span
								class="c_name-error help-block hidden"><i
								class="fa fa-exclamation-triangle">&nbsp;회사명은 필수입니다.</i></span>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input name="c_rn_input"
									class="form-control company numberOnlyInput failed" id="c_rn"
									type="text" placeholder="사업자번호 '-' 없이 숫자만 입력하세요" maxlength="10">
								<span class="input-group-btn">
									<button class="btn btn-default company"
										id="companyCertificationBtn" type="button">
										<strong>인증</strong>
									</button>
								</span>
							</div>

							<span class="c_rn-error help-block hidden"><i
								class="fa fa-exclamation-triangle">&nbsp;사업자번호는 필수입니다.</i></span>
						</div>
						<input name="isCompanyCertification" id="isCompanyCertification"
							type="hidden"
							value="eyJ2YWx1ZSI6InN3dXRjUlpSWkJjR0FGOHVYM2xLclE9PSJ9">
						<input name="c_rn" id="c_rn_hidden" type="hidden"> <input
							name="c_name" id="c_name_hidden" type="hidden"> <input
							name="company_type_id" id="company_type_id_hidden" type="hidden">

					</div>

					<div class="panel panel-default margin-bottom-5">
						<div class="panel-heading">
							마일리지 코드 <span class="font-size-h6 color-dark-gray">(선택)</span>
						</div>
						<div class="form-group single-form-group">
							<input name="mileageCode" class="form-control"
								id="mileageCodeInput" type="text"
								placeholder="크몽이나 친구로부터 받은 마일리지 코드를 입력하세요" value="">
						</div>
					</div>
					<span class="help-block" id="mileageCodeValidationMsg"></span> <input
						type="text" name="m_sep" hidden="" value="" id="m_sep" />
				</form>
			</div>

			<div class="col-xs-5"
				style="padding-left: 50px; border-left-color: rgb(223, 223, 223); border-left-width: 1px; border-left-style: solid;">
				<div class="panel panel-default margin-top-0">
					<div class="panel-heading">이용약관 내용 고지</div>
					<ul class="list-group">
						<li class="list-group-item">서비스 이용약관&nbsp; <a
							class="btn btn-xs btn-default pull-right"
							href="https://kmong.com/terms_of_service" target="_blank"><small>내용보기</small></a>
						</li>
					</ul>
					<div class="panel-body signup-agreement-body">
						<p>
							제1장 총칙<br> 제1조 (목적)<br> <br> 이 약관은 주식회사 크몽(이하
							“회사”라고 합니다) 가 “크몽” 인터넷 서비스 마켓플레이스 사이트(http://www.kmong.com, 이하
							"크몽 사이트”라고 합니다)와 스마트폰 등 이동통신기기를 통해 제공되는 “크몽” 모바일 애플리케이션(이하 “모바일
							크몽”이라고 합니다)을 통하여 제공하는<br> 중개서비스 및 기타 정보서비스(이하 "서비스"라고 합니다)와
							관련하여 회사와 회원간의 권리와<br> 의무, 책임사항 및 회원의 서비스이용절차에 관한 사항을 규정함을
							목적으로 합니다.
						</p>
					</div>

					<ul class="list-group">
						<li class="list-group-item">개인정보 수집·이용&nbsp; <a
							class="btn btn-xs btn-default pull-right"
							href="https://kmong.com/privacy_policy" target="_blank"><small>내용보기</small></a>
						</li>
					</ul>
					<div class="panel-body signup-agreement-body">
						<p>
							개인정보 수집·이용 동의<br> ① 목적 및 항목<br> <br> 회사는 다음과 같은
							목적으로 개인정보를 수집하여 이용할 수 있습니다. 다만, 전자상거래 등에서의 소비자보호에 관한 법률, 국세기본법,
							전자금융거래법 등 관련법령에 따라 주민등록번호 및 은행계좌번호의 수집• 보관이 불가피한 경우에는 이용자에게 고지하여
							해당 정보를 수집할 수 있습니다.<br> 1) 일반회원<br> - 이메일주소, 휴대폰번호: 회사가
							제공하는 서비스의 이용에 따르는 본인확인 등<br> 2) 구매회원<br> - 성명, 생년월일,
							성별, 외국인등록번호, 이동전화번호, 아이디(e-mail), 비밀번호, 연계정보(CI), 중복가입정보(DI): 회사가
							제공하는 서비스의 이용에 따르는 본인확인, 민원사항처리, 회원의 서비스 이용 통계 및 설문 등<br> -
							회사명, 대표자명, 사업자등록번호, 업태, 종목, 전자세금계산서 발급용 이메일, 사업장 혹은 당당자 연락처: 사업자
							회원 서비스 제공, 부가가치세법 제32조에 따른 세금계산서 등의 발행 등<br> - 이메일 주소,
							사업장번호, 이동전화번호: 거래의 원활한 진행, 본인의사의 확인, 불만처리, 새로운 상품, 서비스 정보와 고지사항의
							안내, 회원의 서비스 이용 통계 및 설문 등<br> - 수취인 성명, 주소, 전화번호: 서비스 또는 상품과
							경품 배송을 위한 배송지 확인 등<br> - 은행계좌정보, 이동전화번호정보: 대금결제서비스의 제공 등
						</p>
					</div>
				</div>

				<div class="col-xs-12">
					<div class="row">
						<button class="btn btn-primary btn-lg btn-block" id="signup_btn">동의하고
							가입완료</button>
					</div>
					<div class="row mar_10">
						<div class="col-xs-6 text-left">
							<div class="row">
								<a href="http://localhost:8080/kmongPro/forgot_idpw.do"><h5>아이디/비밀번호찾기</h5></a>
							</div>
						</div>
						<div class="col-xs-6 text-right">
							<div class="row">
								<a href="http://localhost:8080/kmongPro/login.do"><h5>로그인</h5></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<div id="criteo-tags-div" style="display: none;"></div>

</body>
</html>