<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 3. 15. - 오후 12:06:52</title>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../css/image/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
.padding-mutual-cancellation {
	padding-top: 31px !important;
	padding-bottom: 31px !important;
}
</style>
<style>
.navbar {
	margin-bottom: 0 !important;
}
</style>
</head>
<body id="master_body" class="modal-open">

	<c:forEach items="${payment }" var="pay">
		<c:set value="${pay.seller }" var="seller"></c:set>
		<c:set value="${pay.buyer }" var="buyer"></c:set>
		<c:set value="${pay.p_state }" var="state"></c:set>
	</c:forEach>


	<c:forEach items="${message }" var="msg">
		<c:set value="${msg.mr_seq }" var="mr_seq"></c:set>
	</c:forEach>


	<div id="track_div" class="container position-relative">

		<div
			class="navbar navbar-fixed-top track-status-bar chromeInstallAdjust margin-top-0"
			style="z-index: 94 !important;">
			<div class="row">

				<!-- infobanner 들어오는곳 -->
				<jsp:include page="/WEB-INF/view/inc/management_inc/infobanner.jsp">
					<jsp:param value="${payment }" name="payment" />
					<jsp:param value="${notice }" name="notice" />
					<jsp:param value="${email}" name="email" />
				</jsp:include>
			</div>
		</div>

		<div class="row margin-top-55">
		
			<div class="col-xs-10">
				<div id="trackHeader" class="row">
					<div class="col-xs-12">
						<!-- 결제정보 들어오는곳 -->
						<jsp:include page="/WEB-INF/view/inc/management_inc/payinfo.jsp">
							<jsp:param value="${payment }" name="payment" />
							<jsp:param value="${email }" name="email" />
							<jsp:param value="${time }" name="time" />
							<jsp:param value="${cash }" name="cash" />
						</jsp:include>
					</div>
				</div>

				<div id="trackDiv" class="row" style="">
					<div id="trackMsgList" class="col-xs-12">

						<c:if test="${state eq '요청사항 미작성' and email eq buyer}">
							<jsp:include
								page="/WEB-INF/view/inc/management_inc/orderInstruction.jsp">
								<jsp:param value="${process }" name="pro" />
							</jsp:include>
						</c:if>

						<!-- 주문진행  -->
						<!-- 작업전요청사항 -->
						<c:if test="${state ne '요청사항 미작성' }">
							<c:forEach items="${process }" var="pro">
								<c:if test="${pro.pl_content eq '요청사항 작성완료' }">
									<div id="orderInstruction" class="row">
										<div class="col-xs-12">
											<div class="position-relative border-left border-right">
												<div class="track-instruction-body">
													<img class="width-100 position-absolute" style="top: -7px;"
														src="../css/image/track_line3.png">
													<div class="text-center">
														<a id="instructionAnswerHref" class="plain text-center"
															role="button" data-toggle="collapse" href=""
															aria-expanded="true"
															aria-controls="collapseOrderInstructions"> <b>작업
																전 요청사항이 작성되었습니다.&nbsp;</b>
														</a>
													</div>

													<div class="collapse in padding-left-60 padding-right-60"
														id="collapseOrderInstructions">
														<div
															class="panel bg-color-white border-radius-0 work-before-box">
															<div
																class="panel-body padding-left-30 padding-right-30 padding-top-15 padding-bottom-15">
																<div
																	class="work-request padding-top-15 padding-bottom-15">
																	<div class="margin-top-5">
																		<b><span>0</span>1.&nbsp;${pro.t_request }</b><span
																			class="font-size-h6 color-danger">(필수)</span>
																	</div>
																	<ul class="margin-top-5 margin-bottom-0 padding-left-0">
																		<li class="font-color-lighter list-unstyled">

																			<div>
																				<a href=""> <i class="fa fa-paperclip">&nbsp;&nbsp;${pro.pl_file}</i>
																				</a>
																			</div>

																		</li>

																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>


						<!-- 주문진행내역 들어오는곳 -->

						<jsp:include page="/WEB-INF/view/inc/management_inc/orderProcess.jsp">
							<jsp:param value="${payment }" name="payment" />
							<jsp:param value="${process }" name="pro" />
							<jsp:param value="${email }" name="email" />
							<jsp:param value="${state }" name="state" />
							<jsp:param value="${solution}" name="solution" />
							<jsp:param value="${addpay}" name="addpay" />
						</jsp:include>

						<!-- 별 들어오는곳 -->
			 <c:forEach items="${process }" var="pro" varStatus="status" >
				<c:if test="${pro.pl_content eq '평가 미작성' and email eq buyer and status.count eq 1}">
					<jsp:include page="/WEB-INF/view/inc/management_inc/star.jsp">
						<jsp:param value="${ordernum }" name="ordernum"/>
					</jsp:include>
				</c:if>
			</c:forEach> 
				<!--  -->

						<!-- 주문상태가 완료 또는 취소이면 안보임 -->
						<div id="messageBox" style="display: block;">

							<c:if test="${state eq '진행중' and email eq seller }">
								<div id="deliveryBtnWrapper"
									class="row margin-top-20 margin-bottom-20"
									style="display: block;">
									<div class="col-xs-8 col-xs-center">
										<div class="col-xs-offset-4 col-xs-4 position-relative">
											<button class="btn btn-black btn-block btn-sm sendBtn"
												role="button">
												<span>작업물 발송</span>
											</button>
											<div id="trackMessageSendTooltip"
												class="track-message-tooltip">

												<div class="position-absolute top-5 right-10 cursor">x</div>
												버튼을 클릭하여 최종 작업물을<br>발송해주셔야 주문이 완료됩니다.
											</div>
										</div>
									</div>
								</div>
							</c:if>
							
							<c:if test="${state eq '발송중' and email eq buyer }">
								<div id="deliveryActionBtn"
									class="row text-center margin-top-15 margin-bottom-30"> 
									<div class="col-xs-7 col-xs-center">
										<div class="row">
											<div class="col-xs-5">
												<a id="cancelDeliveryBuyerBtn"
													class="btn btn-block btn-default sendBtn" role="button">
													수정요청
												</a>
											</div>

											<div class="col-xs-2 text-center track-between-or-align">
												또는</div>

											<div class="col-xs-5">
												<a id="ratingSellerBtn"
													class="btn btn-block btn-black sendBtn"
													style="width: 177px;">구매확정</a>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						
							<div class="row margin-bottom-30" style="">
								<div class="col-xs-12">
									<!--  -->
									<c:if test='${state eq "진행중" or state eq "발송중"}'>
										<jsp:include
											page="/WEB-INF/view/inc/management_inc/messageSend.jsp">
											<jsp:param value="${payment }" name="payment" />
											<jsp:param value="${time }" name="time" />
											<jsp:param value="${email }" name="email" />
											<jsp:param value="${another }" name="another" />
										</jsp:include>
									</c:if>

									<jsp:include page="/WEB-INF/view/inc/management_inc/delivery.jsp">
										<jsp:param value="${payment }" name="payment" />
										<jsp:param value="${time }" name="time" />
										<jsp:param value="${email }" name="email" />
										<jsp:param value="${another }" name="another" />
									</jsp:include>
									
									<div class="text-center margin-top-20">
										<span class="font-size-h6">거래전</span> <a
											class="plain color-mint a-hover-mint font-size-h6"
											href="/kmongPro/message/message.do?mr_seq=${mr_seq }"
											target="_blank"> 문의 화면 </a> <span class="font-size-h6">으로
											이동하기</span>
									</div>
								</div>
							</div>
						</div>
						<!-- 주문진행끝 -->

					</div>
				</div>
	
			</div>
			
		</div>
		<div class="col-xs-2 padding-left-0 position-relative">
				<div>
					<div class="inline-block bg-color-white cancel-icon-wrap">
						<div class="cancel-modal">
							<img src="../css/image/cancel_modal_icon.png">
						</div>
						<div class="cancel-modal bg-color-fa" style="display: none;">
							<img src="../css/image/cancel_modal_icon_gray.png">
						</div>
					</div>
					<div
						class="panel panel-default border-radius-none margin-top-60 margin-bottom-0">
						<div class="panel-body padding-all-15 text-center"
							style="padding-top: 25px !important;">
							<h6 class="line-height">거래 중 문제가 발생했다면 아래 버튼을 클릭하세요!</h6>
							<a class="btn btn-default btn-sm font-size-h6 btn-block NGB"
								href="" id="errorBtn"> 취소/문제해결 </a>
						</div>
					</div>

				</div>

			</div>
		<!-- 문제해결 페이지 들어오는곳-->
		
		<c:if test="${email eq buyer }">
			<jsp:include page="/WEB-INF/view/inc/management_inc/error_buy.jsp">
				<jsp:param value="${error }" name="error"/>
				<jsp:param value="${ordernum }" name="ordernum"/>
				<jsp:param value="${payment }" name="payment"/>
			</jsp:include>
		</c:if>
		<c:if test="${email eq seller }">
			<jsp:include page="/WEB-INF/view/inc/management_inc/error_sell.jsp">
				<jsp:param value="${error }" name="error"/>
				<jsp:param value="${ordernum }" name="ordernum"/>
				<jsp:param value="${payment }" name="payment"/>
			</jsp:include>
		</c:if>
		<div id="criteo-tags-div" style="display: none;"></div>
</div>

		<script>
   	$(function () {
   		ordernum=${ordernum};
   		email = "${email}";
		$('a#additionalPayBtn').click(function () {
			//$('div#criteo-tags-div').after('<div class="modal-backdrop fade in"></div>');
			$('div#problemResolutionModal').removeClass().attr("class","modal fade in");
			$('div#problemResolutionModal').css("display","block");
		});//click
		
		$('a#errorBtn').click(function (event) {
			event.preventDefault();
			//$('div#criteo-tags-div').after('<div class="modal-backdrop fade in"></div>');
			$('div#problemResolutionModal').removeClass().attr("class","modal fade in");
			$('div#problemResolutionModal').css("display","block");
		});//click
   
	$('#trackMessageSendTooltip>div.position-absolute').click(function () {
		$("div#trackMessageSendTooltip").remove();
	});
	
	$("button.sendBtn").click(function () {
		$("div#delivery").css("display",'block');
		$("div#generalMsg").css("display",'none');
		$("div#trackMessageSendTooltip").remove();
		$("button.sendBtn").remove();
	});//click
	
	$("div#generalbtn>a#sendMessageBtn").click(function () {
		if($('.form-group>input#generalMessageTxtArea').val().trim() !="") {
		$.ajax({			 
			 url:"fileupload.do",
			 dataType:'json',
			 type:'post',
			 data: {
				 content : $('.form-group>input#generalMessageTxtArea').val(),
				file : $('#generalfile').get(0).files[0].name,
				orderNum : ordernum,
				email: email
				} ,
			success:function(data){
				if (data.complete=="complete") {
					location.reload();
				}
			 }
		 });//ajax
		}
	});//click
	
	$("div#deliverybtn>a#sendMessageBtn").click(function () {
		if($('.message-box-action-body>input#textbox').val().trim() !="") {
		$.ajax({			 
			 url:"deliveryupload.do",
			 dataType:'json',
			 type:'post',
			 data: {
				 content : $('.message-box-action-body>input#textbox').val(),
				file : $('#deliveryfile').get(0).files[0].name,
				orderNum : ordernum,
				email : email
				} ,
			success:function(data){
				if (data.complete=="complete") {
					location.reload();
					$("div#deliveryBtnWrapper").remove();
			 }
			}
		 });//ajax
		}
	});//click
	
	$("div#request>a#submitInstructionBtn").click(function () {
		$.ajax({			 
			 url:"instruction.do",
			 dataType:'json',
			 type:'post',
			 data: {
				file : $('#instructionFile').get(0).files[0].name
				,orderNum : ordernum,
				email: email
				} ,
			success:function(data){
				if (data.complete=="complete") {
					location.reload();
				}
			 }
		 });//ajax
	});//click
	
			$("a#starm").click(function () {
				value = parseFloat($("div#starRatingValue").text());
				if (value>0) {
					value=parseFloat(value-0.5);
				console.log(value.toFixed(2));
					$("div#starRatingValue").text(value.toFixed(1));
				}
					$("span#evalu").css("width", value.toFixed(2)*20+"%" );
					$('input[name="star"]').val(value.toFixed(2));
			});
			
			$("a#starp").click(function () {
				value = parseFloat($("div#starRatingValue").text());
				if (value<5) {
					value=parseFloat(value+0.5);
					console.log(value.toFixed(2));
					$("div#starRatingValue").text(value.toFixed(2));
				}
					$("span#evalu").css("width", value.toFixed(2)*20+"%" );
					$('input[name="star"]').val(value.toFixed(2));
			});
			
			$('div#evaluation>button#starBtn').click(function () {
				var starparam = $('#starForm').serialize();
				$.ajax({			 
					 url:"evaluation.do",
					 dataType:'json',
					 type:'post',
					 data: starparam ,
					success:function(data){
						if (data.complete=="complete") {
							location.reload();
						}
					 }
				 });//ajax
			});
			
			$('div.col-xs-5>a#cancelDeliveryBuyerBtn').click(function () {
				 $.ajax({			 
					 url:"cancelDelivery.do",
					 dataType:'json',
					 type:'post',
					 data: {
						 orderNum : ordernum
					 } ,
					success:function(){
							location.reload();
					 }
				 });//ajax 
			});
			
			$('div.col-xs-5>a#ratingSellerBtn').click(function () {
				 $.ajax({			 
					 url:"ratingSeller.do",
					 dataType:'json',
					 type:'post',
					 data: {
						 orderNum : ordernum
					 } ,
					success:function(){
							location.reload();
							$("div#deliveryActionBtn").remove();
						}
				 });//ajax
			});
			
			$("div#error>button.close").click(function () {
				//$('div#criteo-tags-div').after('<div class="modal-backdrop fade in"></div>');
				$('div#problemResolutionModal').removeClass().attr("class","modal fade");
				$('div#problemResolutionModal').css("display","none");
			});
			
			$("div#addpay").click(function () {
				$("div#additionalOptionsBody").css("display","block");
			});
			
			$("div#cancelpay").click(function () {
				$("div#additionalOptionsBody").css("display","none");
			});
			
			$('div.col-xs-3>button#errorsubmit').click(function () {
				var errorparam = $('#errorForm').serialize();
				$.ajax({			 
					 url:"errorRequest.do",
					 dataType:'json',
					 type:'post',
					 data: errorparam ,
					success:function(data){
						if (data.complete=="complete") {
							location.reload();
							$('div#problemResolutionModal').removeClass().attr("class","modal fade");
							$('div#problemResolutionModal').css("display","none");
						}
					 }
				 });//ajax
			});
			
   	});//function
   </script>
</body>
</html>
