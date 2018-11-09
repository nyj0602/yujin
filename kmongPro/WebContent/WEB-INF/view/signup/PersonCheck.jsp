<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<script language="javascript">
	var isEdge = false;
</script>
<!-- 
<script src="/xpay/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/xpay/js/prototype.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="../css/PersonCheck_style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script>
	$(function() {
		//우측상단X버튼활성화
		$('#LGD_CANCEL').click(function() {
			window.open("about:blank", "_self");
			window.close();
		});

		// 전체선택클릭시 다른 약관버튼 다클릭
		$('#agreeYnAll').click(function() {
			var name = $('#LGD_MOBILE_SUBAUTH_NAME_TXT').val();
			var birth =  $('#LGD_MOBILE_SUBAUTH_BIRTH_TXT').val();
			var phonenum = $('#LGD_MOBILENUM_TXT').val();
			var securitynum = $('#LGD_CAPTCHA_ANSWER_TXT').val();
			/* agreeYn0~1,2,3 */
			$('#agreeYn0').click();
			$('#agreeYn1').click();
			$('#agreeYn2').click();
			$('#agreeYn3').click();
			$('#LGD_MOBILE_SUBAUTH_BIRTH').prop('value',birth);
			$('#LGD_MOBILE_SUBAUTH_NAME').prop('value',name);
			$('#LGD_MOBILENUM').prop('value',phonenum);		
		});
		
		
		// check함으로써 클래스명 추가 / 이미해당클래스명가지고있을경우 초기화
		$('#agreeYn0').click(function() {
			if ($('#agreeYn0').is('.checked') === true) {
				$(this).prop('class', '');
			} else {
				$(this).prop('class', 'checked');
			}
		});
		$('#agreeYn1').click(function() {
			if ($('#agreeYn1').is('.checked') === true) {
				$(this).prop('class', '');
			} else {
				$(this).prop('class', 'checked');
			}
		});
		$('#agreeYn2').click(function() {
			if ($('#agreeYn2').is('.checked') === true) {
				$(this).prop('class', '');
			} else {
				$(this).prop('class', 'checked');
			}
		});
		$('#agreeYn3').click(function() {
			if ($('#agreeYn3').is('.checked') === true) {
				$(this).prop('class', '');
			} else {
				$(this).prop('class', 'checked');
			}
		});

		/* LGD_MOBILE_SUBA UTH_NAME_TXT 이름
		LGD_MOBILE_SUBAUTH_BIRTH_TXT 생년월일
		LGD_MOBILENUM_TXT 휴대폰번호 */
		/* 
		LGD_MOBILE_SUBAUTH_BIRTH
		LGD_MOBILE_SUBAUTH_NAME
		LGD_MOBILENUM */
		$('#BTN_NEXT').click(
				function() {
					var name = $('#LGD_MOBILE_SUBAUTH_NAME_TXT').val();
					var birth =  $('#LGD_MOBILE_SUBAUTH_BIRTH_TXT').val();
					var phonenum = $('#LGD_MOBILENUM_TXT').val();
					var securitynum = $('#LGD_CAPTCHA_ANSWER_TXT').val();
					if ( name.length==0 || birth.length ==0 || phonenum ==0) {
						alert("이름,생년월일,휴대폰번호 공란 없이 입력해주세요.");

					} else {
						if(securitynum == 642292){
							if ($('#agreeYn0').is('.checked')
									&& $('#agreeYn1').is('.checked')
									&& $('#agreeYn2').is('.checked')
									&& $('#agreeYn3').is('.checked')) {
									alert("본인인증이 완료되었습니다.");
									memberinfo(name,birth,phonenum);	
									window.close();
							} else {
								alert("이용 및 약관동의에 체크해주셔야합니다.");
							}
						}else{
							alert("보안 숫자가 올바르지 않습니다.")
						}
					}
				});
	});
</script>
<script>
		// 입력한값 부모창에 값 전송
		function memberinfo(name,birth,num){
		
			opener.document.getElementById("certificationNameInput").value = name;
			opener.document.getElementById("certificationBirthdayInput").value= birth;
			opener.document.getElementById("certificationMobileInput").value= num;	
		}
</script>
<body>
	<input name="LGD_CUSTOM_RESULTTYPE" id="LGD_CUSTOM_RESULTTYPE"
		type="hidden" value="SUBMIT">

	<title>통신사선택 | 간편본인확인서비스 | LG U+ Biz 결제</title>



	<input name="XINTERFACE" type="hidden" value="RESIZE">
	<input name="XINTERFACE_RESIZE_WIDTH" type="hidden" value="650">
	<input name="XINTERFACE_RESIZE_HEIGHT" type="hidden" value="650">
	<div class="Wrap kt" id="Wrap">

		<div class="header" id="headerLogo">

			<h1 class="hide">간편본인확인서비스</h1>
			<a class="close" id="LGD_CANCEL" href="#"><img alt="닫기"
				src="../css/image/close.PNG"></a>
		</div>

		<!-- // Contentes -->


		<!-- 휴대폰본인확인 입력화면 start -->
		<div id="mobile_step_1">
			<ul class="seviceTab">


				<li class="app"><a id="BTN_MOBILE_APP" href="#"><span>간편본인확인
							(앱)</span></a></li>
				<li class="sms on"><a href="#"><strong>휴대폰본인확인
							(문자)</strong></a></li>

			</ul>

			<div class="body">
				<div class="container">
					<ul class="inputList">
						<li><label class="inputTit" for="userName">이름</label>
							<div class="inputCont">
								<input name="LGD_MOBILE_SUBAUTH_NAME_TXT" title="이름 입력"
									class="text size02" id="LGD_MOBILE_SUBAUTH_NAME_TXT"
									type="text" placeholder="이름" origval="" autocomplete="off">

								<select name="LGD_PEOPLE_RADIO" title="내국인/외국인"
									id="LGD_PEOPLE_RADIO" style="width: 97px;"
									onchange="javascript:setPeople('mobile_step_1', this.value);">
									<option value="1">내국인</option>
									<option value="2">외국인</option>
								</select>


							</div></li>
						<li><label class="inputTit" for="userNum">생년월일</label>
							<div class="inputCont">
								<input name="LGD_MOBILE_SUBAUTH_BIRTH_TXT" title="생년월일 입력"
									class="text size02" id="LGD_MOBILE_SUBAUTH_BIRTH_TXT"
									type="text" maxlength="8" placeholder="ex. 19800101" origval=""
									autocomplete="off"> <span class="radio"
									id="LGD_GENDER_RADIO" role="radiogroup" aria-label="성별">

									<a tabindex="0" id="LGD_GENDER_1" role="radio"
									aria-checked="false" href="#">남</a><a
									tabindex="-1" id="LGD_GENDER_2" role="radio"
									aria-checked="false" href="#">여</a>


								</span>
							</div></li>
						<li><label class="inputTit" for="userPhoneNum">휴대폰번호</label>
							<div class="inputCont">
								<input name="LGD_MOBILENUM_TXT" title="휴대폰번호 입력"
									class="text size01" id="LGD_MOBILENUM_TXT"
									type="tel" maxlength="11" placeholder="'-' 제외하고 숫자만 입력"
									origval="" autocomplete="off">
							</div></li>
					</ul>
				</div>

				<div class="container captcha">
					<div class="captchaImg">
						<img id="captcha" alt="보안숫자(음성듣기를 확용해주십시오)"
							src="../css/image/numbercheck.PNG"> <span class="btnimg">
							<a title="보안숫자 음성듣기" class="sound"
							 href="#">보안숫자 음성듣기</a> <a
							title="보안숫자 새로고침" class="refresh" id="LGD_CAPTCHA_RELOAD"  href="#">보안숫자
								새로고침</a>
						</span>
					</div>
					<div class="captchaText">
						<label class="inputTit" for="captchaText">보안숫자 입력</label> <input
							name="LGD_CAPTCHA_ANSWER_TXT" title="보안숫자 입력" class="text"
							id="LGD_CAPTCHA_ANSWER_TXT"
							type="text" maxlength="6" autocomplete="off">
					</div>
				</div>

				<div class="terms">
					<ul class="termsList">
						<li><label><input name="agreeYn0" title="개인정보이용동의 선택"
								id="agreeYn0" type="checkbox">개인정보이용동의</label> <a
							title="개인정보이용동의 전문보기-새창" class="btnDetail" href="#">전문보기</a></li>
						<li><label><input name="agreeYn1"
								title="고유식별정보처리동의 선택" id="agreeYn1" type="checkbox">고유식별정보처리동의</label>
							<a title="고유식별정보처리동의 전문보기-새창" class="btnDetail" href="#">전문보기</a></li>
						<li><label><input name="agreeYn2"
								title="서비스이용약관동의 선택" id="agreeYn2" type="checkbox">서비스이용약관동의</label>
							<a title="서비스이용약관동의 전문보기-새창" class="btnDetail" href="#">전문보기</a></li>
						<li><label><input name="agreeYn3"
								title="통신사이용약관동의 선택" id="agreeYn3" type="checkbox">통신사이용약관동의</label>
							<a title="통신사이용약관동의 전문보기-새창" class="btnDetail" href="#">전문보기</a></li>
					</ul>
					<p class="assentAll">
						<label><input name="agreeYnAll" title="휴대폰본인확인 전체동의 선택"
							id="agreeYnAll" type="checkbox">휴대폰본인확인 전체동의</label>
					</p>
				</div>

				<p class="btnWrap">
					<a class="btn cancel" id="BTN_MOBILE_SELECT" href="#">취소</a> <a
						class="btn prog" id="BTN_NEXT" href="#">확인</a>
				</p>

			</div>
		</div>
		<!-- 휴대폰본인확인 입력화면 end -->

		<!-- 휴대폰본인확인 인증번호 화면 start -->
		<div id="mobile_step_2" style="display: none;">
			<ul class="seviceTab">


				<li class="app"><a id="BTN_MOBILE_APP_1" href="#"><span>간편본인확인
							(앱)</span></a></li>
				<li class="sms on"><a href="#"><strong>휴대폰본인확인
							(문자)</strong></a></li>

			</ul>

			<div class="body">

				<div class="container">
					<ul class="inputList">
						<li><label class="inputTit" for="code">인증번호</label>
							<div class="inputCont">
								<input name="LGD_MOBILEAUTHNUMBER_TXT" title="인증번호 입력"
									class="text size03" id="LGD_MOBILEAUTHNUMBER_TXT""
									type="text" maxlength="6" autocomplete="off"> <strong
									class="certifiTime" id="LGD_TIC_COUNT">03:00</strong> <a
									name="RE_BTN_AUTH" class="resms" id="RE_BTN_REAUTH"
									href="#">재전송</a>
							</div></li>
					</ul>
				</div>

				<ul class="notice">
					<li>3분 이내로 인증번호(6자리)를 입력해 주세요.</li>
					<li>입력시간 초과시 "재전송" 버튼을 눌러주세요.</li>
				</ul>

				<p class="btnWrap">
					<a class="btn prog" id="BTN_MOBILE_AUTH" href="#">확인</a>
				</p>

			</div>
		</div>
		<!-- 휴대폰본인확인 인증번호 화면 end -->


		<!-- Contentes // -->

		<div class="footer">
			<p class="img" id="banner_img"></p>
			<p class="text">
				<a title="이용약관 전문보기-새창"
					href="#">이용약관</a> | <a title="개인정보취급방침 전문보기-새창" id="policy"
					href="javascript:openPopup('http://www.kt.com/etc/privacy.jsp');">개인정보취급방침</a>
				| Verisign 129-bit SSL 암호화 적용 <span class="copy">LG유플러스</span>
			</p>
		</div>
		<div id="audioCaptchaDv" style="display: none;"></div>
	</div>
	<form action="http://localhost:8080/kmongPro/per/checked.do">
		<input name="LGD_MOBILE_SUBAUTH_BIRTH" id="LGD_MOBILE_SUBAUTH_BIRTH"
			type="hidden" value="">
		<!-- 생년월일 -->
		<input name="LGD_MOBILE_SUBAUTH_NAME" id="LGD_MOBILE_SUBAUTH_NAME"
			type="hidden" value="">
		<!-- 이름 -->
		<input name="LGD_MOBILENUM"
			id="LGD_MOBILENUM" type="hidden" value="">
			<!-- 전화번호 -->
	
	</form>

</body>
</html>