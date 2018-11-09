
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../mykmong/mykmong_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="subject" content="크몽 - 당신의 비즈니스를 도와드립니다 " />
<meta name="keywords"
	content="재능기부, 재능마켓, 재능기부사이트, 웹에이전시, 재택알바사이트, 자택알바, 직장인투잡알바, 창업사이트, 재택부업, 부업사이트, 재택근무알바, 직장인부업">
<meta name="description"
	content="디자인, 마케팅, 프로그래밍, 영상제작 등 각 분야 5천 여명의 전문가들이 비즈니스에 도움을 드립니다.">
<title>판매관리 크몽 - 당신의 비즈니스를 도와드립니다</title>


<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/kmong-99952b2854.master_desktop.css" rel="stylesheet">
<link href="../css/kmong_desktop_v2-6ec7c3f31e.css" rel="stylesheet">
<link href="../css/kmong_fonts.css" rel="stylesheet">
<link href="../css/mykmong_main.css" rel="stylesheet">
<link href="../css/kmong_buy.css" rel="stylesheet">
<link href="../css/myservice.css" rel="stylesheet">
<link rel="shortcut icon" href="../image/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body id="master_body">

	<div class="container">
		<div class="row margin-top-30">
			<div class="col-xs-12">
				<h2>
					<b>판매</b>
				</h2>
			</div>
		</div>



		<div class="row margin-top-10">

			<%@ include file="inc/sell_profile.jsp"%>
			<div class="col-xs-9">
				<div class="row">
					<div class="col-xs-12">
						<h3 class="header-margin-none NGB">나의 서비스</h3>
					</div>
				</div>


				<div class="row margin-top-20">
					<div class="col-xs-12">
												<form>
						<ul class="tab-menu-underline list-inline margin-bottom-0"
							role="tablist">
							
							<li role="presentation" class="margin-right-10 position-relative  ${state eq '' ? 'active' : '' }  ">
								<a class="plain font-color-lighter font-size-h5" href="myservice.do?state=전체" aria-controls="active"> 전체&nbsp; 
								<span class="border-round selling-history-message-count  ${state eq '' ? 'active' : '' } ">${servcnt[0] }</span>
								</a>
							</li>
							
							
							<li role="presentation" class="margin-right-10 position-relative ${state eq '판매중' ? 'active' : '' } ">
								<a class="plain font-color-lighter font-size-h5" href="myservice.do?state=판매중" aria-controls="active"> 판매중&nbsp; 
								<span class="border-round selling-history-message-count ${state eq '판매중' ? 'active' : '' }">${servcnt[1] }</span>
								</a>
							</li>
							
							
							<li role="presentation" class="margin-right-10 position-relative ${state eq '승인대기중' ? 'active' : '' } ">
								<a class="plain font-color-lighter font-size-h5" href="myservice.do?state=승인대기중" aria-controls="active"> 승인대기중&nbsp; 
								<span class="border-round selling-history-message-count ${state eq '승인대기중' ? 'active' : '' }">${servcnt[2] }</span>
								</a>
							</li>
							
							
							<li role="presentation" class="margin-right-10 position-relative ${state eq '판매중지' ? 'active' : '' } ">
								<a class="plain font-color-lighter font-size-h5" href="myservice.do?state=판매중지" aria-controls="active"> 판매중지&nbsp; 
								<span class="border-round selling-history-message-count ${state eq '판매중지' ? 'active' : '' }">${servcnt[3] }</span>
								</a>
							</li>
							
							
							<li role="presentation" class="margin-right-10 position-relative ${state eq '비승인' ? 'active' : '' } ">
								<a class="plain font-color-lighter font-size-h5" href="myservice.do?state=비승인" aria-controls="active"> 비승인&nbsp; 
								<span class="border-round selling-history-message-count ${state eq '비승인' ? 'active' : '' }">${servcnt[4] }</span>
								</a>
							</li>

							<c:choose>
							<c:when test="${mem eq 'sell' }">

							<li class="pull-right inline-block overflow-hidden">

								<div class="pull-left padding-right-15" style="margin-top: 2px;">
									<div class="position-relative font-size-h5">
										휴가모드 <i class="fa fa-question-circle vacation-tooltip-position" aria-hidden="true" data-toggle="tooltip" rel="tooltip-text" data-html="true" title="* 문의 구매 버튼이 비활성화된 상태로 서비스가 노출됩니다. * 지정된 기간 안에 돌아오지 않을 경우,   서비스 노출이 중단됩니다. * 휴가 기간 동안에는 서비스 수정이 불가능합니다.* 휴가모드 설정 변경 시, 서비스 노출 및 판매가 가능합니다. " data-placement="right"></i>
									</div>
								</div>
								
								<div class="pull-left margin-left-15" style="margin-top: 1px;" id="vacabtn">
									<label class="vacation-switch-sm margin-top-0"> 
									<input name="v_state" id="vacationToggle" type="checkbox" ${v_state eq '휴가'? 'checked' : '' }>
										<div class="vacation-switch-slider-sm round"></div>
									</label>
								</div>
							
								<div class="pull-left margin-left-15">
									<a class="btn btn-xss btn-black btn-xs"
										href="#">광고신청</a>
								</div>
							</li>
							
							</c:when>
							</c:choose>
							

							
						</ul>
													</form>
					</div>
				</div>
				
				

<style>
									
.vacation-text .tooltip-inner {
	padding: 10px;
	max-width: 320px;
	text-align: left;
	width: 320px;
	margin: 20px 0;
	white-space: pre-wrap;
}
</style>

<script type="text/javascript">
$(function (){
	
	$('#vacabtn').on("click", function (event){
		event.preventDefault();
		if ( $('#vacationToggle').prop("checked")=== false ) {
			$('#vacationActiveModal').css("display", "block");
			$('#vacationActiveModal').css("background-color", "rgba(0,0,0,0.4)");
		}
		else{
	
			$.ajax({
				url:"vacation.do",
				dataType:'json',
				type:'post',
				success:function(data){
					$('#vacationToggle').prop("checked", false);
					$('#vacsweet').css("display", "block");
					$('#sweetvac').css("display", "block");
				}
				});
		}
				
	});
	
	
	$('#sweetbtn').on("click", function (){
		
		$('#vacsweet').css("display", "none");
		$('#sweetvac').css("display", "none");
	});
	
	
	$('#vacationRequestButton').on("click", function (){
		
		var params = $('#vacationRequestForm').serialize();
		
		$.ajax({
		url:"vacation.do",
		dataType:'json',
		type:'post',
		data: params,
		success:function(data){
			$('#vacationActiveModal').css("display", "none");
			$('#vacationToggle').prop("checked", true);
		}
		});
	});
	
	
	
});

</script>
<div id="sweetvac" class="sweet-overlay" tabindex="-1" style="opacity: 1.06; display: none;"></div>
<div id="vacsweet" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning" style="display: none;">
      <span class="sa-body"></span>
      <span class="sa-dot"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success animate" style="display: block;">
      <span class="sa-line sa-tip animateSuccessTip"></span>
      <span class="sa-line sa-long animateSuccessLong"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>휴가복귀</h2>
    <p style="display: block;">휴가에서 돌아오신걸 환영합니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button class="cancel" tabindex="2" style="display: none; box-shadow: none;">Cancel</button>
      <div class="sa-confirm-button-container">
        <button id="sweetbtn" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(140, 212, 245); box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">확인</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>


<div id="sweetdelete" class="sweet-overlay" tabindex="-1" style="opacity: 1.1; display: none;"></div>
<div id="deletesweet" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning pulseWarning" style="display: block;">
      <span class="sa-body pulseWarningIns"></span>
      <span class="sa-dot pulseWarningIns"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">
      <span class="sa-line sa-tip"></span>
      <span class="sa-line sa-long"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>서비스를 삭제하시겠습니까?</h2>
    <p style="display: block;">삭제한 서비스는 되돌릴 수 없습니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button id="nobtn" class="cancel" tabindex="2" style="display: inline-block; box-shadow: none;">취소</button>
      <div class="sa-confirm-button-container">
        <button id="yesbtn" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(221, 107, 85); box-shadow: rgba(221, 107, 85, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">삭제</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>
    
    
    
    <div id="sweetcancel" class="sweet-overlay" tabindex="-1" style="opacity: 1.1; display: none;"></div>
   <div id="cancelsweet" class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="false" data-animation="pop" data-timer="null" style="display: none; margin-top: -175px;"><div class="sa-icon sa-error animateErrorIcon" style="display: block;">
      <span class="sa-x-mark animateXMark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning pulseWarning" style="display: none;">
      <span class="sa-body pulseWarningIns"></span>
      <span class="sa-dot pulseWarningIns"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">
      <span class="sa-line sa-tip"></span>
      <span class="sa-line sa-long"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>취소완료</h2>
    <p style="display: block;">서비스 삭제가 취소되었습니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button class="cancel" tabindex="2" style="display: none; box-shadow: none;">Cancel</button>
      <div class="sa-confirm-button-container">
        <button id="cancelok" class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(140, 212, 245); box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;">OK</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div> 
    
    
    
    
    

				<div class="row">
					<div class="col-xs-12">
						
						<c:choose>
						<c:when test="${mem ne 'sell' }">
						<div class="border-solid text-center padding-top-70 padding-bottom-70 margin-top-20">
                        	<h5 class="font-color-lighter line-height">등록한 서비스가 없습니다.<br> 서비스를 등록하여 판매를 시작해보세요!
                            </h5>
                            <a class="btn btn-primary padding-top-10 padding-bottom-10 padding-right-20 padding-left-20 margin-top-5" href="https://kmong.com/my_profile/certification?auth_type=seller&amp;target=NEW">
                            	판매 시작하기
                            </a>
                        </div>
						</c:when>
						<c:when test="${mem eq 'sell'}">
						
						
						<c:set var="myservice" value="${myserv.myservice }"/>
						<c:choose>
						<c:when test="${ empty myservice }">
						<div class="row margin-top-20">
                        	<div id="withdrawnList" class="col-xs-12">
	                            <div class="border-solid text-center padding-top-65 padding-bottom-65">
                                    <div>
                                        <img class="width-50px" src="../image/nothing.png" title="내역없음">
                                    </div>
                                    <h5 class="NGR font-color-lighter">내역이 없습니다.</h5>
                                </div>
                            </div>
                   		</div>
						</c:when>
						<c:when test="${not empty myservice }">
						<c:forEach var="myservice" items="${myservice }">
						
						<div class="panel panel-default border-radius-none ">
							<div class="panel-body border-radius-none padding-left-15 padding-right-15 padding-top-0 padding-bottom-0">
								<div class="row">
									<a class="plain" href=#">
										<div class="col-xs-3 padding-right-0 padding-left-0 text-center position-relative">
											
											
											<div class="position-absolute text-left my-gigs-status-position">
												<div class="row">
													<div class="col-xs-12">
														<label class="margin-none label ${myservice.ts_name eq '판매중' ? 'label-gig-status-selling': myservice.ts_name eq '임시저장' ? 'label-gig-status-temp' : myservice.ts_name eq '승인대기중' ? 'label-gig-status-waiting' : myservice.ts_name eq '판매중지' ? 'label-gig-status-suspend' : 'label-gig-status-rejected' } border-radius-none">
															${myservice.ts_name }
														</label>
													</div>
												</div>
											</div>
											<img class="width-100" src="${myservice.image }" title=${myservice.t_name } onError="this.onerror=null;this.src='../image/no_gig_sm_image.jpg'">

										</div>
									</a>
									
									
									<div class="col-xs-9 padding-top-10 padding-left-15 padding-right-15 padding-bottom-10">
										<div class="row">
											<div class="col-xs-12 position-relative">
												<div class="dropdown">
													<div class="position-absolute my-gigs-settings">
													<!-- 97256 = 재능코드 -->
														<i id="gigSettingDropdownBtn_97256" class="fa fa-cog font-size-h4 cursor gigSettingDropdownBtn" aria-hidden="true" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>

														<ul class="dropdown-menu my-gigs-settings-dropdown-menu" aria-labelledby="gigSettingDropdownBtn_97256">
															<c:choose>
															<c:when test="${myservice.ts_name eq '판매중' }">
															<li class="cursor">
																<a id="stopbtn" title="${myservice.t_seq }">판매일시중지</a>
															</li>
															</c:when>
															</c:choose>
															<li>
																<a href="#">서비스편집</a>
															</li>
															<li class="cursor"> 
																<a id="deletebtn" title="${myservice.t_seq }">서비스삭제</a>
															</li>
														</ul>
														
													</div>
												</div>
												
												<script type="text/javascript">
												$(function (){
													
													$('#stopbtn').on("click", function (){
														var t_seq = $(this).prop("title");
														$.ajax({
															url:"editserv.do",
															dataType:'json',
															type:'post',
															data: {
																t_seq : t_seq,
																state : "stop"
																},
															success:function(data){
																location.reload();
															}
															});
														
													});
													
																	
												
												$('#deletebtn').on("click", function (){
												
													$('#deletesweet').css("display", "block");
													$('#sweetdelete').css("display", "block");
													
												});
												
												$('#nobtn').on("click", function (){
													
													$('#deletesweet').css("display", "none");
													$('#sweetdelete').css("display", "none");
													$('#cancelsweet').css("display", "block");
													$('#sweetcancel').css("display", "block");
												});
											
												$('#cancelok').on("click", function (){
													$('#cancelsweet').css("display", "none");
													$('#sweetcancel').css("display", "none");
												});
												
												$('#yesbtn').on("click", function (){
													
													var tseq = $('#deletebtn').prop("title");
													console.log(tseq);
													$.ajax({
														url:"editserv.do",
														dataType:'json',
														type:'post',
														data: {t_seq : tseq},
														success:function(data){
															$('#sweetdelete').css("display", "none");
															$('#deletesweet').css("display", "none");
															location.reload();
														}
														});
													
												});
												

												});
												
												
												</script>
												
												
												<!-- 카테고리 분류 나타내는 부분 -->
												<a class="plain" href="#">
													<h6 class="font-color-lighter header-margin-none">
														#${myservice.t_seq } &nbsp;&nbsp;|&nbsp;&nbsp; ${myservice.cate } &nbsp;
														<span class="font-color-lighter">></span>&nbsp;${myservice.subcate } &nbsp;
														<c:choose>
														<c:when test="${myservice.opcate eq ' ' }"> </c:when>
														<c:when test="${myservice.opcate ne ' ' }">
														<span class="font-color-lighter">></span>&nbsp;${myservice.opcate }
														</c:when>
														</c:choose>
													</h6>


													<h5 class="word-break margin-top-5 line-clamp-default-2 margin-bottom-0">${myservice.t_name }</h5>
													
													<h3 class="border-bottom-solid padding-bottom-10 margin-top-5">
														<b>가격&nbsp;${myservice.op_price } ~</b>
													</h3>
													
													<h6 class="font-color-lighter margin-bottom-0 margin-top-15">
														판매완료 : ${myservice.sellcnt } 건
														
														<!-- *** -->
														<c:choose>
														<c:when test="${myservice.cate eq '핸드메이드' }">
														<a class="font-size-h6 pull-right text-underline font-color-light infobtn infocheck">
															안내확인&nbsp;
															<i id="gigAuthenticReasonArrow_96913" class="fa fa-chevron-circle-down font-color-yellow-400"></i>
														</a>
																								

														<!-- *** -->
														
													</h6>
													
													
												</a>
											</div>
										</div>
									</div>
								</div>

								<div class="row padding-all-15 info"> 
									<div class="col-xs-12 padding-all-0">
										<div class="media">
											<div class="media-body position-relative">
												<div style="border: 1px solid #fff4b9;"
													class="bg-color-light-yellow border-yellow padding-all-10">
													1. <br /> 작품의 상세사진, 패키지 사진 등 다양한 이미지로 등록 부탁드립니다.<br /> <br />
													2. <br /> 최대한 고해상도의 제품이 잘 소개 된 퀄리티 높은 이미지 연출컷을 사용해주세요.<br />
													이미지 퀄리티에 따라 아무리 좋은 서비스라도 비승인 될 수 있음을 양해부탁드립니다.
												</div>
											</div>
										</div>
									</div>
								</div>
								

								</c:when>
								<c:when test="${myservice.cate ne '핸드메이드' }">
								</h6>
													
													
												</a>
											</div>
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>




							</div>
						</div>
						


						</c:forEach>
						</c:when>
						</c:choose>
						
						
						
						</c:when>
						</c:choose>
						
												
				
	<script type="text/javascript">

$(function (){
	
	$('.infocheck').on("click", function (){
		console.log($('.info').css("display"));
		var display = $('.info').css("display");
		console.log(display);
		
		if (display == "none" )  $('.info').css("display", "block");
		else $('.info').css("display", "none");
		

		
	});
	
	
});

</script>					
						<c:choose>
						<c:when test="${state ne '판매중지' and state ne '비승인' and mem eq 'sell'}">
						<a href="#">
							<div class="border-my-gigs-new margin-top-20 text-center font-color-lighter my-gigs-new-wrapper">
								<div class="row">
									<div class="col-xs-12">
										<i class="fa fa-plus fa-2x"></i>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">서비스 등록하기</div>
								</div>
							</div>
						</a>

		
						</c:when>
						</c:choose>
						
						
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<span class="pull-right font-size-h6">
									<a class="font-color-light cursor" id="statebtn">
									<i class="fa fa-flag"></i>&nbsp;상태 별 의미가 궁금하신가요?
									</a>
								</span>
							</div>
						</div>

						<div class="text-center"></div>

					</div>
				</div>

			</div>
		</div>


		<div id="checkStatusModal" class="modal fade modal-square in" style="display:none" tabindex="-1" role="dialog" aria-hidden="false">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body position-relative">
						<div class="position-absolute close" id="stateclose"
							style="top: 15px; right: 30px;" data-dismiss="modal"
							aria-label="Close">
							<i class="fa fa-close fa-lx cursor"></i>
						</div>
						<h2 class="text-center NGB">상태값 확인하기</h2>
						<ul class="list-unstyled margin-top-30">
							<li class="margin-top-5">
								<div class="row">
									<div class="col-xs-2 padding-right-0 padding-left-0">
										<label style="border-radius: 0 !important;"
											class="label display-block margin-all-0 padding-top-5 padding-bottom-5 label-gig-status-waiting border-radius-none">승인대기중</label>
									</div>
									<div class="col-xs-10 padding-right-0">
										크몽팀이 서비스를 검수 중인 상태로, 회원들에게 서비스가 노출되지 않습니다.<br />(기존 서비스를
										편집/수정한 경우, 승인대기중에도 서비스가 노출됩니다.)
									</div>
								</div>
							</li>
							<li class="margin-top-5">
								<div class="row">
									<div class="col-xs-2 padding-right-0 padding-left-0">
										<label
											class="label display-block NGB margin-all-0 padding-top-5 padding-bottom-5 label-gig-status-selling border-radius-none">판매중</label>
									</div>
									<div class="col-xs-10 padding-right-0">판매가 진행 중인 상태로,
										회원들에게 서비스가 노출됩니다.</div>
								</div>
							</li>
							<li class="margin-top-5">
								<div class="row">
									<div class="col-xs-2 padding-right-0 padding-left-0">
										<label
											class="label display-block NGB margin-all-0 padding-top-5 padding-bottom-5 label-gig-status-rejected border-radius-none">비승인</label>
									</div>
									<div class="col-xs-10 padding-right-0">서비스검수 과정 중 수정 요청
										사항이 발견되어 비승인된 상태로, 회원들에게 서비스가 노출되지 않습니다.</div>
								</div>
							</li>
							<li class="margin-top-5">
								<div class="row">
									<div class="col-xs-2 padding-right-0 padding-left-0">
										<label
											class="label display-block NGB margin-all-0 padding-top-5 padding-bottom-5 label-gig-status-suspend border-radius-none">판매중지</label>
									</div>
									<div class="col-xs-10 padding-right-0">판매가 일시적으로 중단되어
										회원들에게 서비스가 노출되지 않는 상태입니다.</div>
								</div>
							</li>
							<li class="margin-top-5">
								<div class="row">
									<div class="col-xs-2 padding-right-0 padding-left-0">
										<label
											class="label display-block NGB margin-all-0 padding-top-5 padding-bottom-5 label-gig-status-temp border-radius-none">임시저장</label>
									</div>
									<div class="col-xs-10 padding-right-0">서비스 등록이 완료되지
										않았습니다.</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>



<script type="text/javascript">


	$('#statebtn').on("click", function (){
		$('#checkStatusModal').css("background-color", "rgba(0,0,0,0.4)");
		$('#checkStatusModal').css("display", "block");
		
	});
	
	$('#stateclose').on("click", function (){
		$('#checkStatusModal').css("display", "none");
		
	});
	
</script>


	<div id="vacationActiveModal" class="modal fade modal-square in" role="dialog" style="display: none">
		<div class="container margin-top-100">
			<div class="row margin-top-100">
				<div class="col-xs-2"></div>
				<div class="col-xs-8">
					<div class="vacation-modal-dialog">

						<!-- Modal content-->
						<div class="modal-content text-left">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span id="vacclose"  aria-hidden="true">&times;</span>
								</button>
								<h3 class="modal-title padding-left-15 line-block NGB">휴가모드
									설정</h3>
							</div>

							<div
								class="modal-body padding-left-30 padding-right-30 padding-top-15 padding-bottom-15">

								<form method="POST" action="vacation.do"
									accept-charset="UTF-8" id="vacationRequestForm">
									<div class="multi-form-group">
										<div>
											<h4 class="margin-top-0">1) 의뢰인분들께 노출될 휴가 사유</h4>
										</div>

										<div class="margin-top-15">
											<select class="form-control vacation-select"
												name="vacation_reason">
												<option value="">선택하세요.</option>
												<option value="주문 폭주로 인해 잠시 판매를 중단합니다.">주문 폭주로 인해 잠시 판매를 중단합니다.
                                                </option>
												<option value="휴가로 인해 잠시 판매를 중단합니다.">휴가로 인해 잠시 판매를 중단합니다.</option>
												<option value="개인 사정으로 잠시 판매를 중단합니다.">개인 사정으로 잠시 판매를 중단합니다.</option>
											</select> <span class="help-block hidden"><i
												class="fa fa-exclamation-triangle font-size-h4">&nbsp;휴가
													사유를 선택해주세요.</i></span>
										</div>


										<div class="margin-top-30">
											<h4>2) 휴가 기간</h4>
										</div>
										<div class="margin-top-15">
											<select class="form-control vacation-select period"
												name="vacation_period">
												<option value="">선택하세요.</option>
												<option value="1">1일
                                                    (${datearr[0]} 까지)
                                                </option>
												<option value="2">2일
                                                    (${datearr[1]} 까지)
                                                </option>
												<option value="3">3일
                                                    (${datearr[2]} 까지)
                                                </option>
												<option value="4">4일
                                                    (${datearr[3]} 까지)
                                                </option>
												<option value="5">5일
                                                    (${datearr[4]} 까지)
                                                </option>
												<option value="6">6일
                                                    (${datearr[5]} 까지)
                                                </option>
												<option value="7">1주일
                                                    (${datearr[6]} 까지)
                                                </option>
												<option value="14">2주일
                                                    (${datearr[7]} 까지)
                                                </option>
												<option value="21">3주일
                                                    (${datearr[8]} 까지)
                                                </option>
												<option value="30">30일
                                                    (${datearr[9]} 까지)
                                                </option>
											</select> <span class="help-block hidden"><i
												class="fa fa-exclamation-triangle font-size-h4">&nbsp;휴가
													기간을 선택해주세요.</i></span>
										</div>
									</div>
								</form>

								<div class="margin-top-20">
									<div class="row">
										<div class="col-xs-8">
											<p class="padding-left-10 my-gigs-left-border">
												지정된 기간 안에 판매모드로 전환하지 않을경우,<br /> 서비스 노출이 자동으로 중단됩니다.
											</p>
										</div>
										<div class="col-xs-4 text-right">
											<button id="vacationRequestButton" type="button"
												class="btn btn-primary btn-sm width-100px">신청</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-2"></div>
			</div>
		</div>
	</div>

<script type="text/javascript">
$('#vacclose').on("click", function (){
	$('#vacationActiveModal').css("display", "none");
	
});
</script>

</body>
</html>
<%@ include file="../inc/footer/footer_notice.jsp" %>
<%@ include file="../inc/footer/footer.jsp" %>