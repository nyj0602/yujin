<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>2018. 3. 4. - 오전 12:52:58</title>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="../css/kmong_buy.css" />
<link rel="stylesheet" href="../css/kmong_desktop_v2-6ec7c3f31e.css" />
<link rel="stylesheet" href="../css/kmong_fonts.css" />
<link rel="stylesheet" href="../css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="../css/mykmong_main.css" />
<link rel="shortcut icon" href="../image/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</head>
<body>

	<div class="global-body">
		<div id="inbox_refer" class="container">
			<div class="row margin-top-30">
				<div id="inboxLoading" class="col-xs-offset-1 col-xs-10 hidden">
					<div class="row text-center" style="margin-top: 250px;">
						<div class="col-xs-12">
							<img src="..css/image/kmong_loading_f.gif">
						</div>
					</div>
				</div>
				
				<c:forEach items="${message }" var="msg" end="0">
				<c:set value="${ (email eq msg.m_email)? msg.buy_email:msg.m_email }" var="another_mail"></c:set>
				<div id="inboxBodyDiv" class="col-xs-offset-1 col-xs-10">
					<div id="inboxTopDiv"
						class="inbox-detail-top-body bg-color-white border-solid">
						<div class="inline-block">
							<div class="position-relative">
								<a class="plain" href="http://localhost:8080/kmongPro/profile.do?sellerID=${another_mail }"> <img
									class="inbox-detail-top-body-profile-image border-round"
									onerror="this.onerror=null;this.src='../css/image/main_user_gray.png'"
									src="../server/${ (email eq msg.m_email)? msg.buyerprofile:msg.sellprofile }"
									title="${another_mail }">
								</a>
							</div>
						
							<div class="position-relative inbox-detail-top-profile">
								<ul class="list-unstyled margin-bottom-0">
									<li>
										<h4 class="margin-top-0">
											<a class="plain" href="http://localhost:8080/kmongPro/profile.do?sellerID=${another_mail }"> <b>${ (email eq msg.m_email)? msg.buy_email:msg.m_email }</b>
											</a>
										</h4>
										<h5 class="margin-bottom-0">
											평균 응답시간 : 아직몰라요 
											<%-- 
											<c:forEach items="${count}" var="co">
											<c:if test="${email eq seller }">
												<h1>판매자</h1>
											</c:if>
											<c:if test="${email eq buyer }">
												<h1>구매자</h1>
											</c:if>
											</c:forEach>
										<span>&nbsp;&nbsp;|&nbsp;&nbsp;구매한 개수
												: <a
												href="구매관리바로가기"
												class="color-black text-underline">1</a>
											</span>
 										--%>
										</h5>
									</li>
								</ul>

							</div>
						</div>
					
					
						<div class="inline-block pull-right margin-top-20">
							<a class="btn btn-default btn-xss" data-toggle="tooltip"
								data-title="직거래 유도 신고하기" style="cursor: pointer"
								href="https://kmong.com/report_direct?targetname=${another_mail }"
								data-original-title="" title=""> <img
								class="position-relative width-15px"
								src="../css/image/bottom_direct.png"
								title="direct_icon">&nbsp; <span>직거래 신고하기</span>
							</a>
						</div>
					</div>

					<jsp:include page="/WEB-INF/view/message/inc/chatting.jsp">
						<jsp:param value="${message}" name="message"/>
						<jsp:param value="${talent }" name="talent "/>
						<jsp:param value="${chat}" name="chat"/>
					</jsp:include>




					<!-- message-container -->

					<div class="position-relative">
						<div class="row">
							<div class="col-xs-12">
								<div class="message-box-container padding-all-30">
									<div class="message-box-partner-information-body">
										<div class="message-box-partner-username">
											<h6>상대방 email</h6>
											<b>${ another_mail }</b>
										</div>

										<div class="pull-right">
											<div class="message-box-partner-offline-information">

												<div class="message-box-partner-average-response-time">
													<h6>평균응답시간</h6>
													<div>
														<strong>아직몰라요</strong>
													</div>
												</div>
												<div class="message-box-partner-available-time">
													<h6>연락가능시간</h6>
													<c:forEach items="${time }" var="tm">
														<c:if test="${tm.email eq  another_mail  }">
															<strong>${tm.time_1 }&nbsp;~&nbsp;${tm.time_2 }시</strong>
														</c:if>
													</c:forEach>
												</div>
											</div>


										</div>


									</div>
							<form id="message">
									<div class="margin-top-25">
										<div class="position-relative">
											<div class="form-group margin-bottom-0">
												<!-- <textarea id="generalMessageTxtArea"
													class="form-control message-box-textarea messageTextArea"
													data-button="generalMessageSendBtn" rows="4"
													placeholder="안전한 거래를 위해 결제 전 외부 연락처 공개 및 직거래(유도) 시 사이트 이용이 제한될 수 있습니다."></textarea> -->
													<input type="text" id="generalMessageTxtArea"
													class="form-control message-box-textarea messageTextArea"
													data-button="generalMessageSendBtn"
													placeholder="안전한 거래를 위해 결제 전 외부 연락처 공개 및 직거래(유도) 시 사이트 이용이 제한될 수 있습니다." name="content"/>
													<input type="hidden" value="${email }" name="sender"/><input type="hidden" value="${mr_seq }" name="sequence"/>
												<div id="keyword_warning"
													class="message-box-keyword-warning"></div>
											</div>
										</div>

									
										<div class="message-box-footer-body">
											<div class="dropzone-preview"></div>
											<div class="row">
												<div id="generalMessageFileDiv" class="col-xs-7">
													<div class="inline-block">
													</div>
												</div>

												<div class="col-xs-5 text-right">
													<div class="inline-block">
														<a id="sendMessageBtn" class="btn btn-black sendBtn"
															role="button">전송</a>
													</div>
												</div>

											</div>
										</div>
									</div>
							</form>
								</div>
							</div>
						</div>

					</div>
				</div>
				</c:forEach>
			</div>


		</div>

		
	</div>


	<script type="text/javascript">
		$(function () {
			
		$('a#sendMessageBtn').click(function () {
			var params = $('form').serialize();
			if ($('input#generalMessageTxtArea').val().trim() !="") {
				 $.ajax({			 
		 			 url:"send.do",
		 			 dataType:'json',
		 			 type:'post',
		 			 data:  params ,
		 			success:function(data){
		 				if (data.complete=="complete") {
		 					$('input#generalMessageTxtArea').val("");
		 					location.reload();
		 					//$('div.message-container>div.row:last').after('<div class="row" id="inbox_'+data.seq+'"><div><div class="message-right"><div class="inline-block message-right-arrow"></div><div class="inline-block message-right-body"><div class="message-right-bubble-body position-relative"><div>'+data.content+'</div></div><div class="message-right-time"><span class="color-primary message-unread"></span>&nbsp; &nbsp;'+data.datetime+'</div></div></div>	</div></div>');
						}
					}
				});//ajax
			}
				
			});//click
		});//function
	</script>

</body>
</html>

