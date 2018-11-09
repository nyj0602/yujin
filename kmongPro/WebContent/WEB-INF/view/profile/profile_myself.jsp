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
<title>비지니스 파트너 크몽에 다있다! 외주, 아웃소싱 전문 | 크몽</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="css/kmong_buy.css" />
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="css/kmong_fonts.css" />
<link rel="stylesheet" href="css/kmong-a9f87b1e91.master_desktop.css" />
<link rel="stylesheet" href="css/mykmong_main.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="css/image/favicon.ico">

</head>
<script>



   
	$(document).ready(
			function() {

				$('#searchPM').each(function() {
					if ($(this).find('i.pulse')) {
						$('.pulse').next().css('display', 'none');
					}
				});

				$('.user-gigs-list').each(
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
								} else if (4.6 <= avgs && avgs <= 5.0) {
									avg = "100%";
								} else {
									avgs = "0%";
								}
								$('#Staravg').parent().prev().find(
										$('.filled-stars')).prop('style',
										'width:' + avg);
							}
						});

				$('#userInfo').each(function() {
					var avgs = $('#hiddenStar').val();

					if (0.1 <= avgs && avgs <= 0.5) {
						avgs = "10%";
					} else if (0.6 <= avgs && avgs <= 1.0) {
						avgs = "20%";
					} else if (1.1 <= avgs && avgs <= 1.5) {
						avgs = "30%";
					} else if (1.6 <= avgs && avgs <= 2.0) {
						avgs = "40%";
					} else if (2.1 <= avgs && avgs <= 2.5) {
						avgs = "50%";
					} else if (2.6 <= avgs && avgs <= 3.0) {
						avgs = "60%";
					} else if (3.1 <= avgs && avgs <= 3.5) {
						avgs = "70%";
					} else if (3.6 <= avgs && avgs <= 4.0) {
						avgs = "80%";
					} else if (4.1 <= avgs && avgs <= 4.5) {
						avgs = "90%";
					} else if (4.6 <= avgs && avgs <= 5.0) {
						avg = "100%";
					} else {
						avgs = "0%";
					}
					$('#hiddenStar').next().prop('style', 'width:' + avgs);
				});

				$('#userInfos').each(
						function() {
							var avgs = $('#AvgEvaluation').val();

							if (0.1 <= avgs && avgs <= 0.5) {
								avgs = "10%";
							} else if (0.6 <= avgs && avgs <= 1.0) {
								avgs = "20%";
							} else if (1.1 <= avgs && avgs <= 1.5) {
								avgs = "30%";
							} else if (1.6 <= avgs && avgs <= 2.0) {
								avgs = "40%";
							} else if (2.1 <= avgs && avgs <= 2.5) {
								avgs = "50%";
							} else if (2.6 <= avgs && avgs <= 3.0) {
								avgs = "60%";
							} else if (3.1 <= avgs && avgs <= 3.5) {
								avgs = "70%";
							} else if (3.6 <= avgs && avgs <= 4.0) {
								avgs = "80%";
							} else if (4.1 <= avgs && avgs <= 4.5) {
								avgs = "90%";
							} else if (4.6 <= avgs && avgs <= 5.0) {
								avg = "100%";
							} else {
								avgs = "0%";
							}
							$('#AvgEvaluation').parent().prop('style',
									'width:' + avgs);
						});
				
				$('.profile-nav-shadow').each(function (){
					var avgs = $('#AvgEvaluation').val();

					if (0.1 <= avgs && avgs <= 0.5) {
						avgs = "만족도 :  10%";
					} else if (0.6 <= avgs && avgs <= 1.0) {
						avgs = "만족도 :  20%";
					} else if (1.1 <= avgs && avgs <= 1.5) {
						avgs = "만족도 :  30%";
					} else if (1.6 <= avgs && avgs <= 2.0) {
						avgs = "만족도 :  40%";
					} else if (2.1 <= avgs && avgs <= 2.5) {
						avgs = "만족도 :  50%";
					} else if (2.6 <= avgs && avgs <= 3.0) {
						avgs = "만족도 :  60%";
					} else if (3.1 <= avgs && avgs <= 3.5) {
						avgs = "만족도 :  70%";
					} else if (3.6 <= avgs && avgs <= 4.0) {
						avgs = "만족도 :  80%";
					} else if (4.1 <= avgs && avgs <= 4.5) {
						avgs = "만족도 :  90%";
					} else if (4.6 <= avgs && avgs <= 5.0){
						avgs = "만족도 :  100%";
					}else {
						avgs = "만족도 :  0%";
					}
					
					$('#contentment').text(avgs);
				});

			});
</script>
<script>
	//descriptionView descriptionInput
	$(function() {

		//소개 수정처리		

		$(document).on("click", "#edit_introduce", function() {

			$('#descriptionView').prop('style', 'display:none');
			$('#descriptionInput').prop('style', 'display:block');
		});
		$(document).on("click", "#exit", function() {

			$('#descriptionView').prop('style', 'display:block');
			$('#descriptionInput').prop('style', 'display:none');
		});

		$(document).on(
				"click",
				"#save",
				function() {

					var param = "textarea=" + $('#textarea1').val();

					if ($('#textarea1').val().length == 0) {
						alert("입력해주세요.")
					} else {

						$.ajax({
							url : "profile.edit.do",
							dataType : 'json',
							type : 'GET',
							data : param,
							success : function(data) {
								if (data.Success == "성공") {
									$('#intros_value').html(
											$('#textarea1').val());
									$('#descriptionView').prop('style',
											'display:block');
									$('#descriptionInput').prop('style',
											'display:none');
								} else {
									alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요");
								}

							}
						});
					}
				});

		//한줄소개 수정처리
		//summaryInput summaryView
		$(document).on("click", "#pencil", function() {

			$('#summaryView').prop('style', 'display:none');
			$('#summaryInput').prop('style', 'display:block');
		});

		$(document).on("click", "#exit2", function() {

			$('#summaryView').prop('style', 'display:block');
			$('#summaryInput').prop('style', 'display:none');
		});

		$(document).on("click", "#save2", function() {

			var param = "summaryText=" + $('#summaryText').val();
			if ($('#summaryText').val().length == 0) {
				alert("입력해주세요.")
			} else {
				$.ajax({
					url : "profile.edit.do",
					dataType : 'json',
					type : 'GET',
					data : param,
					success : function(data) {
						if (data.Success == "성공") {
							$('#introText').html($('#summaryText').val());
							$('#summaryView').prop('style', 'display:block');
							$('#summaryInput').prop('style', 'display:none');
						} else {
							alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요");
						}

					}
				});
			}

		});

		/* 
		career_description_input - 경력사항 / carrerInput
		career_period_start_input - 시작일 / carrerStart
		career_period_end_input - 종료일 / carrerEnd 
		MC_SEQ	MC_CONTENT	MC_START MC_END	M_EMAIL
		 */
		//경력사항 추가버튼클릭시
		$(document).on("click", "#insertCareer", function() {

			$('#careerInput').prop('style', 'display:block');
		});
		//경력사항 추가창 취소 누를경우

		$(document).on("click", "#carrerExit", function() {

			$('#careerInput').prop('style', 'display:none');
		});
		//경력사항 추가창 저장버튼 누를경우
		$(document)
				.on(
						"click",
						"#careerSave",
						function() {
							var CareerName = $('#career_description_input')
									.val();
							var CareerStart = $('#career_period_start_input')
									.val();
							var CareerEnd = $('#career_period_end_input').val();
							var param = "carrerInput=" + CareerName
									+ "&carrerStart=" + CareerStart
									+ "&carrerEnd=" + CareerEnd

							if ($('#career_description_input').val().length == 0) {
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0');
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0 hidden');
							} else if (CareerStart.length == 0
									|| CareerEnd.length == 0) {
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0');
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0 hidden');

							} else {
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0 hidden');
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0 hidden');

								$
										.ajax({
											url : "profile.edit.do",
											dataType : 'json',
											type : 'GET',
											data : param,
											success : function(data) {
												if (data.Success == "성공") {
													$('#careerInput').prop(
															'style',
															'display:none');
													$('#careerabc')
															.append(
																	'<div class="inline-block side-info-circle"><div class="user-side-circle"></div></div><div class="panel panel-default margin-top-5 margin-bottom-10" id="careerView"><div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"><span class="pull-right licenseUserInformationEditBtnGroup">	<i class="fa fa-pencil cursor" aria-hidden="true" id="licensePencil2"></i>&nbsp; <i class="fa fa-trash cursor" aria-hidden="true" ID="careerDelete"></i></span><h5 class="margin-all-0">'
																			+ $(
																					'#career_description_input')
																					.val()
																			+ '</h5><h6 class="margin-bottom-0">'
																			+ $(
																					'#career_period_start_input')
																					.val()
																			+ '  ~   '
																			+ $(
																					'#career_period_end_input')
																					.val()
																			+ '</h6></div></div>');
													$('#careerabc')
															.append(
																	'<div class="panel panel-default margin-top-5 margin-bottom-10" style="display: none;" id="career_86474_input"> <div	class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"> <div class="row">	<div class="col-xs-12"><div class="form-group margin-bottom-0">	<input type="text" id="beforeInsertValue" name="beforeInsertValue"	class="career_description_input form-control input-xs"	placeholder="경력사항" value="'+CareerName+'"	style="width: 193px; height: 32px; font-size: 11px;"></div></div></div>	<div class="row margin-top-10">	<div class="col-xs-5 padding-right-0">	<input type="text" id="beforeInsertValue2" name="beforeInsertValue2" class="career_period_start_input form-control input-xs date-input"	id="career_period_start_86474_input" value="'+CareerStart +'"	style="width: 77px; height: 32px; font-size: 11px;"></div><div class="col-xs-2"><div class="margin-top-5">~</div></div>	<div class="col-xs-5 padding-left-0"><input type="text" id="beforeInsertValue3"	name="beforeInsertValue3"class="form-control input-xs date-input"value="'+CareerEnd +'"	style="width: 77px; height: 32px; fon-size: 11px;"></div></div><div class="row margin-top-10"><div class="col-xs-12"><div class="text-right"><a class="btn btn-default btn-xs" id="carrerExit2">취소</a><a class="btn btn-primary btn-xs margin-left-5" id="careerSave2">저장</a></div></div></div></div></div>');

												} else {
													alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요");
												}
											}
										});
							}
						});

		//경력사항 수정펜모양누를경우
		$(document).on(
				"click",
				"#licensePencil2",
				function() {
					$(this).parent().parent().parent().prop('style',
							'display:none');
					$(this).parent().parent().parent().next().prop('style',
							'display:block');
					$('#insertCareer').prop('style', 'display:none');
					$('#careerabc').find(
							$('.licenseUserInformationEditBtnGroup')).prop(
							'style', 'display:none');
				});
		//경력사항 수정창 취소누를경우
		$(document).on(
				"click",
				"#carrerExit2",
				function() {
					$('#insertCareer').prop('style', 'display:block');
					$('#careerabc').find(
							$('.licenseUserInformationEditBtnGroup')).prop(
							'style', 'display:block');
					$(this).parent().parent().parent().parent().parent().prop(
							'style', 'display:none');
					$(this).parent().parent().parent().parent().parent().prev()
							.prop('style', 'display:block');

				});
		//경력사항 수정창 저장누를경우
		$(document)
				.on(
						"click",
						"#careerSave2",
						function() {
							var inputInsert = $(this).parent().parent()
									.parent().parent().parent();

							var careerText = $(this).parent().parent().parent()
									.parent().parent().prev().find(
											$('.margin-all-0')).text();
							var editBlank = $(this).parent().parent().parent()
									.parent().parent();
							var beforeInsertValue = $(this).parent().parent()
									.parent().prev().prev().find($('input'))
									.val();
							var beforeInsertValue2 = $(this).parent().parent()
									.parent().prev().find($('input')).val();
							var beforeInsertValue3 = $(this).parent().parent()
									.parent().prev().find(
											$('input#beforeInsertValue3'))
									.val();
							var editBtnGroup = $(this)
									.parent()
									.parent()
									.parent()
									.parent()
									.parent()
									.parent()
									.find(
											$('span.licenseUserInformationEditBtnGroup'))
									.css('display', 'block');
							var editInsertBtn = $(this).parent().parent()
									.parent().parent().parent().parent().find(
											$('#insertCareer')).css('display',
											'block');

							var param = "careerText=" + careerText
									+ "&beforeInsertValue=" + beforeInsertValue
									+ "&beforeInsertValue2="
									+ beforeInsertValue2
									+ "&beforeInsertValue3="
									+ beforeInsertValue3;

							if (beforeInsertValue.length == 0) {
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0');
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0 hidden');
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find(
												$('span.licenseUserInformationEditBtnGroup'))
										.css('display', 'none');
								$(this).parent().parent().parent().parent()
										.parent().parent().find(
												$('#insertCareer')).css(
												'display', 'none');
							} else if (beforeInsertValue.length != 0
									&& beforeInsertValue2.length != 0
									&& beforeInsertValue3.length != 0) {
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0 hidden');
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0 hidden');
								$
										.ajax({
											url : "profile.edit.do",
											dataType : 'json',
											type : 'GET',
											data : param,
											success : function(data) {
												if (data.Success == "성공") {

													$('#insertCareerDiv')
															.after(
																	'<div class="inline-block side-info-circle"><div class="user-side-circle"></div></div><div class="panel panel-default margin-top-5 margin-bottom-10"	id="careerView"><div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"><span class="pull-right licenseUserInformationEditBtnGroup"><i class="fa fa-pencil cursor" aria-hidden="true" id="licensePencil2"></i>&nbsp; <i class="fa fa-trash cursor" id="careerDelete" aria-hidden="true"></i></span>	<h5 class="margin-all-0">'
																			+ beforeInsertValue
																			+ '</h5><h6 class="margin-bottom-0">'
																			+ beforeInsertValue2
																			+ " ~ "
																			+ beforeInsertValue3
																			+ '</h6></div></div><div class="panel panel-default margin-top-5 margin-bottom-10"  id="career_86474_input" style="display:none;"> <div	class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"> <div class="row">	<div class="col-xs-12"><div class="form-group margin-bottom-0">	<input type="text" id="beforeInsertValue" name="beforeInsertValue"	class="career_description_input form-control input-xs"	placeholder="경력사항" value="'+beforeInsertValue+'"style="width: 193px; height: 32px; font-size: 11px;"></div></div></div>	<div class="row margin-top-10">	<div class="col-xs-5 padding-right-0">	<input type="text" id="beforeInsertValue2" name="beforeInsertValue2" class="career_period_start_input form-control input-xs date-input"	id="career_period_start_86474_input" value="'+beforeInsertValue2 +'"	style="width: 77px; height: 32px; font-size: 11px;"></div><div class="col-xs-2"><div class="margin-top-5">~</div></div>	<div class="col-xs-5 padding-left-0"><input type="text" id="beforeInsertValue3"	name="beforeInsertValue3"class="form-control input-xs date-input"value="'+beforeInsertValue3 +'"	style="width: 77px; height: 32px; fon-size: 11px;"></div></div><div class="row margin-top-10"><div class="col-xs-12"><div class="text-right"><a class="btn btn-default btn-xs" id="carrerExit2">취소</a><a class="btn btn-primary btn-xs margin-left-5" id="careerSave2">저장</a></div></div></div></div></div>');

													$(editBlank).prop('style',
															'display:none');

													editBtnGroup;

												} else {
													alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요");
												}
											}
										});

							} else {
								$('#career_description_error')
										.prop('class',
												'career_description_error help-block color-danger padding-left-0 hidden');
								$('#career_period_start_error')
										.prop('class',
												'career_period_start_error help-block color-danger padding-left-0');
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find(
												$('span.licenseUserInformationEditBtnGroup'))
										.css('display', 'none');
								$(this).parent().parent().parent().parent()
										.parent().parent().find(
												$('#insertCareer')).css(
												'display', 'none');
							}
						});

		//--------------------------------------------------------------------------------------------------------------------------------------------------------

		//자격증 추가누를경우
		//$('#insertLicense').click(function() {
		$(document).on("click", "#insertLicense", function() {
			$('#license_83104_input').css('display', 'block');
		});
		//자격증 추가 폼 취소누를경우
		//$('#exitInsertForm').click(function() {
		$(document).on("click", "#exitInsertForm", function() {

			$('#license_83104_input').css('display', 'none');
		});

		//licenseName - 자격증명
		//licenseDay - 발급일
		//licenseCenter - 발급기간

		//자격증추가 저장버튼
		$(document)
				.on(
						"click",
						"#SaveInsertForm2",
						function() {
							var param = "licenseName="
									+ $('#license_description_83104_input')
											.val()
									+ "&licenseDay="
									+ $('#license_licensed_at_83104_input')
											.val()
									+ "&licenseCenter="
									+ $(
											'#license_licensed_provider_center_83104_input')
											.val();
							/* alert(param); */
							if ($('#license_description_83104_input').val().length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');

							} else if ($('#license_licensed_at_83104_input')
									.val().length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');
							} else if ($(
									'#license_licensed_provider_center_83104_input')
									.val().length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop('class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0');
							}

							else {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');
								$
										.ajax({
											url : "profile.edit.do",
											dataType : 'json',
											type : 'GET',
											data : param,
											success : function(data) {
												alert(data.Success);
												$('#license_83104_input').css(
														'display', 'none');
												$('#licenseDivs')
														.append(
																'<div class="panel panel-default margin-top-5 margin-bottom-10" id="license_83104_view">	<div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break"><div>	<span id="beforeContent">'
																		+ $(
																				'#license_description_83104_input')
																				.val()
																		+ '</span> <span class="pull-right licenseUserInformationEditBtnGroup"><i class="fa fa-pencil cursor" aria-hidden="true" id="licensePencil"></i>	&nbsp; <i class="fa fa-trash cursor" aria-hidden="true" id="licenseDelete"></i></span>	</div>	<h6 class="margin-bottom-0">'
																		+ $(
																				'#license_licensed_at_83104_input')
																				.val()
																		+ '/'
																		+ $(
																				'#license_licensed_provider_center_83104_input')
																				.val()
																		+ '</h6>	</div></div>');
												$('#licenseDivs')
														.append(
																'<div class="panel panel-default margin-top-5 margin-bottom-10"	id="license_80000_input" style="display: none;"><div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"><div class="row"><div class="col-xs-12"><div class="form-group margin-bottom-0"><input class="license_description_input form-control input-xs"	id="license_description_83105_input" type="text" placeholder="자격증" style="width: 193px; height: 32px; font-size: 11px;"	value="'
																		+ $(
																				'#license_description_83104_input')
																				.val()
																		+ ' "></div></div></div><div class="row margin-top-10"><div class="col-xs-6 padding-right-5"><input	class="license_licensed_at_input form-control input-xs date-input"	id="license_licensed_at_83105_input" type="text"style="width: 90px; height: 32px; font-size: 11px;"	value="'
																		+ $(
																				'#license_licensed_at_83104_input')
																				.val()
																		+ ' "></div><div class="col-xs-6 padding-left-5"><div class="form-group margin-bottom-0"><input	class="license_licensed_provider_center_input form-control input-xs" id="license_licensed_provider_center_83105_input"	type="text" placeholder="발급기관" value="'
																		+ $(
																				'#license_licensed_provider_center_83104_input')
																				.val()
																		+ ' " style="width: 90px; height: 32px; font-size: 11px;">	</div></div></div><div class="row margin-top-10"><div class="col-xs-12"><div class="text-right"><a class="btn btn-default btn-xs" id="exitInsertForm2">취소</a><a class="btn btn-primary btn-xs margin-left-5"	id="SaveInsertForm">저장</a></div>	</div></div></div></div>');

												$('#licenseView').css(
														'display', 'none');

											}
										});
							}
						});

		//자격증 수정
		$(document).on(
				"click",
				"#licensePencil",
				function() {
					$('#insertLicense').css('display', 'none');
					$('#licenseDiv').find(
							$('.licenseUserInformationEditBtnGroup')).prop(
							'style', 'display:none');
					$(this).parent().parent().parent().parent().css('display',
							'none');
					$(this).parent().parent().parent().parent().next().css(
							'display', 'block');

				});
		$(document).on(
				"click",
				"#exitInsertForm2",
				function() {
					$(this).parent().parent().parent().parent().parent().css(
							'display', 'none');

					//$(this).parent().parent().parent().parent().parent().parent().parent().find('div#license_83104_view').css('display', 'block');
					$(this).parent().parent().parent().parent().parent().prev()
							.css('display', 'block');
					$('#insertLicense').css('display', 'block');
					$('#licenseDiv').find(
							$('.licenseUserInformationEditBtnGroup')).prop(
							'style', 'display:block');
				});

		$(document)
				.on(
						"click",
						"#SaveInsertForm",
						function() {
							var beforeInput = $(this).parent().parent()
									.parent().parent().parent().prev().find(
											$('span#beforeContent')).text();
							var newlicenseNames = $(this)
									.parent()
									.parent()
									.parent()
									.parent()
									.find(
											$('input#license_description_83105_input'))
									.val();
							var newlicenseDays = $(this)
									.parent()
									.parent()
									.parent()
									.parent()
									.find(
											$('input#license_licensed_at_83105_input'))
									.val();
							var newlicenseCenter = $(this)
									.parent()
									.parent()
									.parent()
									.parent()
									.find(
											$('input#license_licensed_provider_center_83105_input'))
									.val();
							var param = "beforeInputLicense=" + beforeInput
									+ "&licneseNames=" + newlicenseNames
									+ "&licenseDay=" + newlicenseDays
									+ "&licenseCenter=" + newlicenseCenter;

							var BtnForm = $(this).parent().parent().parent()
									.parent().parent().css('display', 'none');

							var editBtnGroup = $(this)
									.parent()
									.parent()
									.parent()
									.parent()
									.parent()
									.parent()
									.find(
											$('span.licenseUserInformationEditBtnGroup'))
									.css('display', 'block');

							/* 							$('#license_description_83104_error').prop('class','license_description_error help-block color-danger padding-left-0');
							 $('#license_licensed_at_83104_error').prop('class','license_licensed_at_error help-block color-danger padding-left-0 hidden');
							 $('#license_licensed_provider_center_83104_error').prop('class','license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');
							 */

							if (newlicenseNames.length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');
								BtnForm;
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find(
												$('span.licenseUserInformationEditBtnGroup'))
										.css('display', 'none');

								$(this).parent().parent().parent().parent()
										.parent().css('display', 'block');

							} else if (newlicenseDays.length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 ');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');
								BtnForm;
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find(
												$('span.licenseUserInformationEditBtnGroup'))
										.css('display', 'none');

								$(this).parent().parent().parent().parent()
										.parent().css('display', 'block');

							} else if (newlicenseCenter.length == 0) {
								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 ');
								BtnForm;
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find(
												$('span.licenseUserInformationEditBtnGroup'))
										.css('display', 'none');

								$(this).parent().parent().parent().parent()
										.parent().css('display', 'block');

							}

							else {

								$('#license_description_83104_error')
										.prop('class',
												'license_description_error help-block color-danger padding-left-0 hidden');
								$('#license_licensed_at_83104_error')
										.prop('class',
												'license_licensed_at_error help-block color-danger padding-left-0 hidden');
								$(
										'#license_licensed_provider_center_83104_error')
										.prop(
												'class',
												'license_licensed_provider_center_error help-block color-danger padding-left-0 hidden');

								$
										.ajax({
											url : "profile.edit.do",
											dataType : 'json',
											type : 'GET',
											data : param,
											success : function(data) {
												var editInsertBtn = $(this)
														.parent()
														.parent()
														.parent()
														.parent()
														.parent()
														.parent()
														.find(
																$('a#insertLicense'))
														.css('display', 'block');

												var param = "beforeInputLicense="
														+ beforeInput
														+ "&licenseNames="
														+ newlicenseNames
														+ "&licenseDay="
														+ newlicenseDays
														+ '&licenseCenter='
														+ newlicenseCenter;

												if (data.Success == "성공") {
													BtnForm;
													editBtnGroup;
													$('#licenseDiv')
															.find(
																	$('a#insertLicense'))
															.css('display',
																	'block');
													$('#licenseDivs')
															.append(
																	'<div class="panel panel-default margin-top-5 margin-bottom-10" id="license_83104_view"><div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break"><div><span id="beforeContent">'
																			+ newlicenseNames
																			+ '</span> <span class="pull-right licenseUserInformationEditBtnGroup"><i class="fa fa-pencil cursor" aria-hidden="true" id="licensePencil"></i> &nbsp; <i class="fa fa-trash cursor" aria-hidden="true" id="licenseDelete"></i></span></div><h6 class="margin-bottom-0">'
																			+ newlicenseDays
																			+ '/  '
																			+ newlicenseCenter
																			+ '</h6></div></div>');

													$('#licenseDivs')
															.append(
																	'<div class="panel panel-default margin-top-5 margin-bottom-10"	id="license_80000_input" style="display: none;"><div class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10"><div class="row"><div class="col-xs-12"><div class="form-group margin-bottom-0"><input class="license_description_input form-control input-xs"	id="license_description_83105_input" type="text" placeholder="자격증" style="width: 193px; height: 32px; font-size: 11px;"	value="'
																	+ newlicenseNames
																	+ ' "></div></div></div><div class="row margin-top-10"><div class="col-xs-6 padding-right-5"><input	class="license_licensed_at_input form-control input-xs date-input"	id="license_licensed_at_83105_input" type="text"style="width: 90px; height: 32px; font-size: 11px;"	value="'
																	+ newlicenseDays
																	+ ' "></div><div class="col-xs-6 padding-left-5"><div class="form-group margin-bottom-0"><input	class="license_licensed_provider_center_input form-control input-xs" id="license_licensed_provider_center_83105_input"	type="text" placeholder="발급기관" value="'
																	+ newlicenseCenter
																	+ ' " style="width: 90px; height: 32px; font-size: 11px;">	</div></div></div><div class="row margin-top-10"><div class="col-xs-12"><div class="text-right"><a class="btn btn-default btn-xs" id="exitInsertForm2">취소</a><a class="btn btn-primary btn-xs margin-left-5"	id="SaveInsertForm">저장</a></div>	</div></div></div></div>');

												} else {
													alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요");
												}

											}
										});
							}

						});

		//자격증 삭제
		$(document).on(
				"click",
				"#licenseDelete",
				function() {
					var licenseName = $(this).parent().parent().parent().find(
							$('span#beforeContent')).text();
					//var licenseDay = $(this).parent().parent().parent().parent().find($('.margin-bottom-0')).text();
					var displayNone = $(this).parent().parent().parent()
							.parent().prop('style', 'display:none');

					var param = "licenseNamess=" + licenseName;
					$.ajax({
						url : "profile.edit.do",
						dataType : 'json',
						type : 'GET',
						data : param,
						success : function(data) {
							if (data.Success == "성공") {
								displayNone;
							} else {
								alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요");
							}
						}
					});
				});

		//경력삭제
		$(document).on(
				"click",
				"#careerDelete",
				function() {
					var CareerName = $(this).parent().parent().parent().find(
							$('.margin-all-0')).text();
					var displayNone = $(this).parent().parent().parent().prop(
							'style', 'display:none');

					var param = "CareerNamess=" + CareerName;
					$.ajax({
						url : "profile.edit.do",
						dataType : 'json',
						type : 'GET',
						data : param,
						success : function(data) {
							if (data.Success == "성공") {
								displayNone;
							} else {
								alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요");
							}
						}
					});
				});

	});
</script>
<script type="text/javascript">
	
</script>

<body id="master_body" style="cursor: default;">

	<div class="fake_global_body"></div>
	<div class="global-body only-yellow-header">





		<div style="display: none;"></div>

		<div id="userDiv">

			<div class="bg-color-yellow-400">
				<div class="container">
					<div class="row">
						<div
							class="col-xs-12 text-center padding-top-50 padding-bottom-50">
							<div class="row">
								<div class="col-xs-12">
									<div class="position-relative inline-block">
										<div class="user-profile overflow-hidden">
											<img title="${nickname }" class="width-100" id="thumbnail"
												style="width: 100px; height: 100px;"
												onerror="this.onerror=null;this.src='/img/tools/main_user_gray.png';"
												src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/BeJne1519018545.PNG">
										</div>

										<c:choose>
											<c:when test="${grade eq null}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_1.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 1}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_1.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 2}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_2.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 3}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_3.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 4}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_4.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 5}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_5.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
											<c:when test="${grade eq 6}">
												<div class="user-profile-ranking userProfileRanking NEW">
													<a href="https://kmong.com/grade"> <img title=""
														class="width-100" src="css/image/kmong_grade_6.png"
														data-original-title="NEW" data-toggle="tooltip"
														data-placement="right">
													</a>
												</div>
											</c:when>
										</c:choose>

										<div class="user-profile-upload text-center">
											<label class="label-margin-none cursor"
												for="thumbnail_upload"> <i
												class="fa fa-camera color-white user-profile-photo-icon-background"
												id="thumbnail_upload_icon" aria-hidden="true"></i>
											</label>
										</div>
										<input name="file" id="thumbnail_upload"
											style="display: none;" type="file">
									</div>
									<h2 class="margin-top-5">${nickname }</h2>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3"></div>
								<div class="col-xs-6">
									<div class="margin-bottom-20" id="summaryView">
										<span id='introText'>${intro }</span> <span
											style="display: none;">한줄소개가 없습니다.</span> &nbsp; <i
											class="fa fa-pencil color-primary cursor" aria-hidden="true"
											style="display: none;"></i> &nbsp; <i
											class="fa fa-pencil color-primary cursor" aria-hidden="true"
											id="pencil"></i>
									</div>
									<div id="summaryInput" style="display: none;">
										<div class="form-group position-relative">
											<input
												class="form-control user-form-control input-xs user-input-info"
												type="text" maxlength="50" id="summaryText"
												value="${intro }">
											<div class="user-input-save">
												<span class="font-size-h6"><span>0</span> / 50</span> <a
													class="btn btn-default btn-xs margin-right-5" id="exit2">취소</a>
												<a class="btn btn-primary btn-xs" id="save2">저장</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xs-3"></div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="container profile-top-nav">
				<div class="row text-center user-info-nave" id="userScrollFix">
					<div class="col-xs-5 padding-right-0">
						<div class="row">
							<div class="col-xs-6 padding-right-0">
								<div
									class="panel panel-default margin-top-0 border-radius-0 border-right-none margin-none">
									<div class="panel-body profile-nav-shadow">
										<h5 class="margin-top-5 margin-bottom-5 font-color-lighter" id="contentment"></h5>
									</div>
								</div>
							</div>
							<div class="col-xs-6 padding-left-0">
								<div
									class="panel panel-default margin-top-0 border-radius-0 border-right-none">
									<div class="panel-body profile-nav-shadow">
										<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">총
											작업수 : 0 개</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-2 padding-left-0 padding-right-0">
						<a
							class="btn btn-primary border-solid-none btn-block border-radius-0 padding-top-15 padding-bottom-15 position-relative profile-hover profile-nav-shadow"
							href='http://localhost:8080/kmongPro/profile.do?sellerID=${sellerID}&type=seller'>
							<h5 class="margin-top-5 margin-bottom-5">
								<i class="fa fa-eye" aria-hidden="true"></i> 의뢰인 시점으로 보기
							</h5>
							<div class="user-profile-arrow bg-color-primary"></div>
						</a>
					</div>
					<div class="col-xs-5 padding-left-0">
						<div class="row">
							<div class="col-xs-6 padding-right-0 margin-none">
								<div
									class="panel panel-default margin-top-0 border-radius-0 border-right-none margin-none">
									<div class="panel-body profile-nav-shadow">
										<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">평균
											응답시간 : 아직몰라요</h5>
									</div>
								</div>
							</div>
							<div class="col-xs-6 padding-left-0">
								<div
									class="panel panel-default margin-top-0 border-radius-0 margin-none">
									<div class="panel-body profile-nav-shadow">
										<h5 class="margin-top-5 margin-bottom-5 font-color-lighter">최종
											작업물 발송 : 아직몰라요</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container padding-top-45">





				<div class="row margin-top-20 margin-bottom-10">
					<div class="col-xs-7">
						<h4 class="NGB">${nickname }님의서비스</h4>
					</div>
					<div class="col-xs-2">
						<div class="text-right margin-top-5">
							<a class="btn btn-primary-reverse btn-xs"
								href="http://localhost:8080/kmongPro/ad_request.do">광고신청</a>
						</div>
					</div>
					<div class="col-xs-3"></div>
				</div>
				<div class="row">
					<div class="col-xs-9">


						<div id="userGigsDiv">


							<c:choose>
								<c:when test="${talentOX eq '1' }">
									<div class="row user-gigs-list margin-none">
										<div class="kmong-grid-3-20 margin-top-20"
											id='serviceinsertdiv'>
											<div class="bg-color-e6">
												<div class="panel-body text-center">
													<div class="user-profile overflow-hidden inline-block"
														style="margin-top: 7px !important;">
														<img class="width-100" alt="프로필 이미지"
															src="css/image/profile_serviceinsert.PNG">
													</div>
													<h4 class="text-style NGB margin-top-15 padding-bottom-30">
														서비스를 등록하여 <br> 수익을 얻어보세요!
													</h4>
													<a class="btn btn-primary btn-sm btn-block margin-top-30"
														href="https://kmong.com/my_gigs/new?target=user_profile">서비스
														등록하기</a>
												</div>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row user-gigs-list margin-none">
										<c:import
											url="http://localhost:8080/kmongPro/profile.talent.do">
											<c:param name="sellerID" value="${sellerID }"></c:param>
										</c:import>
									</div>
								</c:otherwise>
							</c:choose>
							<c:import
								url="http://localhost:8080/kmongPro/profile.evaluation.do">
								<c:param name="sellerID" value="${sellerID }"></c:param>
								<c:param name="sessionID" value="${sessionID }"></c:param>
								<c:param name="nickname" value="${nickname }"></c:param>
							</c:import>
						</div>


					</div>
					<div class="col-xs-3">



						<div
							class="border-left padding-left-10 padding-bottom-30 position-relative">
							<div class="inline-block side-info-circle">
								<div class="user-side-circle"></div>
							</div>
							<h5 class="margin-top-0 margin-bottom-5">
								<span class="NGB"> 기술 / 자격 <i title=""
									class="fa fa-question-circle"
									data-original-title="선택된 태그는 서비스 상세페이지에 노출됩니다."
									data-toggle="tooltip" data-placement="right"></i>
								</span>
							</h5>
							<div class="panel panel-default margin-top-5 margin-bottom-10"
								id="userMetadataWrapper">
								<div class="panel-body padding-all-10">
									<div class="row">
										<div class="col-xs-12" style="display: none;"></div>
										<div class="col-xs-12" id="selectedUserMetadataNone">
											등록된 태그가 없습니다.</div>
										<div class="col-xs-12 text-center"
											id="selectedUserMetadataLoading" style="display: none;">
											<div class="la-ball-fall color-black">
												<div></div>
												<div></div>
												<div></div>
											</div>
										</div>
									</div>
								</div>

								<div class="panel-body padding-all-10" style="display: none;">
									<div class="row" id="userMetadataCategorySelectWrapper">
										<div class="col-xs-12">
											<select class="form-control input-xs">

											</select>
										</div>
									</div>

									<div class="row margin-top-10" id="userMetadataSelectWrapper">
										<div class="col-xs-12">
											<div class="border-radius bg-color-fa padding-all-10">

											</div>
										</div>
									</div>

									<div class="row margin-top-10"
										id="selectedUserMetadataListWrapper">
										<div class="col-xs-12"></div>
									</div>

									<div class="row margin-top-10"
										id="userMetadataCertificationBtn" style="display: none;">
										<div class="col-xs-12">
											<button
												class="btn btn-gray-reverse font-color-light btn-sm btn-block"
												type="button" data-toggle="modal"
												data-target="#tagCertificationModal">
												<img class="user-metadata-certification-btn-img"
													src="/img/user/desktop/tag.png"> 태그 인증받기
											</button>
										</div>
									</div>
								</div>
							</div>

							<div>
								<div class="font-size-h6 color-red margin-left-5"
									id="certificatedReady" style="display: none;">
									<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
									&nbsp; 인증 심사중입니다.
								</div>
								<div class="font-size-h6 color-red margin-left-5"
									id="limitUserMetadataCntError" style="display: none;">
									<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
									&nbsp; 기술 / 자격은 5개이상 등록 할 수 없습니다.
								</div>
							</div>



							<div style="display: none;">
								<h5 class="margin-top-20">
									<span class="NGB">기술 / 자격 추천</span> <i title=""
										class="fa fa-question-circle"
										data-original-title="이 외 기술 / 자격을 추천해주세요."
										data-toggle="tooltip" data-placement="right"></i>
								</h5>
								<div class="form-group margin-bottom-0 position-relative">
									<input class="form-control input-xs" type="text"> <a
										disabled="" class="btn btn-primary font-size-h6 tag-btn">보내기</a>
								</div>
							</div>
						</div>



						<div
							class="border-left padding-left-10 padding-bottom-30 position-relative">
							<div class="inline-block side-info-circle">
								<div class="user-side-circle"></div>
							</div>

							<h5 class="margin-top-0 margin-bottom-10">
								<span class="NGB">소개</span> <span id="descriptionEditBtnGroup">
									<span class="pull-right font-size-h6" style="display: none;"><a
										class="user-edit-text" href="javascript:void(0);">+ 추가</a></span> <span
									class="pull-right font-size-h6"><a
										class="user-edit-text" id="edit_introduce">편집</a></span>
								</span>
							</h5>


							<div class="panel panel-default margin-top-5 margin-bottom-10"
								id="descriptionView">
								<div
									class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break">

									<span class="word-break" id="intros_value">${intros }</span>
								</div>
							</div>

							<div class="panel panel-default margin-top-5 margin-bottom-10"
								id="descriptionInput" style="display: none;">
								<div
									class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
									<textarea class="form-control padding-all-5 introduce-text"
										maxlength="255" placeholder="자기소개를 입력하세요." rows="5"
										id='textarea1' name="textarea">${intros }</textarea>
									<div class="text-right margin-top-10">
										<a class="btn btn-default btn-xs" id="exit">취소</a> <a
											class="btn btn-primary btn-xs margin-left-5" id="save">저장</a>
									</div>
								</div>
							</div>
						</div>


						<div
							class="border-left padding-left-10 padding-bottom-30 position-relative"
							id='careerabc'>
							<h5 class="margin-top-0 margin-bottom-10">
								<span class="NGB">경력사항</span> <span id="careerEditBtnGroup">
									<span class="pull-right font-size-h6" id="career_AddBtn"><a
										class="user-edit-text" id="insertCareer">+ 추가</a></span>
								</span>
							</h5>
							<c:choose>
								<c:when test="${empty m_career }">
									<div class="inline-block side-info-circle">
										<div class="user-side-circle"></div>
									</div>

									<div class="panel panel-default margin-top-5 margin-bottom-10"
										id="careerView">
										<div
											class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<span class="pull-right licenseUserInformationEditBtnGroup">

											</span>
											<h5 class="margin-all-0">등록된 경력사항이 없습니다.</h5>
											<h6 class="margin-bottom-0"></h6>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${m_career}" var="car" varStatus="status">

										<div class="inline-block side-info-circle"
											id="insertCareerDiv">
											<div class="user-side-circle"></div>
										</div>

										<div class="panel panel-default margin-top-5 margin-bottom-10"
											id="careerView">
											<div
												class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
												<span class="pull-right licenseUserInformationEditBtnGroup">
													<i class="fa fa-pencil cursor" aria-hidden="true"
													id="licensePencil2"></i> &nbsp; <i
													class="fa fa-trash cursor" aria-hidden="true"
													id="careerDelete"></i>
												</span>
												<h5 class="margin-all-0">${car.mc_content }</h5>
												<h6 class="margin-bottom-0">${car.mc_start }~
													${car.mc_end }</h6>
											</div>
										</div>



										<div class="panel panel-default margin-top-5 margin-bottom-10"
											style="display: none;" id="career_86474_input">
											<div
												class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
												<div class="row">
													<div class="col-xs-12">
														<div class="form-group margin-bottom-0">
															<input type="text" id="beforeInsertValue"
																name="beforeInsertValue"
																class="career_description_input form-control input-xs"
																placeholder="경력사항" value="${car.mc_content }"
																style="width: 193px; height: 32px; font-size: 11px;">
														</div>
													</div>
												</div>

												<div class="row margin-top-10">
													<div class="col-xs-5 padding-right-0">
														<input type="text" id="beforeInsertValue2"
															name="beforeInsertValue2"
															class="career_period_start_input form-control input-xs date-input"
															id="career_period_start_86474_input" maxlength="7"
															value="${car.mc_start }"
															style="width: 77px; height: 32px; font-size: 11px;">
													</div>
													<div class="col-xs-2">
														<div class="margin-top-5">~</div>
													</div>
													<div class="col-xs-5 padding-left-0">
														<input type="text" id="beforeInsertValue3"
															name="beforeInsertValue3" maxlength="7"
															class="form-control input-xs date-input"
															value="${car.mc_end }"
															style="width: 77px; height: 32px; font-size: 11px;">
													</div>
												</div>
												<div class="row margin-top-10">
													<div class="col-xs-12">
														<div class="text-right">
															<a class="btn btn-default btn-xs" id="carrerExit2">취소</a>
															<a class="btn btn-primary btn-xs margin-left-5"
																id="careerSave2">저장</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>



							<div class="panel panel-default margin-top-5 margin-bottom-10"
								id="careerInput" style="display: none;">
								<div
									class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group margin-bottom-0">
												<input
													class="career_description_input form-control input-xs"
													id="career_description_input" type="text"
													name="carrerInput" placeholder="경력사항"
													style="width: 193px; height: 32px; font-size: 11px;">
											</div>
										</div>
									</div>
									<div class="row margin-top-10">
										<div class="col-xs-5 padding-right-0">
											<input
												class="career_period_start_input form-control input-xs date-input"
												id="career_period_start_input" type="text" value="2017.03"
												name="carrerStart" maxlength="7"
												style="width: 77px; height: 32px; font-size: 11px;">
										</div>
										<div class="col-xs-2">
											<div class="margin-top-5">~</div>
										</div>
										<div class="col-xs-5 padding-left-0">
											<input class="form-control input-xs date-input" maxlength="7"
												id="career_period_end_input" type="text" name="carrerEnd"
												style="width: 77px; height: 32px; font-size: 11px;">
										</div>
									</div>
									<div class="row margin-top-10">
										<div class="col-xs-12">
											<div class="text-right">
												<a class="btn btn-default btn-xs" id="carrerExit">취소</a> <a
													class="btn btn-primary btn-xs margin-left-5"
													id='careerSave'>저장</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="margin-left-15">
								<span
									class="career_description_error help-block color-danger padding-left-0 hidden"
									id="career_description_error"><i
									class="fa fa-exclamation-triangle"></i>&nbsp;경력사항을 입력해주세요.</span> <span
									class="career_period_start_error help-block color-danger padding-left-0 hidden"
									id="career_period_start_error"><i
									class="fa fa-exclamation-triangle"></i>&nbsp;경력기간을 입력해주세요.
									(ex-2018.08)</span>
							</div>
						</div>


						<div
							class="border-left padding-left-10 padding-bottom-30 position-relative"
							id="licenseDiv">
							<div class="inline-block side-info-circle">
								<div class="user-side-circle"></div>
							</div>
							<h5 class="margin-top-0 margin-bottom-10">
								<span class="NGB">자격증</span> <span id="licenseEditBtnGroup">
									<span class="pull-right font-size-h6" id="license_AddBtn"><a
										class="user-edit-text" id="insertLicense">+ 추가</a></span>
								</span>
							</h5>

							<c:choose>
								<c:when test="${empty m_license }">
									<div class="panel panel-default margin-top-5 margin-bottom-10"
										id="licenseView">
										<div
											class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
											<h5 class="margin-all-0">자격증이 없습니다.</h5>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="position-relative" id='licenseDivs'>
										<c:forEach items="${m_license }" var="lic">
											<div
												class="panel panel-default margin-top-5 margin-bottom-10"
												id="license_83104_view">
												<div
													class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10 word-break">
													<div>
														<span id="beforeContent">${lic.ml_content }</span> <span
															class="pull-right licenseUserInformationEditBtnGroup">
															<i class="fa fa-pencil cursor" aria-hidden="true"
															id='licensePencil'></i> &nbsp; <i
															class="fa fa-trash cursor" aria-hidden="true"
															id="licenseDelete"></i>
														</span>
													</div>
													<h6 class="margin-bottom-0">${lic.ml_date }/
														${lic.ml_org }</h6>
												</div>
											</div>

											<div
												class="panel panel-default margin-top-5 margin-bottom-10"
												id="license_80000_input" style="display: none;">
												<div
													class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
													<div class="row">
														<div class="col-xs-12">
															<div class="form-group margin-bottom-0">
																<input
																	class="license_description_input form-control input-xs"
																	id="license_description_83105_input" type="text"
																	placeholder="자격증"
																	style="width: 193px; height: 32px; font-size: 11px;"
																	value="${lic.ml_content }">
															</div>
														</div>
													</div>
													<div class="row margin-top-10">
														<div class="col-xs-6 padding-right-5">
															<input
																class="license_licensed_at_input form-control input-xs date-input"
																id="license_licensed_at_83105_input" type="text"
																maxlength="7"
																style="width: 90px; height: 32px; font-size: 11px;"
																value="${lic.ml_date }">
														</div>
														<div class="col-xs-6 padding-left-5">
															<div class="form-group margin-bottom-0">
																<input
																	class="license_licensed_provider_center_input form-control input-xs"
																	id="license_licensed_provider_center_83105_input"
																	type="text" placeholder="발급기관" value="${lic.ml_org }"
																	style="width: 90px; height: 32px; font-size: 11px;">
															</div>
														</div>
													</div>
													<div class="row margin-top-10">
														<div class="col-xs-12">
															<div class="text-right">
																<a class="btn btn-default btn-xs" id="exitInsertForm2">취소</a>
																<a class="btn btn-primary btn-xs margin-left-5"
																	id="SaveInsertForm">저장</a>
															</div>
														</div>
													</div>
												</div>
											</div>

										</c:forEach>
								</c:otherwise>
							</c:choose>


							<div class="panel panel-default margin-top-5 margin-bottom-10"
								id="license_83104_input" style="display: none;">
								<div
									class="panel-body padding-top-10 padding-bottom-10 padding-left-10 padding-right-10">
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group margin-bottom-0">
												<input
													class="license_description_input form-control input-xs"
													id="license_description_83104_input" type="text"
													placeholder="자격증"
													style="width: 193px; height: 32px; font-size: 11px;">
											</div>
										</div>
									</div>
									<div class="row margin-top-10">
										<div class="col-xs-6 padding-right-5">
											<input
												class="license_licensed_at_input form-control input-xs date-input"
												id="license_licensed_at_83104_input"
												onkeydown="return false" type="text" value="2018.03"
												style="width: 90px; height: 32px; font-size: 11px;">
										</div>
										<div class="col-xs-6 padding-left-5">
											<div class="form-group margin-bottom-0">
												<input
													class="license_licensed_provider_center_input form-control input-xs"
													id="license_licensed_provider_center_83104_input"
													type="text" placeholder="발급기관"
													style="width: 90px; height: 32px; font-size: 11px;">
											</div>
										</div>
									</div>
									<div class="row margin-top-10">
										<div class="col-xs-12">
											<div class="text-right">
												<a class="btn btn-default btn-xs" id="exitInsertForm">취소</a>
												<a class="btn btn-primary btn-xs margin-left-5"
													id="SaveInsertForm2">저장</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="margin-left-15">
								<span
									class="license_description_error help-block color-danger padding-left-0 hidden"
									id="license_description_83104_error"><i
									class="fa fa-exclamation-triangle"></i>&nbsp;자격증명을 입력해주세요.</span> <span
									class="license_licensed_at_error help-block color-danger padding-left-0 hidden"
									id="license_licensed_at_83104_error"><i
									class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급일을 입력해주세요.
									(ex-2018.08)</span> <span
									class="license_licensed_provider_center_error help-block color-danger padding-left-0 hidden"
									id="license_licensed_provider_center_83104_error"><i
									class="fa fa-exclamation-triangle"></i>&nbsp;자격증 발급기관을 입력해주세요.</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div tabindex="-1" class="modal fade" id="tagCertificationModal"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="user-modal-style" role="document">
				<div class="modal-content border-radius-0">
					<div class="row padding-right-15">
						<div
							class="col-xs-4 bg-gradient-yellow padding-left-20 padding-top-35 user-modal-height">
							<div class="font-size-20 color-brown NGB">
								인증에 필요한 <br> 파일을 첨부하세요!
							</div>
							<h5 class="text-style color-brown">
								<div class="margin-top-10 color-brown">
									크몽에서 인정하는 자격 / 기술에 <br> 대해서만 인증하실 수 있습니다.
								</div>
							</h5>
						</div>
						<div
							class="col-xs-8 padding-left-20 padding-right-20 padding-top-35">
							<div class="row">
								<div class="col-xs-12 user-modal-scroll">
									<div class="row">
										<div class="col-xs-12">
											<div
												class="panel border-solid bg-color-fa border-radius-0 margin-top-0">
												<div class="panel-body padding-all-10">
													<ul class="padding-left-0 font-color-lighter margin-all-0">
														<li class="list-unstyled font-size-h6">• 첨부하신 자료는
															공개되지 않으며, 인증마크를 부여하는 용도로만 사용됩니다.</li>
														<li class="list-unstyled font-size-h6 margin-top-5">•
															조작된 서류를 첨부하여 손해가 발생될 경우, 그 책임은 전문가에게 있습니다.</li>
														<li class="list-unstyled font-size-h6 margin-top-5">•
															자료에 기재된 정보는 크몽 가입 정보와 동일해야합니다.</li>
													</ul>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="row margin-top-15">
								<div class="col-xs-12 text-right">
									<button class="btn btn-default btn-sm margin-right-10"
										type="button">닫기</button>
									<button class="btn btn-primary btn-sm" type="button">보내기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<div
		class="kmong-nps container bg-color-white border-solid border-radius margin-bottom-0 padding-all-0 work-before-box"
		id="netPromoterScoreBody" style="display: none;">
		<div class="padding-all-15" style="display: none;">
			<div class="row" id="netPromoterScoreCloseBtn">
				<div class="col-xs-12">
					<button class="close cancel-close font-size-h4"
						style="top: -5px !important;" aria-label="Close" type="button"
						data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
			</div>
			<div class="row margin-top-10">
				<div class="col-xs-12">
					<h5 class="margin-top-0 NGB line-height text-center">
						현재 이용하시는 크몽 사이트를 <br> 다른 사람들에게 추천할 의향이 얼마나 되십니까?
					</h5>
				</div>
			</div>
			<div class="row margin-top-20">
				<div class="col-xs-12">
					<div
						class="kmong-nps-graduration margin-none font-color-lighter width-100 position-relative">
						<div>
							<span>0</span>
						</div>
						<div>
							<span>1</span>
						</div>
						<div>
							<span>2</span>
						</div>
						<div>
							<span>3</span>
						</div>
						<div>
							<span>4</span>
						</div>
						<div>
							<span>5</span>
						</div>
						<div>
							<span>6</span>
						</div>
						<div>
							<span>7</span>
						</div>
						<div>
							<span>8</span>
						</div>
						<div>
							<span>9</span> <span>10</span>
						</div>
					</div>
					<div class="slider slider-horizontal" id="netPromoterScoreSlider">
						<div class="slider-track">
							<div class="slider-track-low" style="left: 0px; width: 0%;"></div>
							<div class="slider-selection" style="left: 0%; width: 0%;"></div>
							<div class="slider-track-high" style="width: 100%; right: 0px;"></div>
						</div>
						<div class="tooltip tooltip-main top hide" role="presentation"
							style="left: 0%; margin-left: 0px;">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner">0</div>
						</div>
						<div class="tooltip tooltip-min top hide" role="presentation">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner"></div>
						</div>
						<div class="tooltip tooltip-max top hide" role="presentation">
							<div class="tooltip-arrow"></div>
							<div class="tooltip-inner"></div>
						</div>
						<div tabindex="0" class="slider-handle min-slider-handle round"
							role="slider" aria-valuenow="0" aria-valuemin="0"
							aria-valuemax="10" style="left: 0%; display: none;"></div>
						<div tabindex="0"
							class="slider-handle max-slider-handle round hide" role="slider"
							aria-valuenow="0" aria-valuemin="0" aria-valuemax="10"
							style="left: 0%; display: none;"></div>
					</div>
					<input id="netPromoterScore" style="display: none;" type="text"
						value="0" data-slider-step="1" data-slider-max="10"
						data-slider-min="0" data-slider-id="netPromoterScoreSlider"
						data-value="0">
				</div>
			</div>
			<div class="row font-color-lighter margin-bottom-20">
				<div class="col-xs-6">
					<h6 class="margin-none">추천하지 않음</h6>
				</div>
				<div class="col-xs-6 text-right">
					<h6 class="margin-none">추천함</h6>
				</div>
			</div>
			<div class="row" id="netPromoterScoreQuestionBtn"
				style="display: none;">
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="1"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								서비스로의 접근 용이성 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="2"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								전문가의 서비스 퀄리티 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="3"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								서비스 품질 대비 가격의 합리성 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="4"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								웹사이트 이용 편의성 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="5"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								전문가의 응답 속도 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="6"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								크몽의 고객 응대 </span>
						</label>
					</div>
				</div>
				<div class="col-xs-12 padding-left-25 margin-top-5">
					<div class="awesome-radio">
						<label> <input name="question" class="nps-checked"
							type="radio" value="7"> <span class="awesome-radio-body"></span>
							<span class="awesome-radio-text card-font-size-default">
								기타 </span>
						</label>
					</div>
				</div>
			</div>
			<div id="netPromoterScoreMessageBody" style="display: none;">
				<div class="row margin-top-20">
					<div class="col-xs-12">
						<div class="kmong-nps-control">
							<textarea class="form-control margin-bottom-5"
								id="netPromoterScoreMessage"
								placeholder="이러한 점수를 준 주된 이유를 작성해주세요!">이러한 점수를 준 주된 이유를 작성해주세요!</textarea>
							<span class="padding-left-0 help-block" style="display: none;"><i
								class="fa fa-exclamation-triangle"></i>&nbsp;사유는 필수입니다.</span>
						</div>
					</div>
				</div>
				<div class="row margin-top-5">
					<div class="col-xs-4 col-xs-offset-4">
						<button class="btn btn-primary btn-xss btn-block"
							id="sendNetPromoterScoreBtn">보내기</button>
					</div>
				</div>
			</div>
		</div>



		<div style="display: none;">
			<div class="kmong-nps-finish position-relative">
				<div class="row">
					<div class="col-xs-12">
						<button
							class="close cancel-close font-size-h4 opacity-1 text-shadow-none font-color-light"
							style="top: 7px !important; right: 22px;" aria-label="Close"
							onclick="hideNetPromoterScoreBody()" type="button"
							data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
				</div>
				<div class="kmong-nps-finish-bg text-center">
					<div class="kmong-nps-finish-img margin-top-40">
						<img class="width-100" src="/img/kmong_nps/kmong_nps.png">
					</div>
				</div>
			</div>
			<div class="padding-all-15">
				<div class="row">
					<div class="col-xs-12 padding-top-50 padding-bottom-20">
						<h3 class="NGB line-height text-center">
							평가를 남겨주셔서 <br> 감사합니다!
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>




	<input class="dz-hidden-input"
		style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;"
		type="file" multiple="multiple">




	<div id="criteo-tags-div" style="display: none;">
		<iframe width="0" height="0"
			src="//dis.as.criteo.com/dis/dis.aspx?p=45893&amp;cb=21943862856&amp;ref=&amp;sc_r=1920x1080&amp;sc_d=24"
			style="display: none;"></iframe>
	</div>

</body>
</html>

