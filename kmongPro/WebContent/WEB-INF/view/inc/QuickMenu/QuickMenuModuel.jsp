<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/QuickMenu_style.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker3.css" />
<link rel="stylesheet" href="css/kmong_buy.css" />
<link rel="stylesheet" href="css/kmong_desktop_v2-6ec7c3f31.css" />
<link rel="stylesheet" href="css/kmong_fonts.css" />
<link rel="stylesheet" href="css/kmong-99952b2854.master_desktop.css" />
<link rel="stylesheet" href="css/mykmong_main.css" />

<link href="https://kmong.com/css/kmong_fonts.css?v=1.1"
	rel="stylesheet">
</head>

<style>
@media ( max-width : 1300px) .kmong-quick-menu-wrap .mainFixed {
	position
	:
	 
	fixed
	!important;
	
    
	bottom
	:
	 
	30
	px
	!important;
	

}

.kmong-quick-menu {
	width: 70px;
	position: fixed;
	top: 50%;
	right: 70px;
	z-index: 93;
}
</style>
<script>
	$(function() {

		// 검색완료되면 kbCategoryQueryBody display로바꿔줌
		$('#search')
				.keydown(
						function(key) {
							if (key.keyCode == 13) {
								/* http://localhost:8080/kmongPro/search.faq.do?searchKeyword= */
								//$('#kmongKnowledgeBase').css('display', 'block');
								var param = "searchKeyword="
										+ $('#search').val();
								alert(param);
								$
										.ajax({
											url : "search.faq.do",
											dataType : 'json',
											type : 'POST',
											data : param,
											success : function(data) {
												$(data.search)
														.each(
																function(index,
																		value) {
																	$(
																			'#kbCategoryQueryBody')
																			.prepend(
																					'<li class="border-bottom-solid padding-bottom-10 padding-top-10 bg-color-transparent border-radius-none kmong-kb-search cursor padding-left-0 padding-right-0 deleteYong" id="litag"> <h4>'
																							+ value.f_sub
																							+ '</h4> <span class="font-size-h6 line-clamp-small-2 padding-right-15"> '
																							+ value.f_con
																							+ '</span> </li>');
																});

												$('#kbCategoryAccordion')
														.prop('style',
																'display:none');

											}
										});

							}
						});

	});
</script>
<script>
	$(function() {
		$('#kmongNotificationMenuDiv').click(function() {
			$('#kmongKnowledgeBase').css('display', 'block');
			$('.dfc').css('display','none');
		});
		$('#findClose').click(function() {
			$('#kbCategoryAccordion').prop('style', 'display:block');
			$('#kbCategoryQueryBody').prop('style', '');
			$('.deleteYong').remove();
		});
	});
</script>
<script>
	$(function() {

		var modalLayer2 = $("#modalLayer2");
		var modalCont2 = $(".modalContent2");
		var marginLeft = modalCont2.outerWidth() / 2;
		var marginTop = modalCont2.outerHeight() / 2;

		$(document).ready(function() {
			$('#kmongKnowledgeBase').css('display', 'none');
		});

		$('#arrowToggle_0').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody0').css('display', 'block');
		});
		$('#arrowToggle_1').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody1').css('display', 'block');
		});
		$('#arrowToggle_2').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody2').css('display', 'block');
		});
		$('#arrowToggle_3').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody3').css('display', 'block');
		});
		$('#arrowToggle_4').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody4').css('display', 'block');
		});
		$('#arrowToggle_5').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody5').css('display', 'block');
		});
		$('#arrowToggle_6').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody6').css('display', 'block');
		});
		$('#arrowToggle_7').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody7').css('display', 'block');
		});
		$('#arrowToggle_8').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody8').css('display', 'block');
		});
		$('#arrowToggle_9').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody9').css('display', 'block');
		});
		$('#arrowToggle_10').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody10').css('display', 'block');
		});
		$('#arrowToggle_11').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody11').css('display', 'block');
		});
		$('#arrowToggle_12').click(function() {
			$('.panel-collapse').css('display', 'none');
			$('#kbCategoryBody12').css('display', 'block');
		});

		$('#search').keyup(function() {
			$('#keyup').css('display', 'block');
		});

		$('#keyup').click(function() {
			$('#search').prop('value', '');
			$(this).css('display', 'none');
		});

		$('#close').click(function() {
			$('#kmongKnowledgeBase').css('display', 'none');
		});

		$('.closed').click(function() {
			$('#kbCategoryAccordion').css('display', 'block');
			$('.asdf').css('display', 'none');

		});

		$('#select0').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected0 ').css('display', 'block');

		});
		$('#select1').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected1 ').css('display', 'block');

		});
		$('#select2').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected2 ').css('display', 'block');

		});
		$('#select3').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected3 ').css('display', 'block');

		});
		$('#select4').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected4 ').css('display', 'block');

		});
		$('#select5').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected5 ').css('display', 'block');

		});
		$('#select6').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected6 ').css('display', 'block');

		});
		$('#select7').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected7 ').css('display', 'block');

		});
		$('#select8').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected8 ').css('display', 'block');

		});
		$('#select9').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected9 ').css('display', 'block');

		});
		$('#select10').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected10 ').css('display', 'block');

		});
		$('#select11').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected11 ').css('display', 'block');

		});
		$('#select12').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected12 ').css('display', 'block');

		});
		$('#select13').click(function() {
			$('#kbCategoryAccordion').css('display', 'none');
			$('#selected13 ').css('display', 'block');

		});
		$('#kmongHelpCenterLink').click(function() {
			$('#kmongHelpCenter').css('display', 'block');
			$('#center').prop('class', 'kmongKBNav col-xs-4 active');
			$('#que').prop('class', 'kmongKBNav col-xs-4 ');
			$('#kmong').prop('class', 'kmongKBNav col-xs-4 ');
			$('#kmongFAQ').css('display', 'none');
			$('#kmongNotifications').css('display', 'none');
		});
		$('#kmongFAQLink').click(function() {
			$('#kmongFAQ').css('display', 'block');
			$('#kmongHelpCenter').css('display', 'none');
			$('#kmongNotifications').css('display', 'none');
			$('#center').prop('class', 'kmongKBNav col-xs-4');
			$('#que').prop('class', 'kmongKBNav col-xs-4 active');
			$('#kmong').prop('class', 'kmongKBNav col-xs-4 ');
		});

		$('#kmongNotificationLink').click(function() {
			$('#center').prop('class', 'kmongKBNav col-xs-4');
			$('#que').prop('class', 'kmongKBNav col-xs-4 ');
			$('#kmong').prop('class', 'kmongKBNav col-xs-4 active');
			$('#kmongNotifications').css('display', 'block');
			$('#kmongFAQ').css('display', 'none');
			$('#kmongHelpCenter').css('display', 'none');

		});

		$('#howto').click(function() {
			$('#kmongManual').css('display', 'block');
			wrapWindowByMask();
			$('#kmongManual').prop('class', 'modal fade in');
		});
		$('.kmong-how-close').click(function() {
			$('#kmongManual').css('display', 'none');
			$('#kmongManual').prop('class', 'modal fade');
			$('#mask').hide();
		});

		$('#sendHelpCenterForm').click(
				function() {
					var param = "mailsender=" + $('#mailsender').val()
							+ "&mailTitle=" + $('#mailTitle').val()
							+ "&mailText=" + $('#mailText').val();

					$.ajax({
						url : "http://localhost:8080/kmongPro/one_qna.do",
						dataType : "json",
						type : "POST",
						data : param,
						success : function(data) {
							if (data.Success == "성공") {
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
								$('#kmongKnowledgeBase').css('display','none');
							} else {
								alert("전송에 실패하였습니다. 다시 시도해주세요.");
							}
						}
					})
				});
		
		$('#TOPgo').click(function (){

			$("body").scrollTop(0);
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
		$('#mask').fadeTo("slow", 0.7);
	}
</script>
<body>
	<div id="quickMenuFixed"
		class="inline-block text-center kmong-quick-menu"
		style="z-index: 2000; position: absolute;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="kmong-quick-menu-wrap mainFixed">
			<div class="panel panel-default margin-bottom-10">
				<div class="panel-body padding-all-15">
					<div class="row margin-bottom-15">
						<div class="col-xs-12">
							<div class="padding-bottom-15 border-bottom-solid">
								<c:choose>
									<c:when test="${sessionID eq null }">

										<a href="http://localhost:8080/kmongPro/login.do"
											class="plain font-color-lighter cursor sendGAEventClz"
											data-name="퀵 메뉴 - 찜한상품"> <img class="width-20px"
											src="css/image/ic_bookmark.png">
											<div class="margin-top-5">찜한상품</div> <span class="color-red"></span>

										</a>
									</c:when>
									<c:otherwise>
										<a
											href="http://localhost:8080/kmongPro/my_profile.HeartList.do"
											class="plain font-color-lighter cursor sendGAEventClz"
											data-name="퀵 메뉴 - 찜한상품"> <img class="width-20px"
											src="css/image/ic_bookmark.png">
											<div class="margin-top-5">찜한상품</div> <span class="color-red"></span>

										</a>
									</c:otherwise>
								</c:choose>



							</div>
						</div>
					</div>
					<div class="row margin-bottom-15">
						<div class="col-xs-12" id="howto">
							<div class="padding-bottom-15 border-bottom-solid">
								<a class="plain font-color-lighter cursor sendGAEventClz"
									> <img class="width-20px"
									src="css/image/ic_kmong_how.png">
									<div class="margin-top-5">구매방법</div>
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">

							<nav id="kmongNotificationMenuDiv" style="">
								<div class="row position-relative margin-none">
									<div
										class="col-xs-12 padding-all-0 position-relative text-center cursor sendGAEventClz"
										data-name="퀵 메뉴 - 크몽안내">
										<div class="">

											<img class="width-25px" src="css/image/ic_FAQ.png">


										</div>
										<h6 class="margin-none font-color-lighter margin-top-5"
											style="font-size: 10px !important;">크몽안내</h6>

										<div
											class="position-absolute kmong-KB-notification-menu-unread-count cursor"
											style="display: none">
											<span
												class="bg-color-count-red color-white border-round font-size-h6">0</span>
										</div>
									</div>
									<div class="kmong-KB-message-box cursor" style="display: none">
										<div
											class="bg-color-light-yellow word-break kmong-KB-unread-notification-body NGB card-font-size-small"
											style=""></div>
									</div>
								</div>
							</nav>



							<!--  FAQS.jsp 임포트 -->


							<c:import url="http://localhost:8080/kmongPro/faqs.do">

							</c:import>



							<c:import url="http://localhost:8080/kmongPro/howtobuy.do">

							</c:import>


							<style>
.knowledgeBaseDetailContent p {
	margin-bottom: 0;
}

.knowledgeBaseDetailContent>img {
	width: 100%;
}

.twitter-typeahead {
	width: 100%;
}

.tt-menu {
	width: 100%;
	border-top: 2px solid #ffd400;
	text-align: left;
	position: relative;
	z-index: 2;
}

.tt-cursor:hover, .tt-cursor:focus, .tt-cursor {
	color: #F49165 !important;
	cursor: pointer;
}

.kmong-kb-search {
	color: #666;
}

.kmong-kb-search:focus, .kmong-kb-search:hover {
	color: #F49165;
}

.kmong-kb-search span {
	color: #888;
}

.kmong-kb-search:focus span, .kmong-kb-search:hover span {
	color: #444 !important;
}
</style>
							<!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
							<script
								src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
							<script
								src="https://cdn.jsdelivr.net/typeahead.js/0.11.1/typeahead.jquery.min.js"></script>
							<script src="https://kmong.com/js/dropzone.js"></script>


							<script>
								function openToggleFindPassword() {
									var $subFindPasswordDiv = $('#subFindPasswordDiv');
									if ($subFindPasswordDiv.length > 0) {
										if ($subFindPasswordDiv.is(':visible')) {
											$subFindPasswordDiv.fadeOut();
										} else {
											$subFindPasswordDiv.fadeIn();
										}
									} else {
										var content = '';
										if (master_vue.knowledge_bases.length > 0) {
											for ( var i in master_vue.knowledge_bases) {
												var knowledgeBase = master_vue.knowledge_bases[i];
												if (typeof knowledgeBase !== 'undefined'
														&& typeof knowledgeBase.kb !== 'undefined') {
													if (knowledgeBase.kb.length > 0) {
														for ( var j in knowledgeBase.kb) {
															if (knowledgeBase.kb[j].id == 116) {
																content = knowledgeBase.kb[j].content;
																break;
															}
														}
													}
												}

											}
										}

										$('#findPasswordToggleLink').parent()
												.append(
														'<div id="subFindPasswordDiv" class="padding-left-30 margin-top-10">'
																+ content
																+ '</div>')
									}
								}
							</script>
						</div>
					</div>

				</div>
			</div>
			<div id="quickMenuTop">
				<a id="TOPgo"
					class="plain font-size-h6 font-color-light sendGAEventClz"
					data-name="퀵 메뉴 - TOP"> <span>TOP</span> <img
					class="width-10px position-relative" style="top: -1px"
					src="css/image/ic_quick_top.png">
				</a>
			</div>
		</div>


	</div>
	<style>
#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1000;
	background-color: #000;
	display: none;
	left: 0;
}
</style>
	<style>
a {
	color: #000;
}

#modalLayer2 .modalContent2 {
	width: 440px;
	height: 270px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 49%;
	z-index: 1200;
	background: white;
	border-radius: 2%;
}

#modalLayer2 {
	z-index: 1200;
}

#modalLayer .modalContent button {
	position: absolute;
	right: 0;
	top: 0;
	cursor: pointer;
}
</style>

	<div id="mask"></div>

	<div id="modalLayer2" style="display: none; position: relative;">
		<div class="modalContent2" style="margin-left: 50px;">
			<div style="text-align: center; margin-top: 7%;">
				<img src="css/image/successX.png" alt="" />
				<h2>전송완료</h2>

				<p style="margin-top: 7%;" id="pconfig">
					가능한 최대한 빨리 답변드리도록 하겠습니다.<br>감사합니다.
				</p>
			</div>
		</div>
	</div>
</body>
</html>